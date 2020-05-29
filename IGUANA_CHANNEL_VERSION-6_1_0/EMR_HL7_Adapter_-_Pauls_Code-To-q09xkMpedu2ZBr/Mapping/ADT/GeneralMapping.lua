------- INITIALIZATION BEGIN -------
------------------------------------

local codeset = require 'Codesets'

------- INITIALIZATION END ---------
------------------------------------

-- Build each message segment
local function BuildMSH(inMsg,outMsg,set)
   outMsg.MSH:mapTree(inMsg.MSH)
   outMsg.MSH[3][1]    =   inMsg.MSH[3][1]
   outMsg.MSH[4][1]    =   inMsg.MSH[4][1]
   outMsg.MSH[5][1]    =   inMsg.MSH[5][1]
   outMsg.MSH[6][1]    =   inMsg.MSH[6][1]
   outMsg.MSH[7]       =   inMsg.MSH[7]
   outMsg.MSH[8]       =   inMsg.MSH[8]
   outMsg.MSH[9][1]    =   inMsg.MSH[9][1]
   outMsg.MSH[9][2]    =   inMsg.MSH[9][2]
   outMsg.MSH[9][3]    =   inMsg.MSH[9][3]
   outMsg.MSH[10]      =   inMsg.MSH[10]
   outMsg.MSH[11][1]   =   inMsg.MSH[11][1]
   outMsg.MSH[12][1]   =   inMsg.MSH[12][1]
   outMsg.MSH[15]      =   inMsg.MSH[15]
   outMsg.MSH[16]      =   inMsg.MSH[16]
end

local function BuildSFT(inMsg,outMsg,set)
   --SFT is not defined in inbound VMD
   outMsg.SFT[1][1][1] =   ''
   outMsg.SFT[1][2]    =   ''
   outMsg.SFT[1][3]    =   ''
   outMsg.SFT[1][4]    =   ''
   outMsg.SFT[1][5]    =   ''
   outMsg.SFT[1][6]    =   ''
end

local function BuildUAC(inMsg,outMsg,set)
   --UAC is not defined in inbound VMD
   outMsg.UAC[1][1]   =   ''
   outMsg.UAC[1][2]   =   ''
   outMsg.UAC[1][3]   =   ''
   outMsg.UAC[1][4]   =   ''
   outMsg.UAC[1][5]   =   ''
   outMsg.UAC[1][6]   =   ''
   outMsg.UAC[1][7]   =   ''
   outMsg.UAC[1][8]   =   ''
   outMsg.UAC[1][9]   =   ''
   outMsg.UAC[2][1][1]=   ''
   outMsg.UAC[2][2]   =   ''
   outMsg.UAC[2][3]   =   ''
   outMsg.UAC[2][4]   =   ''
   outMsg.UAC[2][5]   =   ''
end

local function BuildEVN(inMsg,outMsg,set)
   outMsg.EVN:mapTree(inMsg.EVN)
   outMsg.EVN[1]           =   inMsg.EVN[1]
   outMsg.EVN[2]           =   inMsg.EVN[2]
   outMsg.EVN[3]           =   inMsg.EVN[3]
   outMsg.EVN[4][1]        =   inMsg.EVN[4][1]
   outMsg.EVN[5][1][1]     =   inMsg.EVN[5][1][1]
   outMsg.EVN[5][1][2][1]  =   inMsg.EVN[5][1][2][1]
   outMsg.EVN[5][1][3]     =   inMsg.EVN[5][1][3]
   outMsg.EVN[5][1][4]     =   inMsg.EVN[5][1][4]
   outMsg.EVN[5][1][9][1]  =   inMsg.EVN[5][1][9][1]
   outMsg.EVN[5][1][14][1] =   inMsg.EVN[5][1][14][1]
end

