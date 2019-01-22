util.AddNetworkString("omotd_openmotd")
util.AddNetworkString("omotd_requestopenmotd")

local function conprint(msg) // Couldn't be assed recreating the function to make it global lol.
  MsgC(Color(200, 200, 200), "[")
  MsgC(Color(120, 255, 120), "OMOTD")
  MsgC(Color(200, 200, 200), "] ")
  MsgC(Color(200, 200, 200), msg)
  MsgC(Color(200, 200, 200), "\n")
end
local RanCheck = false
hook.Add("PlayerConnect", "omotd_checkversion", function()
  if(RanCheck == true) then return end
  conprint("Running version check!")
  http.Post("https://livacoweb.000webhostapp.com/libaries/versions/omotd.php", {RunningVar = "1.2"}, function(result)
    conprint(result)
  end, function(fail)
    conprint(fail)
  end)
  RanCheck = true
end)

hook.Add("PlayerSay", "omotd_playersayhook", function(ply, text)

  local textnocaps = string.lower(text)
  if(string.sub(textnocaps, 1, #OMOTD.Config.OpenCommand) == OMOTD.Config.OpenCommand) then

    net.Start("omotd_openmotd")
    net.WriteTable(OMOTD.Staff)
    net.Send(ply)

    if(OMOTD.Config.bLogs.LogMenuOpen == true) then

      if OMOTD.blogs then

        OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " opened the MOTD.")

      end

    end

  end

end)

-- bLogs

hook.Add("bLogs_FullyLoaded", "omotd_blogsinit", function()
  OMOTD.blogs = bLogs:Module()

  OMOTD.blogs.Category = "Livaco's Scripts"
  OMOTD.blogs.Name     = "OMOTD"
  OMOTD.blogs.Colour   = Color(0, 255, 0, 255)

  bLogs:AddModule(OMOTD.blogs)
end)

net.Receive("omotd_requestopenmotd", function(len, ply) -- Had to do it this way because it's this file that stores the staff table.

  net.Start("omotd_openmotd")
  net.WriteTable(OMOTD.Staff)
  net.Send(ply)

  if(OMOTD.Config.bLogs.LogMenuOpen == true) then

    if OMOTD.blogs then

      OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " opened the MOTD.")

    end

  end

end)

-- Credit to Owain
hook.Add("PlayerInitialSpawn", "omotd_cache_staff", function(ply)

    if table.HasValue(OMOTD.Config.StaffGroups, ply:GetUserGroup()) then

        table.insert(OMOTD.Staff, ply)

        if(OMOTD.Config.bLogs.LogStaffEdit == true) then

          if OMOTD.blogs then

            OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " has been added to the staff menu.")

          end

        end

    end

end)

hook.Add("PlayerDisconnected", "omotd_uncache_staff", function(ply)

    if table.HasValue(OMOTD.Staff, ply) then

        table.RemoveByValue(OMOTD.Staff, ply)

        if(OMOTD.Config.bLogs.LogStaffEdit == true) then

          if OMOTD.blogs then

            OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " has been removed from the staff menu.")

          end

        end

    end

end)

hook.Add("ULibUserGroupChange", "omotd_cashe_live", function(plyid, allows, denies, new, old)

  local ply = player.GetBySteamID(plyid)

  if(ply == false) then

    conprint("Error while updating staff list. Aborting! Send this on a support ticket on my website with any errors that follow.")
    return

  end

  if(table.HasValue(OMOTD.Config.StaffGroups, new)) then

    if(!table.HasValue(OMOTD.Staff, ply)) then

      table.insert(OMOTD.Staff, ply)

      if(OMOTD.Config.bLogs.LogStaffEdit == true) then

        if OMOTD.blogs then

          OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " has been added to the staff menu.")

        end

      end

    end

  else

    if(table.HasValue(OMOTD.Staff, ply)) then

      table.RemoveByValue(OMOTD.Staff, ply)

      if(OMOTD.Config.bLogs.LogStaffEdit == true) then

        if OMOTD.blogs then

          OMOTD.blogs:Log(bLogs:FormatPlayer(ply) .. " has been removed from the staff menu.")

        end

      end

    end

  end

end)
