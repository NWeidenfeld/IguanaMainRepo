------- INITIALIZATION BEGIN -------
------------------------------------

local config = require 'Config'
local IsFiltered=require('mdacc.hl7.filter_msg')()
local Build=require('mdacc.hl7.construct_msg')()
require 'CodemapUtil'

------- INITIALIZATION END ---------
------------------------------------

function main(Data)
	
   -- 1. Parse inbound message
   local InBoundMsg, MessageType = hl7.parse{vmd=config.inVMD,data=Data}
   -- 2A. Check if message type is not supported
   if (MessageType~='Catchall') then
      -- 3A. Filter the message if it fails validation parameters
      if (not IsFiltered[MessageType](InBoundMsg)) then
         -- 4. Construct the Message
         -- All transform and queue.push will be performed by the  Build function
         Build[MessageType](InBoundMsg,MessageType)
      else
         -- 3B. Validation failed - filter the message
         iguana.logWarning("Message Filtered:\n"..Data)        
      end
   else
      -- 2B. Message type not supported - ignoring message
      trace('Message Ignored: '..Data)
   end
end