local function BuildPID(inMsg,outMsg,set)
   outMsg.PID:mapTree(inMsg.PID)
   outMsg.PID[1]           =   inMsg.PID[1]
   outMsg.PID[2]           =   inMsg.PID[2]
   outMsg.PID[3][1][1]     =   inMsg.PID[3][1][1]
   outMsg.PID[3][1][5]     =   inMsg.PID[3][1][5]
   outMsg.PID[4]           =   inMsg.PID[4]
   outMsg.PID[5][1][1][1]  =   inMsg.PID[5][1][1][1]
   outMsg.PID[5][1][2]     =   inMsg.PID[5][1][2]
   outMsg.PID[5][1][3]     =   inMsg.PID[5][1][3]
   outMsg.PID[5][1][4]     =   inMsg.PID[5][1][4]
   outMsg.PID[5][1][5]     =   inMsg.PID[5][1][5]
   outMsg.PID[7]           =   inMsg.PID[7]
   outMsg.PID[8][1]        =   set["administrative sex"][inMsg.PID[8][1]]
   outMsg.PID[10][1][1]    =   inMsg.PID[10][1][1]
   outMsg.PID[11][1][1][1] =   inMsg.PID[11][1][1][1]
   outMsg.PID[11][1][3]    =   inMsg.PID[11][1][3]
   outMsg.PID[11][1][4]    =   inMsg.PID[11][1][4]
   outMsg.PID[11][1][5]    =   inMsg.PID[11][1][5]
   outMsg.PID[11][1][6]    =   inMsg.PID[11][1][6]
   outMsg.PID[11][1][9][1] =   inMsg.PID[11][1][9][1]
   outMsg.PID[12]          =   inMsg.PID[12]
   for i=1, #inMsg.PID[13] do
      outMsg.PID[13][i][1] =   inMsg.PID[13][i][1]
      outMsg.PID[13][i][2] =   inMsg.PID[13][i][2]
      outMsg.PID[13][i][3] =   inMsg.PID[13][i][3]
   end
   for i=1, #inMsg.PID[14] do
      outMsg.PID[14][i][1] =   inMsg.PID[14][i][1]
      outMsg.PID[14][i][2] =   inMsg.PID[14][i][2]
      outMsg.PID[14][i][3] =   inMsg.PID[14][i][3]
   end
   outMsg.PID[15][1]       =   inMsg.PID[15][1]
   outMsg.PID[16][1]       =   set["marital status"][inMsg.PID[16][1]]
   outMsg.PID[17][1]       =   inMsg.PID[17][1]
   outMsg.PID[18][1]       =   inMsg.PID[18][1]
   outMsg.PID[19]          =   inMsg.PID[19]
   outMsg.PID[20]          =   inMsg.PID[20][1]
   outMsg.PID[21][1][1]    =   inMsg.PID[21][1][1]
   for i = 1, #inMsg.PID[22] do
      outMsg.PID[22][i]    =   inMsg.PID[22][i]
   end
   outMsg.PID[27][1]       =   inMsg.PID[27][1]
   outMsg.PID[30]          =   inMsg.PID[30]


end

local function BuildPD1(inMsg,outMsg,set)
   outMsg.PD1:mapTree(inMsg.PD1)
   outMsg.PD1[1][1][1] =   inMsg.PD1[1][1][1]
   outMsg.PD1[3][1][1] =   inMsg.PD1[3][1][1]
   outMsg.PD1[3][1][3] =   inMsg.PD1[3][1][3]
   outMsg.PD1[4]       =   inMsg.PD1[4][1][1]
end

local function BuildARV(inMsg,outMsg,set)
   --ARV is not defined in inbound VMD
end

local function BuildCON(inMsg,outMsg,set)
   --CON not defined in outbound VMD
   for i=1, #inMsg.CON do

   end
end

local function BuildNTE(inMsg,outMsg,set)
   --NTE not defined in outbound VMD
   for i=1, # inMsg.NTE do
   end
end

