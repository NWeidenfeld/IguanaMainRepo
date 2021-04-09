require('astm_tcp')

local function astm_initiator(param)   
   
   local dctrl={5,4}  -- flow control ENQ and EOT values, respectively
   local gs
   local inconversation=false
 
   local tcp = astm_tcp.connect{host=param[2],port=param[3],timeout=param[4],live=param[5]}
   
   local function sendit(d)
      if type(d) == 'string' then
         iguana.logDebug ('sending '..d)
         tcp:send(d)
      else
         tcp:send(string.char(d)..'\n')
      end
      
      if d == dctrl[2] then 
         return
      end   
      
      while true do
         local s = tcp:recv()
         gs= s
         if gs then
            return gs
         end
         
      end
   end
   
   gs = sendit(dctrl[1])
   iguana.logDebug ('sent ENQ signal')
   
   if not inconversation and string.byte(gs) ==6 then
      iguana.logDebug ('received ASTM ACK')
      gs=nil
      inconversation=true
   end
   
   if not inconversation and string.byte(gs) ==21 then
      iguana.logDebug ('received ASTM NACK')
      gs=nil
   end
   
   local repeats
   
   
   local function repeatsends(d)
      repeats=repeats-1
      gs=sendit(d)
      if string.byte(gs) == 6 then 
         iguana.logDebug ('received ASTM ACK')
         return 
      elseif repeats > 0 then 
         iguana.logDebug ('received ASTM NACK')
         repeatsends(d) 
      else 
         if repeats == 0 then 
         iguana.logError('failed to transmit frame "'..d..'"')   
         end
         return 
      end
   end
   
   
   local function sendpayload()
      for k,v in ipairs(param[1]) do
         repeats = 5
         repeatsends(param[1][k]..'\n')
      end
   end
   
   
   if inconversation then
      sendpayload()
      gs = sendit(dctrl[2])
      iguana.logDebug ('sent EOT signal')
   elseif not inconversation then
      iguana.logError('remote not accepting') -- some repeat logic could be nice to have.
      return
   end

   tcp:close()
end


-- public

astm_send = {}

function astm_send.send(data,Host,Port,Timeout,Live)
   Success, err = pcall(astm_initiator,{data,Host,Port,Timeout,Live})
   return Success, err
end