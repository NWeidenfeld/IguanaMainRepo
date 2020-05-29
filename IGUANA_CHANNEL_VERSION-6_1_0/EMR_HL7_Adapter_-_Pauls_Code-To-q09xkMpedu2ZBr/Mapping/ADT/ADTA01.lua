------- INITIALIZATION BEGIN -------
------------------------------------

local config = require 'Config'
require 'Mapping.ADT.GeneralMapping'
local set
if config.useCodeMap then
   set = require 'CodemapUtil'
end

------- INITIALIZATION END ---------
------------------------------------

-- Build each segment
local function BuildMSH(inMsg,outMsg)
outMsg.MSH:mapTree(inMsg.MSH)
end

local function BuildSFT(inMsg,outMsg)
--SFT is not defined in inbound VMD
end

local function BuildUAC(inMsg,outMsg)
--UAC is not defined in inbound VMD
end

local function BuildEVN(inMsg,outMsg)
outMsg.EVN:mapTree(inMsg.EVN)
end

local function BuildPID(inMsg,outMsg)
outMsg.PID:mapTree(inMsg.PID)
end

local function BuildPD1(inMsg,outMsg)
--PD1 is not defined in inbound VMD
end

local function BuildARV(inMsg,outMsg)
--ARV is not defined in inbound VMD
end

local function BuildCON(inMsg,outMsg)
--CON not defined in outbound VMD
   for i=1, #inMsg.CON do
      
      end
end

local function BuildNTE(inMsg,outMsg)
--NTE not defined in outbound VMD
   for i=1, # inMsg.NTE do
      
      end
end

local function BuildNK1(inMsg,outMsg)
   for i=1, #inMsg.NK1 do
outMsg.NK1[i]:mapTree(inMsg.NK1[i])
      end
end

local function BuildPV1(inMsg,outMsg)
outMsg.PV1:mapTree(inMsg.PV1)
end

local function BuildPV2(inMsg,outMsg)
outMsg.PV2:mapTree(inMsg.PV2)
end

local function BuildOBX(inMsg,outMsg)
for i=1, #inMsg.OBX do
      outMsg.OBX[i]:mapTree(inMsg.OBX[i])
      end
end

local function BuildROL(inMsg,outMsg)
for i=1,#inMsg.ROL do
      outMsg.ROL[i]:mapTree(inMsg.ROL[i])
      end
end

local function BuildAL1(inMsg,outMsg)
for i = 1, # inMsg.AL1 do
      outMsg.AL1[i]:mapTree(inMsg.AL1[i])
      end
end

local function BuildFT1(inMsg,outMsg)
--FT1 not defined in outbound VMD
end

local function BuildDG1(inMsg,outMsg)
for i=1, # inMsg.DG1 do 
      outMsg.DG1[i]:mapTree(inMsg.DG1[i])
      end
end

local function BuildDRG(inMsg,outMsg)
--DRG not defined in inbound VMD
end

local function BuildPR1(inMsg,outMsg)

end

local function BuildGT1(inMsg,outMsg)
outMsg.GT1:mapTree(inMsg.GT1)
end

local function BuildIN1(inMsg,outMsg)
outMsg.IN1:mapTree(inMsg.IN1)
end

local function BuildIN2(inMsg,outMsg)
outMsg.IN2:mapTree(inMsg.IN2)
end

local function BuildIN3(inMsg,outMsg)
--Inbound VMD does not have IN3 defined
end

local function BuildACC(inMsg,outMsg)
outMsg.ACC:mapTree(inMsg.ACC)
end

local function BuildUB1(inMsg,outMsg)
--UB1 not defined in inbound VMD
end

local function BuildUB2(inMsg,outMsg)
outMsg.UB2:mapTree(inMsg.UB2)
end

local function BuildIAM(inMsg,outMsg)
--IAM not defined in outbound VMD
   for i=1, #inMsg.IAM do
      
      end
end

local function BuildPDA(inMsg,outMsg)
--PDA not defined in inbound VMD
end

local function BuildZIF(inMsg,outMsg)
--ZIF not defined in outbound VMD
   
end



--main function
local function BuildMessage(InBoundMsg,MsgType)
   local OutBoundMsg = hl7.message{vmd=config.outVMD,name=MsgType}
   
   --Contruct Code Map Sets
   --Perfrom General Mapping
   if config.useGeneralMapping then
      BuildGeneralMessage(InBoundMsg, OutBoundMsg, set)
   end
	
   
   --Perform Message Specific Mapping
   
   -- Create one BuildXXX per Segment
   BuildMSH(InBoundMsg,OutBoundMsg)
   BuildEVN(InBoundMsg, OutBoundMsg)
   BuildSFT(InBoundMsg,OutBoundMsg)
   BuildUAC(InBoundMsg,OutBoundMsg)
   BuildPID(InBoundMsg,OutBoundMsg)
   BuildPD1(InBoundMsg,OutBoundMsg)
   BuildARV(InBoundMsg,OutBoundMsg)
   BuildCON(InBoundMsg,OutBoundMsg)
   BuildNK1(InBoundMsg,OutBoundMsg)
   BuildNTE(InBoundMsg,OutBoundMsg)
   BuildPV1(InBoundMsg,OutBoundMsg)
   BuildPV2(InBoundMsg,OutBoundMsg)
   BuildOBX(InBoundMsg,OutBoundMsg)
   BuildROL(InBoundMsg,OutBoundMsg)
   BuildAL1(InBoundMsg,OutBoundMsg)
   BuildFT1(InBoundMsg,OutBoundMsg)
   BuildDG1(InBoundMsg,OutBoundMsg)
   BuildDRG(InBoundMsg,OutBoundMsg)
   BuildPR1(InBoundMsg,OutBoundMsg)
   BuildGT1(InBoundMsg,OutBoundMsg)
   for i=1, #InBoundMsg.INSURANCE do
      BuildIN1(InBoundMsg.INSURANCE[i],OutBoundMsg.INSURANCE[i])
      BuildIN2(InBoundMsg.INSURANCE[i],OutBoundMsg.INSURANCE[i])
      BuildIN3(InBoundMsg.INSURANCE[i],OutBoundMsg.INSURANCE[i])
      end
   BuildACC(InBoundMsg,OutBoundMsg)
   BuildUB1(InBoundMsg,OutBoundMsg)
   BuildUB2(InBoundMsg,OutBoundMsg)
   BuildPDA(InBoundMsg,OutBoundMsg)
   BuildZIF(InBoundMsg,OutBoundMsg)
   
   
   -- .
   -- .
   -- end of build message
   trace(OutBoundMsg)
   --queue.push{data=OutBoundMsg:S()} --< send message to down stream
end

return BuildMessage