local function BuildNK1(inMsg,outMsg,set)
   for i=1, #inMsg.NK1 do
      outMsg.NK1[i]:mapTree(inMsg.NK1[i])
      outMsg.NK1[i][1]          =   inMsg.NK1[i][1]
      outMsg.NK1[i][2][1][1][1] =   inMsg.NK1[i][2][1][1][1]
      outMsg.NK1[i][2][1][2]    =   inMsg.NK1[i][2][1][2]
      outMsg.NK1[i][3][1]       =   inMsg.NK1[i][3][1]
      outMsg.NK1[i][4][1][1][1] =   inMsg.NK1[i][4][1][1][1]
      outMsg.NK1[i][4][1][3]    =   inMsg.NK1[i][4][1][3]
      outMsg.NK1[i][4][1][4]    =   inMsg.NK1[i][4][1][4]
      outMsg.NK1[i][4][1][5]    =   inMsg.NK1[i][4][1][5]
      outMsg.NK1[i][4][1][6]    =   inMsg.NK1[i][4][1][6]
      outMsg.NK1[i][4][1][9][1] =   inMsg.NK1[i][4][1][9][1]
      for j=1, #inMsg.NK1[i][5] do
         outMsg.NK1[i][5][j][1] =   inMsg.NK1[i][5][j][1]
         outMsg.NK1[i][5][j][3] =   inMsg.NK1[i][5][j][3]
         end
      for k=1, #inMsg.NK1[i][6] do
         outMsg.NK1[i][6][k][1] =   inMsg.NK1[i][6][k][1]
         outMsg.NK1[i][6][k][3] =   inMsg.NK1[i][6][k][3]
         end
      outMsg.NK1[i][7][1]       =   inMsg.NK1[i][7][1]
      outMsg.NK1[i][8]          =   inMsg.NK1[i][8]
      outMsg.NK1[i][9]          =   inMsg.NK1[i][9]
      outMsg.NK1[i][10]         =   inMsg.NK1[i][10]
      outMsg.NK1[i][13]         =   inMsg.NK1[i][13]
      outMsg.NK1[i][16]         =   inMsg.NK1[i][16]
      outMsg.NK1[i][33][1][1]   =   inMsg.NK1[i][33][1][1]
      outMsg.NK1[i][34][1]      =   inMsg.NK1[i][34][1]
   end
end

