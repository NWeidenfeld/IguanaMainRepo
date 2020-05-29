---------- DO NOT MODIFY -----------
------------------------------------
--[[
Minor modifications of the codeset JSON message to reformat it.
]]

local codemap = require 'codemap'
local codeset = require 'Codesets'
   local newmap = {}   
   for i,v in pairs(codeset) do
      trace(i,v)
      newmap[i] = codemap.map(v.codes,v.default)
      end
   return newmap

---------- DO NOT MODIFY -----------
------------------------------------
   