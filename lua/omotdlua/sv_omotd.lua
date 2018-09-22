include("config/omotd_config.lua")
AddCSLuaFile("config/omotd_config.lua")
OMOTD.Staff = OMOTD.Staff or {}
util.AddNetworkString("omotd_openmotd")
util.AddNetworkString("omotd_requestopenmotd")

function OMOTD:Initalize()

  OMOTD:Print("Initalizing.")
  include("omotdlua/cl_omotd.lua")
  include("omotdlua/vgui/omotd_avatarmask.lua")
  OMOTD:Print("Initalized.")

end

function OMOTD:Print(msg)

  MsgC(Color(200, 200, 200), "[")
  MsgC(Color(120, 255, 120), "OMOTD")
  MsgC(Color(200, 200, 200), "] ")
  MsgC(Color(200, 200, 200), msg)
  MsgC(Color(200, 200, 200), "\n")

end

hook.Add("PlayerSay", "omotd_playersayhook", function(ply, text)
  
  local textnocaps = string.lower(text)
  if(string.sub(textnocaps, 1, 5) == "!motd") then

    net.Start("omotd_openmotd")
    net.WriteTable(OMOTD.Staff)
    net.Send(ply)

  end

end)


net.Receive("omotd_requestopenmotd", function(len, ply) -- Had to do it this way because it's this file that stores the staff table.

  net.Start("omotd_openmotd")
  net.WriteTable(OMOTD.Staff)
  net.Send(ply)

end)


hook.Add("PlayerInitialSpawn", "omotd_cache_staff", function(ply)
    if table.HasValue(OMOTD.Config.StaffGroups, ply:GetUserGroup()) then
        table.insert(OMOTD.Staff, ply)
    end
end)

hook.Add("PlayerDisconnected", "omotd_uncache_staff", function(ply)
    if table.HasValue(OMOTD.Staff, ply) then
        table.RemoveByValue(OMOTD.Staff, ply)
    end
end)