local function BuildPV1(inMsg,outMsg,set)
   outMsg.PV1:mapTree(inMsg.PV1)
   outMsg.PV1[1]           =   inMsg.PV1[1]
   outMsg.PV1[2][1]        =   inMsg.PV1[2][1]
   outMsg.PV1[3][1][1]     =   inMsg.PV1[3][1][1]
   outMsg.PV1[3][2][1]     =   inMsg.PV1[3][2][1]
   outMsg.PV1[3][3][1]     =   inMsg.PV1[3][3][1]
   outMsg.PV1[3][4][1]     =   inMsg.PV1[3][4][1]
   outMsg.PV1[4][1]        =   inMsg.PV1[4][1]
   outMsg.PV1[7][1][1]     =   inMsg.PV1[7][1][1]
   outMsg.PV1[7][1][2][1]  =   inMsg.PV1[7][1][2][1]
   outMsg.PV1[7][1][3]     =   inMsg.PV1[7][1][3]
   outMsg.PV1[7][1][4]     =   inMsg.PV1[7][1][4]
   outMsg.PV1[7][1][13]    =   inMsg.PV1[7][1][13]
   outMsg.PV1[8][1][1]     =   inMsg.PV1[8][1][1]
   outMsg.PV1[8][1][2][1]  =   inMsg.PV1[8][1][2][1]
   outMsg.PV1[8][1][3]     =   inMsg.PV1[8][1][3]
   outMsg.PV1[8][1][4]     =   inMsg.PV1[8][1][4]
   outMsg.PV1[8][1][13]    =   inMsg.PV1[8][1][13]
   outMsg.PV1[9][1][1]     =   inMsg.PV1[9][1][1]
   outMsg.PV1[9][1][2][1]  =   inMsg.PV1[9][1][2][1]
   outMsg.PV1[9][1][3]     =   inMsg.PV1[9][1][3]
   outMsg.PV1[9][1][4]     =   inMsg.PV1[9][1][4]
   outMsg.PV1[9][1][13]    =   inMsg.PV1[9][1][13]
   outMsg.PV1[10][1]       =   inMsg.PV1[10][1]
   outMsg.PV1[11][1][1]    =   inMsg.PV1[11][1][1]
   outMsg.PV1[11][2][1]    =   inMsg.PV1[11][2][1]
   outMsg.PV1[11][3][1]    =   inMsg.PV1[11][3][1]
   outMsg.PV1[11][4][1]    =   inMsg.PV1[11][4][1]
   outMsg.PV1[11][5]       =   inMsg.PV1[11][5]
   outMsg.PV1[11][6]       =   inMsg.PV1[11][6]
   outMsg.PV1[11][7][1]    =   inMsg.PV1[11][7][1]
   outMsg.PV1[11][8][1]    =   inMsg.PV1[11][8][1]
   outMsg.PV1[12][1]       =   inMsg.PV1[12][1]
   outMsg.PV1[14][1]       =   inMsg.PV1[14][1]
   outMsg.PV1[15][1][1]    =   inMsg.PV1[15][1][1]
   outMsg.PV1[16][1]       =   inMsg.PV1[16][1]
   outMsg.PV1[17][1][1]    =   inMsg.PV1[17][1][1]
   outMsg.PV1[17][1][2][1] =   inMsg.PV1[17][1][2][1]
   outMsg.PV1[17][1][3]    =   inMsg.PV1[17][1][3]
   outMsg.PV1[17][1][4]    =   inMsg.PV1[17][1][4]
   outMsg.PV1[17][1][13]   =   inMsg.PV1[17][1][13]
   outMsg.PV1[18][1]       =   inMsg.PV1[18][1]
   outMsg.PV1[19][1]       =   inMsg.PV1[19][1]
   outMsg.PV1[20][1][1][1] =   inMsg.PV1[20][1][1][1]
   outMsg.PV1[36][1]       =   inMsg.PV1[36][1]
   outMsg.PV1[37][1][1]    =   inMsg.PV1[37][1][1]
   outMsg.PV1[37][2]       =   inMsg.PV1[37][2]
   outMsg.PV1[38][1]       =   inMsg.PV1[38][1][1]
   outMsg.PV1[41][1]       =   inMsg.PV1[41][1]
   outMsg.PV1[42][1][1]    =   inMsg.PV1[42][1][1]
   outMsg.PV1[42][2][1]    =   inMsg.PV1[42][2][1]
   outMsg.PV1[42][3][1]    =   inMsg.PV1[42][3][1]
   outMsg.PV1[42][4][1]    =   inMsg.PV1[42][4][1]
   outMsg.PV1[42][5]       =   inMsg.PV1[42][5]
   outMsg.PV1[42][6]       =   inMsg.PV1[42][6]
   outMsg.PV1[42][7][1]    =   inMsg.PV1[42][7][1]
   outMsg.PV1[42][8][1]    =   inMsg.PV1[42][8][1]
   outMsg.PV1[43][1][1]    =   inMsg.PV1[43][1][1]
   outMsg.PV1[43][2][1]    =   inMsg.PV1[43][2][1]
   outMsg.PV1[43][3][1]    =   inMsg.PV1[43][3][1]
   outMsg.PV1[43][4][1]    =   inMsg.PV1[43][4][1]
   outMsg.PV1[43][5]       =   inMsg.PV1[43][5]
   outMsg.PV1[43][6]       =   inMsg.PV1[43][6]
   outMsg.PV1[43][7][1]    =   inMsg.PV1[43][7][1]
   outMsg.PV1[43][8][1]    =   inMsg.PV1[43][8][1]
   outMsg.PV1[44]          =   inMsg.PV1[44]
   outMsg.PV1[45]          =   inMsg.PV1[45]
   outMsg.PV1[47]          =   inMsg.PV1[47]
   outMsg.PV1[50][1]       =   inMsg.PV1[50][1]
   outMsg.PV1[53]          =   inMsg.PV1[53]
   outMsg.PV1[54][1]       =   inMsg.PV1[54][1]
   
end

