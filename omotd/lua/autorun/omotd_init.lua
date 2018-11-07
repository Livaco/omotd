local function conprint(msg)

  MsgC(Color(200, 200, 200), "[")
  MsgC(Color(120, 255, 120), "OMOTD")
  MsgC(Color(200, 200, 200), "] ")
  MsgC(Color(200, 200, 200), msg)
  MsgC(Color(200, 200, 200), "\n")

end

OMOTD = OMOTD or {}
OMOTD.Config = OMOTD.Config or {}
OMOTD.Config.bLogs = OMOTD.Config.bLogs or {}
OMOTD.Lang = OMOTD.Lang or {}
OMOTD.Staff = OMOTD.Staff or {}

include("omotdlua/config/omotd_config.lua")
include("omotdlua/config/omotd_lang.lua")

if SERVER then

  conprint("Loading serverside...")

  AddCSLuaFile("omotdlua/config/omotd_config.lua") conprint("omotdlua/config/omotd_config.lua (AddCSLuaFile)")
  AddCSLuaFile("omotdlua/config/omotd_lang.lua") conprint("omotdlua/config/omotd_lang.lua (AddCSLuaFile)")
  AddCSLuaFile("omotdlua/vgui/omotd_avatarmask.lua") conprint("omotdlua/vgui/omotd_avatarmask.lua (AddCSLuaFile)")
  AddCSLuaFile("omotdlua/cl_omotd.lua") conprint("omotdlua/cl_omotd.lua (AddCSLuaFile)")

  include("omotdlua/sv_omotd.lua") conprint("omotdlua/sv_omotd.lua")

  conprint("Loaded.")

else

  conprint("Loading clientside...")

  include("omotdlua/vgui/omotd_avatarmask.lua") conprint("omotdlua/vgui/omotd_avatarmask.lua")
  include("omotdlua/cl_omotd.lua") conprint("omotdlua/cl_omotd.lua")

  conprint("Loaded.")

end