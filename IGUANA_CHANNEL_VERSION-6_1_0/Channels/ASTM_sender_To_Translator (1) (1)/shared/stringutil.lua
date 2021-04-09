-- stringutil contains a number of extensions to the standard Lua String library. 
-- As you can see writing extra methods that will work on strings is very easy. 
-- See http://www.lua.org/manual/5.1/manual.html#5.4 for documentation on the Lua String library

function string.trimNonWS(self)  
   local L, R
   L = #self
   while _isNotWhite(self:byte(L)) do
      L = L - 1
      if _isWhite(self:byte(L)) then return self:sub(1,L) end
    end  
   return self:sub(1,L)
end


function _isNotWhite(byte) 
   return byte ~= 32 or byte ~= 9
end


function string.split(s, d)
   local t = {}
   local i = 0
   local f
   local match = '(.-)' .. d .. '()'
   if string.find(s, d) == nil then
      return {s}
   end
   for sub, j in string.gfind(s, match) do
      i = i + 1
      t[i] = sub
      f = j
   end
   if i~= 0 then
      t[i+1]=string.sub(s,f)
   end
   return t
end


-- Trims white space on both sides.
function string.trimWS(self)  
   local L, R
   L = #self
   while _isWhite(self:byte(L)) and L > 1 do
      L = L - 1
   end
   R = 1
   while _isWhite(self:byte(R)) and R < L do
      R = R + 1
   end     
   return self:sub(R, L)
end

-- Trims white space on right side.
function string.trimRWS(self)
   local L
   L = #self
   while _isWhite(self:byte(L)) and L > 0 do
      L = L - 1
   end
   return self:sub(1, L)
end

-- Trims white space on left side.
function string.trimLWS(self)
   local R = 1
   local L = #self
   while _isWhite(self:byte(R)) and R < L do
      R = R + 1
   end
   return self:sub(R, L)
end

function _isWhite(byte) 
   return byte == 32 or byte == 9
end

-- Trims '\n' on right side.
function string.trimRNL(self)
   local L
   L = #self
   while _isNL(self:byte(L)) and L > 0 do
      L = L - 1
   end
   return self:sub(1, L)
end

-- Trims '\r' on right side.
function string.trimRCR(self)
   local L
   L = #self
   while _isCR(self:byte(L)) and L > 0 do
      L = L - 1
   end
   return self:sub(1, L)
end

function _isWhite(byte) 
   return byte == 32 or byte == 9
end

function _isNL(byte) 
   return byte == 10
end

function _isCR(byte) 
   return byte == 13
end

-- This routine will replace multiple spaces with single spaces 
function string.compactWS(self) 
   return self:gsub("%s+", " ") 
end

-- This routine capitalizes the first letter of the string
-- and returns the rest in lower characters
function string.capitalize(self)
   local R = self:sub(1,1):upper()..self:sub(2):lower()
   return R
end