local function BuildPV2(inMsg,outMsg,set)
   outMsg.PV2:mapTree(inMsg.PV2)
   outMsg.PV2[2][1]  =   inMsg.PV2[2][1]
   outMsg.PV2[3][1]     =   inMsg.PV2[3][1][1]
   outMsg.PV2[3][2]     =   inMsg.PV2[3][1][2]
   outMsg.PV2[3][3]     =   inMsg.PV2[3][1][3]
   outMsg.PV2[3][9]     =   inMsg.PV2[3][1][9]
   outMsg.PV2[8]        =   inMsg.PV2[8]
   outMsg.PV2[9]        =   inMsg.PV2[9]
   outMsg.PV2[10]       =   inMsg.PV2[10]
   outMsg.PV2[12]       =   inMsg.PV2[12]
   outMsg.PV2[21][1]    =   inMsg.PV2[21][1]
   outMsg.PV2[22]       =   inMsg.PV2[22]
   outMsg.PV2[23][1][1] =   inMsg.PV2[23][1][1]
   outMsg.PV2[24][1]    =   inMsg.PV2[24][1]
   outMsg.PV2[38][1]    =   inMsg.PV2[38][1]
   outMsg.PV2[40][1]    =   inMsg.PV2[40][1]
end

local function BuildOBX(inMsg,outMsg,set)
   for i=1, #inMsg.OBX do
      outMsg.OBX[i]:mapTree(inMsg.OBX[i])
      outMsg.OBX[i][1]    =   inMsg.OBX[i][1]
      outMsg.OBX[i][2]    =   inMsg.OBX[i][2]
      outMsg.OBX[i][3][1] =   inMsg.OBX[i][3][1]
      outMsg.OBX[i][3][2] =   inMsg.OBX[i][3][2]
      outMsg.OBX[i][4]    =   inMsg.OBX[i][4]
      outMsg.OBX[i][5][1] =   inMsg.OBX[i][5][1]
      outMsg.OBX[i][6][1] =   inMsg.OBX[i][6][1]
      outMsg.OBX[i][14]   =   inMsg.OBX[i][14]
   end
end

local function BuildROL(inMsg,outMsg,set)
   for i=1,#inMsg.ROL do
      outMsg.ROL[i]:mapTree(inMsg.ROL[i])
      outMsg.ROL[i][1][1]       =   inMsg.ROL[i][1][1]
      outMsg.ROL[i][2]          =   inMsg.ROL[i][2][1]
      outMsg.ROL[i][3][1]       =   inMsg.ROL[i][3][1]
      outMsg.ROL[i][4][1][1]    =   inMsg.ROL[i][4][1][1]
      outMsg.ROL[i][4][1][2][1] =   inMsg.ROL[i][4][1][2][1]
      outMsg.ROL[i][4][1][3]    =   inMsg.ROL[i][4][1][3]
      outMsg.ROL[i][4][1][9][1] =   inMsg.ROL[i][4][1][9][1]
      outMsg.ROL[i][4][1][13]   =   inMsg.ROL[i][4][1][13]
      outMsg.ROL[i][5]          =   inMsg.ROL[i][5]
      outMsg.ROL[i][6]          =   inMsg.ROL[i][6]
      outMsg.ROL[i][8][1]       =   inMsg.ROL[i][8][1]
   
   end
end

local function BuildAL1(inMsg,outMsg,set)
   for i = 1, # inMsg.AL1 do
      outMsg.AL1[i]:mapTree(inMsg.AL1[i])
      outMsg.AL1[i][1] =   inMsg.AL1[i][1]
      outMsg.AL1[i][2][1] =   inMsg.AL1[i][2][1]
      outMsg.AL1[i][3][1] =   inMsg.AL1[i][3][1]
      outMsg.AL1[i][3][2] =   inMsg.AL1[i][3][2]
      outMsg.AL1[i][3][3] =   inMsg.AL1[i][3][3]
      outMsg.AL1[i][4][1] =   inMsg.AL1[i][4][1]
      outMsg.AL1[i][5][1] =   inMsg.AL1[5][1]
      outMsg.AL1[i][6]    =   inMsg.AL1[i][6]
      --                  =   inMsg.AL1[i][9][1]
   end
