--
-- Here we expose a single function, connect(), that opens
-- an astm_tcp connection to a remote host, and returns a table
-- to interact with.  
--
-- When debugging, it actually returns a fake connection, 
-- which can be sent ASTM messages, and
-- replies with ACKs (one ACK per message sent).
--
-- If you want to test a real astm_tcp connection in the editor,
-- pass live=true along with your connection settings.
--
-- require('astm_tcp')
--
-- local s = astm_tcp.connect{host='frink',port=8086}
-- s:send(Data)
-- local Ack = s:recv()
-- s:close()
--

__astm_tcp = {
   send_astm_tcp = function(s, msg)
      local sent, text = 0, msg
      repeat
         sent = sent + s:send(text, sent+1)
      until sent >= text:len()
      return sent
   end;
   recv_astm_tcp = function(s, buf)
      buf=s:recv()
      return buf
   end;
   real_meta = {
      __index = {
         send = function(self, msg)
            return __astm_tcp.send_astm_tcp(self.s, msg)
         end;
         recv = function(self)
            local msg, skipped
            msg = __astm_tcp.recv_astm_tcp(self.s, self.buf)
            return msg
         end;
         close = function(self)
            self.s:close()
         end
      }
   };

   --
   -- Metatable for Simulation
   --

   simulation_meta = {
      __index = {
         send = function(self, msg)
            if not self.connected then
               error('not connected', 2)
            end
            self.sent = msg
            return msg:len()
         end;
         recv = function(self)
            if not self.connected then
               error('not connected', 2)
            elseif not self.sent then
               error('timeout', 2)
            else
               local got = '\006' -- ASTM flow control ACK
               self.sent = nil
               return got
            end
         end;
         close = function(self)
            self.connected = false
         end
      }
   };
   
   --
   -- Error Checking
   --

   check_arg = function(args, k, t, optional)
      local help = [[Connect to a remote astm_tcp host.
Takes a table with the following required entries:
  'host' - the hostname of the remote site
  'port' - the port on the remote site
and optionally these entries:
  'timeout' - maximum wait time, in seconds (default 5s)
  'live'    - create live astm_tcp connections in the editor
e.g. local s = astm_tcp.connect{host='hostname',port=8086}
     s:send(Data)
     local Ack = s:recv()
     s:close()
]]
      if not args then
         error(help, 3)
      elseif type(args) ~= 'table' then
         error('Parameter 1 is not a table.\n'..help, 3)
      elseif not optional and not args[k] then
         error("Parameter '"..k.."' is required.\n"..help, 3)
      elseif args[k] and type(args[k]) ~= t then
         error("Parameter '"..k.."' should be a "..t..'.\n'..help, 3)
      end
   end;
}

--
-- Public Interface
--

astm_tcp = {}

function astm_tcp.connect(args)
   local required, optional = false, true
   __astm_tcp.check_arg(args, 'host',    'string',  required)
   __astm_tcp.check_arg(args, 'port',    'number',  required)
   __astm_tcp.check_arg(args, 'timeout', 'number',  optional)
   __astm_tcp.check_arg(args, 'live',    'boolean', optional)
   
   if args.live or not iguana.isTest() then
      -- Normal behaviour (in running channel).
      args.live = nil
      local Success, Socket = pcall(net.tcp.connect, args)
      if not Success then
         -- raise error to caller level
         error(Socket, 2)
      end
      return setmetatable({
            s   = Socket,
            buf = '',  -- input buffer.
         }, __astm_tcp.real_meta)
   else
      -- Simulate behaviour while editing.
      return setmetatable({
            connected = true,
         }, __astm_tcp.simulation_meta)
   end
end 
