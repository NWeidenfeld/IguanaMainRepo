
astmutil={}


function astmutil.checksum(s)
   -- Some test data may have wrong delimiters, e.g. \r\n or single \n instead of \r. 
   -- Checksum calculation is defined for \r not \n delimiters.
   -- Checksum below is defined to strip <STX>, but not <ETX>, nor <ETB>.
   s=s:gsub('\n','\r')
   
   local function zfill(s,N)
      if s:len() < N then
         repeat
            s = '0' .. s
         until s:len() == N
      end 
      return s
   end
   
   
   local r=0
   for b in string.gfind(s, ".") do
      if string.byte(b) == 2 then r=-2 end -- equivalent to strip <STX> which is \x02
      r=string.byte(b)+r
   end
   r=string.format("%x", tostring(((r)%256))):upper()
   r=zfill(r,2)
   return r
end


function astmutil.validate(s) 
   local a = checksum(s:sub(1,-3))
   local b = s:sub(-2,-1)
   if a == b then
      return true
   end
end


local function timestamp()
   local a,b = math.modf(os.clock())
   if b==0 then 
      b='000' 
   else 
      b=tostring(b):sub(3,5) 
   end
   
   local tf=os.date('%Y-%m-%d %H:%M:%S.',os.time())
   return (tf..b)  
end


function astmutil.logs(s)
   
    local function writeBinary(binData)
      OUTPUT_DIR = 'C:\\listener2web'
      FILE_PATTERN = 'astmListenerDebug.log' 
      fPath=OUTPUT_DIR..'\\'
   
      local fn=fPath..FILE_PATTERN  
      local f = io.open(fn, "ab")
      f:write(binData)
      f:close()   
    end
   
   local s = timestamp()..'\t'..s..'\n\n' 
   
   print(s) --[[ Please note that Windows cannot display this output properly in Command Prompt window. Rather read this output from suggested above log file or use a debugger. Having said that, this output will show all right in OS X terminal or in any *nix shell.]]
   
   writeBinary(s)-- should be wrtten to file or so ..., in production version.
end



function astmutil.postJson (s)
   
   local ltn12 = require 'ltn12'
   local http = require 'socket.http'
   
   local requestbody = s
   local responsebody 
   
   b, c, h = http.request {
      url = "http://'admin':'password'@192.168.5.4:6545/astm",
      method = 'POST',
      headers = {     
         ["Content-Type"] =  "application/json",
         ["Content-Length"] = tostring(string.len(requestbody))
      },
      source = ltn12.source.string(requestbody),
      sink = ltn12.sink.table(responsebody)
   }
   
   if c == 200 then astmutil.logs('POST retuned OK') end
end