end

local function BuildFT1(inMsg,outMsg,set)
   --FT1 not defined in outbound VMD
   --             =   inMsg.FT1[4]
   --             =   inMsg.FT1[10]
   --             =   inMsg.FT1[19][1][1]
   --             =   inMsg.FT1[21][1]
   --             =   inMsg.FT1[25][1]
   --             =   inMsg.FT1[25][2]
   --             =   inMsg.FT1[25][3]
   --             =   inMsg.FT1[25][4]
   --             =   inMsg.FT1[25][5]
end

local function BuildDG1(inMsg,outMsg,set)
   for i=1, # inMsg.DG1 do 
      outMsg.DG1[i]:mapTree(inMsg.DG1[i])
      outMsg.DG1[i][1]    =   inMsg.DG1[i][1]
      outMsg.DG1[i][2]    =   inMsg.DG1[i][2]
      outMsg.DG1[i][3][2] =   inMsg.DG1[i][3][2]
      outMsg.DG1[i][4]    =   inMsg.DG1[i][4]
      outMsg.DG1[i][6][1] =   inMsg.DG1[i][6][1]
      outMsg.DG1[i][6][2] =   inMsg.DG1[i][6][2]
      outMsg.DG1[i][21]   =   inMsg.DG1[i][21]
      
   end
end

local function BuildDRG(inMsg,outMsg,set)
   --DRG not defined in inbound VMD
   outMsg.DRG[1][1]     =   ''
   outMsg.DRG[2]        =   ''
   outMsg.DRG[3]        =   ''
   outMsg.DRG[4][1]     =   ''
   outMsg.DRG[5][1]     =   ''
   outMsg.DRG[6]        =   ''
   outMsg.DRG[7][1][1]  =   ''
   outMsg.DRG[7][1][2]  =   ''
   outMsg.DRG[8][1]     =   ''
   outMsg.DRG[9][1][1]  =   ''
   outMsg.DRG[9][1][2]  =   ''
   outMsg.DRG[10]       =   ''
   outMsg.DRG[11][1]    =   ''
   outMsg.DRG[12][1][1] =   ''
   outMsg.DRG[12][2]    =   ''
   outMsg.DRG[13][1]    =   ''
   outMsg.DRG[14][1]    =   ''
   outMsg.DRG[15]       =   ''
   outMsg.DRG[16][1]    =   ''
   outMsg.DRG[16][2]    =   ''
   outMsg.DRG[17][1]    =   ''
   outMsg.DRG[18]       =   ''
   outMsg.DRG[19]       =   ''
   outMsg.DRG[20][1]    =   ''
   outMsg.DRG[21][1]    =   ''
   outMsg.DRG[21][2]    =   ''
   outMsg.DRG[22][1]    =   ''
   outMsg.DRG[22][2]    =   ''
   outMsg.DRG[23][1]    =   ''
   outMsg.DRG[23][2]    =   ''
   outMsg.DRG[24][1]    =   ''
   outMsg.DRG[24][2]    =   ''
   outMsg.DRG[25]       =   ''
   outMsg.DRG[26][1]    =   ''
   outMsg.DRG[27][1]    =   ''
   outMsg.DRG[28][1]    =   ''
   outMsg.DRG[29][1]    =   ''
   outMsg.DRG[30][1]    =   ''
   outMsg.DRG[31][1]    =   ''
   outMsg.DRG[32][1]    =   ''
   outMsg.DRG[33][1]    =   ''
end

local function BuildPR1(inMsg,outMsg,set)
for i=1, #inMsg.PR1 do
      outMsg.PROCEDURE[i].PR1:mapTree(inMsg.PR1[i])
      outMsg.PROCEDURE[i].PR1[3][1] =   inMsg.PR1[i][3][1]
      outMsg.PROCEDURE[i].PR1[3][2] =   inMsg.PR1[i][3][2]
      outMsg.PROCEDURE[i].PR1[3][3] =   inMsg.PR1[i][3][3]
      outMsg.PROCEDURE[i].PR1[3][4] =   inMsg.PR1[i][3][4]
      outMsg.PROCEDURE[i].PR1[3][5] =   inMsg.PR1[i][3][5]
      outMsg.PROCEDURE[i].PR1[3][6] =   inMsg.PR1[i][3][6]
      outMsg.PROCEDURE[i].PR1[5]    =   inMsg.PR1[i][5]
      outMsg.PROCEDURE[i].PR1[11] =   inMsg.PR1[i][11][1]
      end
