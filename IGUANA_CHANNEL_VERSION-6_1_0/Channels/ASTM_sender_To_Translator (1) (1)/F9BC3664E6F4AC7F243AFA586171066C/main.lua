require('astm_send')
require('stringutil')
require('astmutil')


-- Data (frames) must be enclosed in leading STX and trailing ETX, or ETB.
-- 'ASTM Sender' has no way to know if frame has to be terminated with ETX or ETB unless it has been promptly sopecified in data itself.

function main(Data)
   
   local data = Data:split('\002')
   table.remove(data,1)
   
   for i=1,#data do 
      data[i]:trimRNL()
      data[i]='\002'..data[i]
   end
   
   data = addchecksum(data)
   
   local Success, err = astm_send.send(
      data,
      '192.168.5.4', -- host
      6559,          -- port
      10,            -- timeout
      true)          -- live
   if not Success then 
      iguana.logError(err) 
   end  
   
end


function addchecksum(data)
   for i=1,#data do
      local d = data[i]:trimRNL() 
      local ck=astmutil.checksum(d)
      data[i]=d..ck..'\r' 
   end
   return data
end