end

local function BuildGT1(inMsg,outMsg,set)
   outMsg.GT1:mapTree(inMsg.GT1)
   outMsg.GT1[1][1]           =   inMsg.GT1[1]
   outMsg.GT1[1][2][1][1]     =   inMsg.GT1[2][1][1]
   outMsg.GT1[1][3][1][1][1]  =   inMsg.GT1[3][1][1][1]
   outMsg.GT1[1][3][1][2]     =  inMsg.GT1[3][1][2]
   outMsg.GT1[1][5][1][1][1]  =   inMsg.GT1[5][1][1][1]
   outMsg.GT1[1][5][1][3]     =   inMsg.GT1[5][1][3]
   outMsg.GT1[1][5][1][4]     =   inMsg.GT1[5][1][4]
   outMsg.GT1[1][5][1][5]     =   inMsg.GT1[5][1][5]
   outMsg.GT1[1][5][1][6]     =   inMsg.GT1[5][1][6]
   outMsg.GT1[1][5][1][9][1]  =   inMsg.GT1[5][1][9][1]
   for i=1,#inMsg.GT1[6] do
      outMsg.GT1[1][6][i][1]  =   inMsg.GT1[6][i][1]
      end
   for j=1, #inMsg.GT1[7] do
      outMsg.GT1[1][7][j][1]  =   inMsg.GT1[7][j][1]
      end
   outMsg.GT1[1][8]           =   inMsg.GT1[8]
   outMsg.GT1[1][9][1]        =   inMsg.GT1[9][1]
   outMsg.GT1[1][10][1]       =   inMsg.GT1[10][1]
   outMsg.GT1[1][11][1]       =   inMsg.GT1[11][1]
   outMsg.GT1[1][16][1][1][1] =   inMsg.GT1[16][1][1]
   outMsg.GT1[1][17][1][1][1] =   inMsg.GT1[17][1][1][1]
   outMsg.GT1[1][17][1][3]    =   inMsg.GT1[17][1][3]
   outMsg.GT1[1][17][1][4]    =   inMsg.GT1[17][1][4]
   outMsg.GT1[1][17][1][5]    =   inMsg.GT1[17][1][5]
   outMsg.GT1[1][17][1][6]    =   inMsg.GT1[17][1][6]
   outMsg.GT1[1][18][1][1]    =   inMsg.GT1[18][1][1]
   outMsg.GT1[1][20][1]       =   inMsg.GT1[20][1]
   outMsg.GT1[1][49]          =   inMsg.GT1[49]
   
end

local function BuildIN1(inMsg,outMsg,set)
   outMsg.IN1:mapTree(inMsg.IN1)
   outMsg.IN1[1]           =   inMsg.IN1[1]
   outMsg.IN1[2][1]        =   inMsg.IN1[2][1]
   outMsg.IN1[2][2]        =   inMsg.IN1[2][2]
   outMsg.IN1[3][1][1]     =   inMsg.IN1[3][1][1]
   outMsg.IN1[4][1][1]     =   inMsg.IN1[4][1][1]
   outMsg.IN1[8]           =   inMsg.IN1[8]
   outMsg.IN1[9][1][1]     =   inMsg.IN1[9][1][1]
   outMsg.IN1[12]          =   inMsg.IN1[12]
   outMsg.IN1[16][1][1][1] =   inMsg.IN1[16][1][1][1]
   outMsg.IN1[16][1][2]    =   inMsg.IN1[16][1][2]
   outMsg.IN1[17][1]       =   inMsg.IN1[17][1]
   outMsg.IN1[18]          =   inMsg.IN1[18]
   outMsg.IN1[19][1][1][1] =   inMsg.IN1[19][1][1][1]
   outMsg.IN1[19][1][3]    =   inMsg.IN1[19][1][3]
   outMsg.IN1[19][1][4]    =   inMsg.IN1[19][1][4]
   outMsg.IN1[19][1][5]    =   inMsg.IN1[19][1][5]
   outMsg.IN1[19][1][6]    =   inMsg.IN1[19][1][6]
   outMsg.IN1[19][1][9][1] =   inMsg.IN1[19][1][9][1]
   outMsg.IN1[22]          =   inMsg.IN1[22]
   outMsg.IN1[35][1]       =   inMsg.IN1[35][1]
   outMsg.IN1[36]          =   inMsg.IN1[36]
   outMsg.IN1[43][1]       =   inMsg.IN1[43][1]
   outMsg.IN1[44][1][6]    =   inMsg.IN1[44][1][6]
   outMsg.IN1[47][1]       =   inMsg.IN1[47][1]
end

local function BuildIN2(inMsg,outMsg,set)
   outMsg.IN2:mapTree(inMsg.IN2)
   outMsg.IN2[5][1][1]   =   inMsg.IN2[5][1][1]
   outMsg.IN2[61][1]     =   inMsg.IN2[61][1]
   outMsg.IN2[63][1][1]  =   inMsg.IN2[63][1][1]
end

local function BuildIN3(inMsg,outMsg,set)
   --Inbound VMD does not have IN3 defined
end

local function BuildACC(inMsg,outMsg,set)
   outMsg.ACC:mapTree(inMsg.ACC)
end

local function BuildUB1(inMsg,outMsg,set)
   --UB1 not defined in inbound VMD
end

local function BuildUB2(inMsg,outMsg,set)
   outMsg.UB2:mapTree(inMsg.UB2)
end

local function BuildIAM(inMsg,outMsg,set)
   --IAM not defined in outbound VMD
   for i=1, #inMsg.IAM do

   end
end

local function BuildPDA(inMsg,outMsg,set)
   --PDA not defined in inbound VMD
end

local function BuildZIF(inMsg,outMsg,set)
   --ZIF not defined in outbound VMD

end





--main function
function BuildGeneralMessage(inMsg, outMsg,set) 

   -- Create one BuildXXX per Segment
   BuildMSH(inMsg,outMsg,set)
   BuildEVN(inMsg,outMsg,set)
   BuildSFT(inMsg,outMsg,set)
   BuildUAC(inMsg,outMsg,set)
   BuildPID(inMsg,outMsg,set)
   BuildPD1(inMsg,outMsg,set)
   BuildARV(inMsg,outMsg,set)
   BuildCON(inMsg,outMsg,set)
   BuildNK1(inMsg,outMsg,set)
   BuildNTE(inMsg,outMsg,set)
   BuildPV1(inMsg,outMsg,set)
   BuildPV2(inMsg,outMsg,set)
   BuildOBX(inMsg,outMsg,set)
   BuildROL(inMsg,outMsg,set)
   BuildAL1(inMsg,outMsg,set)
   BuildFT1(inMsg,outMsg,set)
   BuildDG1(inMsg,outMsg,set)
   BuildDRG(inMsg,outMsg,set)
   BuildPR1(inMsg,outMsg,set)
   BuildGT1(inMsg,outMsg,set)
   for i=1, #inMsg.INSURANCE do
      BuildIN1(inMsg.INSURANCE[i],outMsg.INSURANCE[i],set)
      BuildIN2(inMsg.INSURANCE[i],outMsg.INSURANCE[i],set)
      BuildIN3(inMsg.INSURANCE[i],outMsg.INSURANCE[i],set)
   end
   BuildACC(inMsg,outMsg,set)
   BuildUB1(inMsg,outMsg,set)
   BuildUB2(inMsg,outMsg,set)
   BuildIAM(inMsg,outMsg,set)
   BuildPDA(inMsg,outMsg,set)
   BuildZIF(inMsg,outMsg,set)

	trace(outMsg)
   -- .
   -- .
   -- end of build message


end

return BuildMessage