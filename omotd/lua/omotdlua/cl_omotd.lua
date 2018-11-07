hook.Add("InitPostEntity", "omotd_initpostentity", function()

  net.Start("omotd_requestopenmotd")
  net.SendToServer()

end)

net.Receive("omotd_openmotd", function()

  local StaffTable = net.ReadTable()

  surface.CreateFont("omotd_steamidfont", {
    font = "Roboto",
    extended = false,
    size = ScrH() * 0.013,
  })
  surface.CreateFont("omotd_buttonfont", {
    font = "Roboto",
    extended = false,
    size = ScrH() * 0.026,
  })
  surface.CreateFont("omotd_announcementfont", {
      font = "Roboto",
      extended = false,
      size = ScrH() * 0.016,
    })
    surface.CreateFont("omotd_timefont", {
      font = "Roboto",
      extended = false,
      size = ScrH() * 0.022,
    })

    surface.CreateFont("omotd_welcomefont", {
      font = "Roboto",
      extended = false,
      size = ScrH() * 0.060,
    })

    surface.CreateFont("omotd_playerfont", {
      font = "Roboto",
      extended = false,
      size = ScrH() * 0.040,
    })

    local TabSelected = "Home"

    local frame = vgui.Create("DFrame")
    frame:SetSize(ScrW() * 0.8, ScrH() * 0.8)
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()
    frame.Paint = function(s, w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50))
      draw.RoundedBox(0, 0, 0, w, h * 0.044, Color(30, 30, 30))
      draw.RoundedBox(0, 0, h * 0.94, w, h * 0.06, Color(30, 30, 30))
      draw.RoundedBox(0, w * 0.892, h * 0.045, w * 0.108, h * 0.895, Color(70, 70, 70))

      surface.SetDrawColor(255, 255, 255, 255)

      draw.SimpleText(string.format(OMOTD.Lang.UITitle, OMOTD.Config.ServerName), "omotd_buttonfont", w * 0.008, h * 0.005, Color(255, 255, 255), 0, 0)
      draw.SimpleText(LocalPlayer():Name(), "omotd_buttonfont", w * 0.04, h * 0.945, Color(200, 200, 200), 0, 0)
      draw.SimpleText(LocalPlayer():SteamID(), "omotd_steamidfont", w * 0.04, h * 0.975, Color(200, 200, 200), 0, 0)

      local Timestamp = os.time()
      local TimeString = os.date("%H:%M:%S", Timestamp)
      draw.SimpleText(TimeString, "omotd_timefont", w * 0.96, h * 0.945, Color(255, 255, 255), 1, 0)

      local DateString = os.date("%d/%m/%Y", Timestamp)
      draw.SimpleText(DateString, "omotd_timefont", w * 0.96, h * 0.965, Color(255, 255, 255), 1, 0)

    end

    local AnnouncementPanel = vgui.Create("DPanel", frame)
    AnnouncementPanel:SetPos(frame:GetWide() * 0.892, frame:GetTall() * 0.047)
    AnnouncementPanel:SetSize(frame:GetWide() * 0.105, frame:GetTall() * 0.89)
    AnnouncementPanel.Paint = function(s, w, h)
    end

    local AnnouncementText = vgui.Create("RichText", AnnouncementPanel)
    AnnouncementText:Dock(FILL)
    function AnnouncementText:PerformLayout()

      self:SetFontInternal("omotd_announcementfont")
      self:SetFGColor(Color(255, 255, 255))

    end
    AnnouncementText:AppendText(OMOTD.Config.AnnouncementText)

    local Avatar = vgui.Create("AvatarCircled", frame)
    Avatar:SetPos(frame:GetWide() * 0.01, frame:GetTall() * 0.945)
    Avatar:SetSize(frame:GetWide() * 0.027, frame:GetTall() * 0.05)
    Avatar:SetPlayer(LocalPlayer(), 255)

    local Home_Panel = vgui.Create("DPanel", frame)
    Home_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Home_Panel:SetPos(0, ScrH() * 0.0665)
    Home_Panel:SetDisabled(false)
    Home_Panel:SetAlpha(255)
    Home_Panel.Paint = function(s, w, h)

      draw.RoundedBox(0, 0, h * 0.025, w, h * 0.25, Color(30, 30, 30))
      draw.NoTexture()
      surface.SetDrawColor(Color(50, 50, 50, 255))
      surface.DrawTexturedRectRotated(w * 0.999, h * 0.15, w * 0.15, h, -15)
      surface.DrawTexturedRectRotated(w * 0.88, h * 0.2, w * 0.01, h * 0.4, -15)

      draw.SimpleText(LocalPlayer():Nick(), "omotd_welcomefont", w * 0.16, h * 0.08, Color(255, 255, 255), 0, 0)
      draw.SimpleText(LocalPlayer():SteamID(), "omotd_buttonfont", w * 0.16, h * 0.16, Color(200, 200, 200), 0, 0)

      draw.SimpleText(OMOTD.Lang.HomeServerInfo, "omotd_welcomefont", w * 0.03, h * 0.3, Color(255, 255, 255), 0, 0)
      draw.SimpleText(string.format(OMOTD.Lang.HomeName, GetHostName()), "omotd_buttonfont", w * 0.03, h * 0.4, Color(255, 255, 255), 0, 0)
      draw.SimpleText(string.format(OMOTD.Lang.HomePlayers, #player.GetAll() ..  "/" .. game.MaxPlayers()), "omotd_buttonfont", w * 0.03, h * 0.44, Color(255, 255, 255), 0, 0)
      draw.SimpleText(string.format(OMOTD.Lang.HomeGamemode, gmod.GetGamemode().Name), "omotd_buttonfont", w * 0.03, h * 0.48, Color(255, 255, 255), 0, 0)
      draw.SimpleText(string.format(OMOTD.Lang.HomeMap, game.GetMap()), "omotd_buttonfont", w * 0.03, h * 0.52, Color(255, 255, 255), 0, 0)

      local mult = 10^(0)
      local timeup = math.floor(CurTime() / 60 * mult + 0.5) / mult

      draw.SimpleText(string.format(OMOTD.Lang.HomeTime, timeup), "omotd_buttonfont", w * 0.03, h * 0.56, Color(255, 255, 255), 0, 0)

    end

    local Home_Avatar = vgui.Create("AvatarCircled", Home_Panel)
    Home_Avatar:SetPos(Home_Panel:GetWide() * 0.01, Home_Panel:GetTall() * 0.05)
    Home_Avatar:SetSize(Home_Panel:GetWide() * 0.14, Home_Panel:GetTall() * 0.2)
    Home_Avatar:SetPlayer(LocalPlayer(), 255)

    local Home_Text = vgui.Create("RichText", Home_Panel)
    Home_Text:SetPos(Home_Panel:GetWide() * 0.03, Home_Panel:GetTall() * 0.64)
    Home_Text:SetSize(Home_Panel:GetWide() * 0.95, Home_Panel:GetTall() * 0.34)
    function Home_Text:PerformLayout()

      self:SetFontInternal("omotd_buttonfont")
      self:SetFGColor(Color(255, 255, 255))

    end
    Home_Text:AppendText(OMOTD.Config.HomeText)


    -- Rules
    local Rule_Panel = vgui.Create("DPanel", frame)
    Rule_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Rule_Panel:SetPos(0, ScrH() * 0.0665)
    Rule_Panel:SetDisabled(true)
    Rule_Panel:SetMouseInputEnabled(true)
    Rule_Panel:SetVisible(false)
    Rule_Panel.Paint = function(s, w, h)
    end

    if(OMOTD.Config.UseURLInRules == true) then

      local Rule_HTML = vgui.Create("DHTML", Rule_Panel)
      Rule_HTML:Dock(FILL)
      Rule_HTML:OpenURL(OMOTD.Config.RuleURL)

    else

      local Rule_Text = vgui.Create("RichText", Rule_Panel)
      Rule_Text:Dock(FILL)
      Rule_Text:DockMargin(Rule_Panel:GetWide() * 0.01, Rule_Panel:GetTall() * 0.005, Rule_Panel:GetWide() * 0.01, Rule_Panel:GetTall() * 0.005)
      function Rule_Text:PerformLayout()

        self:SetFontInternal("omotd_buttonfont")
        self:SetFGColor(Color(255, 255, 255))

      end
      Rule_Text:AppendText(OMOTD.Config.Rules)

    end



    -- Forums
    local Forum_Panel = vgui.Create("DPanel", frame)
    Forum_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Forum_Panel:SetPos(0, ScrH() * 0.0665)
    Forum_Panel:SetDisabled(true)
    Forum_Panel:SetMouseInputEnabled(true)
    Forum_Panel:SetVisible(false)
    Forum_Panel.Paint = function(s, w, h)
    end

    local Forum_HTML = vgui.Create("DHTML", Forum_Panel)
    Forum_HTML:Dock(FILL)
    Forum_HTML:OpenURL(OMOTD.Config.ForumURL)


    -- Steam Group
    local Group_Panel = vgui.Create("DPanel", frame)
    Group_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Group_Panel:SetPos(0, ScrH() * 0.0665)
    Group_Panel:SetDisabled(true)
    Group_Panel:SetMouseInputEnabled(true)
    Group_Panel:SetVisible(false)
    Group_Panel.Paint = function(s, w, h)
    end

    local Group_HTML = vgui.Create("DHTML", Group_Panel)
    Group_HTML:Dock(FILL)
    Group_HTML:OpenURL(OMOTD.Config.GroupURL)


    -- Workshop
    local Workshop_Panel = vgui.Create("DPanel", frame)
    Workshop_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Workshop_Panel:SetPos(0, ScrH() * 0.0665)
    Workshop_Panel:SetDisabled(true)
    Workshop_Panel:SetMouseInputEnabled(true)
    Workshop_Panel:SetVisible(false)
    Workshop_Panel.Paint = function(s, w, h)
    end

    local Workshop_HTML = vgui.Create("DHTML", Workshop_Panel)
    Workshop_HTML:Dock(FILL)
    Workshop_HTML:OpenURL(OMOTD.Config.WorkshopURL)


    -- Donate
    local Donate_Panel = vgui.Create("DPanel", frame)
    Donate_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Donate_Panel:SetPos(0, ScrH() * 0.0665)
    Donate_Panel:SetDisabled(true)
    Donate_Panel:SetMouseInputEnabled(true)
    Donate_Panel:SetVisible(false)
    Donate_Panel.Paint = function(s, w, h)
    end

    local Donate_HTML = vgui.Create("DHTML", Donate_Panel)
    Donate_HTML:Dock(FILL)
    Donate_HTML:OpenURL(OMOTD.Config.DonateURL)

    -- Server Portal
    local Server_Panel = vgui.Create("DPanel", frame)
    Server_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Server_Panel:SetPos(0, ScrH() * 0.0665)
    Server_Panel:SetDisabled(true)
    Server_Panel:SetMouseInputEnabled(true)
    Server_Panel:SetVisible(false)
    Server_Panel.Paint = function(s, w, h)
    end

    local Server_Scroll = vgui.Create("DScrollPanel", Server_Panel)
    Server_Scroll:SetSize(Server_Panel:GetWide(), Server_Panel:GetTall())
    local bar = Server_Scroll:GetVBar()
    function bar:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 120))

    end
    function bar.btnUp:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(90, 90, 90))

    end
    function bar.btnDown:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(90, 90, 90))

    end
    function bar.btnGrip:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(70, 70, 70))

    end

    local Server_Y = 0

    for k,v in ipairs(OMOTD.Config.Servers) do

      local ServerPanel = Server_Scroll:Add("DPanel")
      ServerPanel:SetSize(Server_Scroll:GetWide(), Server_Scroll:GetTall() * 0.15)
      ServerPanel:SetPos(0, Server_Y)
      ServerPanel.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(30, 30, 30))
        draw.SimpleText(v.name, "omotd_welcomefont", w * 0.015, h / 2.5, Color(255, 255, 255), 0, 1)
        draw.SimpleText(v.ip, "omotd_announcementfont", w * 0.02, h / 1.3, Color(255, 255, 255), 0, 1)

      end

      local JoinButton = vgui.Create("DButton", ServerPanel)
      JoinButton:SetSize(ServerPanel:GetWide() * 0.1, ServerPanel:GetTall() * 0.5)
      JoinButton:SetPos(ServerPanel:GetWide() * 0.87, ServerPanel:GetTall() * 0.25)
      JoinButton:SetText("")
      local anim = 0
      JoinButton.Paint = function(s, w, h)

        if(s:IsHovered()) then

          anim = Lerp(0.05, anim, w)

        else

          anim = Lerp(0.05, anim, 0)

        end

        draw.RoundedBox(0, 0, 0, w, h, v.color)
        draw.RoundedBox(0, 0, 0, anim, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.ServersText, "omotd_timefont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

      end

      JoinButton.DoClick = function()

        LocalPlayer():ConCommand("connect " .. v.ip)

      end

      Server_Y = Server_Y + (Server_Scroll:GetTall() * 0.2)

    end


    -- Staff Online
    local Staff_Panel = vgui.Create("DPanel", frame)
    Staff_Panel:SetSize(ScrW() * 0.712, ScrH() * 0.685)
    Staff_Panel:SetPos(0, ScrH() * 0.0665)
    Staff_Panel:SetDisabled(true)
    Staff_Panel:SetMouseInputEnabled(true)
    Staff_Panel:SetVisible(false)
    Staff_Panel.Paint = function(s, w, h)
    end

    local Staff_Scroll = vgui.Create("DScrollPanel", Staff_Panel)
    Staff_Scroll:SetSize(Staff_Panel:GetWide(), Staff_Panel:GetTall())

    local bar = Staff_Scroll:GetVBar()
    function bar:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 120))

    end
    function bar.btnUp:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(90, 90, 90))

    end
    function bar.btnDown:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(90, 90, 90))

    end
    function bar.btnGrip:Paint(w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(70, 70, 70))

    end

    local Staff_Y = 0

    for k,v in ipairs(StaffTable) do

      local StaffPanel = Staff_Scroll:Add("DPanel")
      StaffPanel:SetSize(Staff_Scroll:GetWide(), Staff_Scroll:GetTall() * 0.15)
      StaffPanel:SetPos(0, Staff_Y)
      StaffPanel.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(30, 30, 30))

        draw.SimpleText(v:Nick(), "omotd_playerfont", w * 0.12, h / 2.4, Color(255, 255, 255), 0, 1)
        draw.SimpleText(v:GetUserGroup(), "omotd_buttonfont", w * 0.12, h / 1.6, Color(200, 200, 200), 0, 1)

      end

      local Avatar = vgui.Create("AvatarCircled", StaffPanel)
      Avatar:SetSize(StaffPanel:GetWide() * 0.09, StaffPanel:GetTall() * 0.9)
      Avatar:SetPos(StaffPanel:GetWide() * 0.01, StaffPanel:GetTall() * 0.05)
      Avatar:SetPlayer(v, 255)

      local ProfileButton = vgui.Create("DButton", StaffPanel)
      ProfileButton:SetSize(StaffPanel:GetWide() * 0.15, StaffPanel:GetTall() * 0.5)
      ProfileButton:SetPos(StaffPanel:GetWide() * 0.825, StaffPanel:GetTall() * 0.25)
      ProfileButton:SetText("")
      local anim = 0
      ProfileButton.Paint = function(s, w, h)

        if(s:IsHovered()) then

          anim = Lerp(0.05, anim, w)

        else

          anim = Lerp(0.05, anim, 0)

        end

        draw.RoundedBox(0, 0, 0, w, h, OMOTD.Config.ProfileColor)
        draw.RoundedBox(0, 0, 0, anim, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.StaffText, "omotd_timefont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

      end

      ProfileButton.DoClick = function()

        v:ShowProfile()

      end

      Staff_Y = Staff_Y + (Staff_Scroll:GetTall() * 0.2)

    end

    local ButtonPanel = vgui.Create("DPanel", frame)
    ButtonPanel:SetPos(0, frame:GetTall() * 0.043)
    ButtonPanel:SetSize(frame:GetWide(), frame:GetTall() * 0.04)
    local ButtonBar_Lerp = 0
    ButtonPanel.Paint = function(s, w, h)
    end

    local ButtonX = ButtonPanel:GetWide() * 0.099

    local HomeButton = vgui.Create("DButton", ButtonPanel)
    HomeButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
    HomeButton:SetText("")
    local Home_Lerp = 0
    HomeButton.Paint = function(s, w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))

      if(HomeButton:IsHovered() == true) then

        Home_Lerp = Lerp(0.05, Home_Lerp, w)

      else

        Home_Lerp = Lerp(0.05, Home_Lerp, 0)

      end
      draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.HomeButtonColor)
      draw.RoundedBox(0, 0, 0, Home_Lerp, h, Color(255, 255, 255, 10))
      draw.SimpleText(OMOTD.Lang.HomeButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

      if(TabSelected == "Home") then

        draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

      end

      surface.SetDrawColor(60, 60, 60)
      surface.DrawOutlinedRect(0, 0, w, h)

    end
    HomeButton.DoClick = function()

      Home_Panel:SetDisabled(false)
      Home_Panel:SetAlpha(255)

      Rule_Panel:SetDisabled(true)
      Rule_Panel:SetVisible(false)

      Forum_Panel:SetDisabled(true)
      Forum_Panel:SetVisible(false)

      Group_Panel:SetDisabled(true)
      Group_Panel:SetVisible(false)

      Workshop_Panel:SetDisabled(true)
      Workshop_Panel:SetVisible(false)

      Donate_Panel:SetDisabled(true)
      Donate_Panel:SetVisible(false)

      Server_Panel:SetDisabled(true)
      Server_Panel:SetVisible(false)

      Staff_Panel:SetDisabled(true)
      Staff_Panel:SetVisible(false)

      TabSelected = "Home"

    end

    if(OMOTD.Config.EnableRuleButton == true) then
      local RuleButton = vgui.Create("DButton", ButtonPanel)
      RuleButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      RuleButton:SetPos(ButtonX, 0)
      RuleButton:SetText("")
      local Rule_Lerp = 0
      RuleButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(RuleButton:IsHovered() == true) then

          Rule_Lerp = Lerp(0.05, Rule_Lerp, w)

        else

          Rule_Lerp = Lerp(0.05, Rule_Lerp, 0)

        end
        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.RuleButtonColor)
        draw.RoundedBox(0, 0, 0, Rule_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.RulesButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Rules") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end
      RuleButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(false)
        Rule_Panel:SetVisible(true)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Rules"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableForumButton == true) then
      local ForumButton = vgui.Create("DButton", ButtonPanel)
      ForumButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      ForumButton:SetPos(ButtonX, 0)
      ForumButton:SetText("")
      local Forum_Lerp = 0
      ForumButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(ForumButton:IsHovered() == true) then

          Forum_Lerp = Lerp(0.05, Forum_Lerp, w)

        else

          Forum_Lerp = Lerp(0.05, Forum_Lerp, 0)

        end

        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.ForumButtonColor)
        draw.RoundedBox(0, 0, 0, Forum_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.ForumsButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Forums") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      ForumButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(false)
        Forum_Panel:SetVisible(true)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Forums"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableGroupButton == true) then
      local GroupButton = vgui.Create("DButton", ButtonPanel)
      GroupButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      GroupButton:SetPos(ButtonX, 0)
      GroupButton:SetText("")
      local Group_Lerp = 0
      GroupButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(GroupButton:IsHovered() == true) then

          Group_Lerp = Lerp(0.05, Group_Lerp, w)

        else

          Group_Lerp = Lerp(0.05, Group_Lerp, 0)

        end

        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.GroupButtonColor)
        draw.RoundedBox(0, 0, 0, Group_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.GroupButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Group") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      GroupButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(false)
        Group_Panel:SetVisible(true)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Group"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableWorkshopButton == true) then
      local WorkshopButton = vgui.Create("DButton", ButtonPanel)
      WorkshopButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      WorkshopButton:SetPos(ButtonX, 0)
      WorkshopButton:SetText("")
      local Workshop_Lerp = 0
      WorkshopButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(WorkshopButton:IsHovered() == true) then

          Workshop_Lerp = Lerp(0.05, Workshop_Lerp, w)

        else

          Workshop_Lerp = Lerp(0.05, Workshop_Lerp, 0)

        end
        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.WorkshopButtonColor)
        draw.RoundedBox(0, 0, 0, Workshop_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.WorkshopButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Workshop") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      WorkshopButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(false)
        Workshop_Panel:SetVisible(true)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Workshop"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableDonateButton == true) then
      local DonateButton = vgui.Create("DButton", ButtonPanel)
      DonateButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      DonateButton:SetPos(ButtonX, 0)
      DonateButton:SetText("")
      local Donate_Lerp = 0
      DonateButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(DonateButton:IsHovered() == true) then

          Donate_Lerp = Lerp(0.05, Donate_Lerp, w)

        else

          Donate_Lerp = Lerp(0.05, Donate_Lerp, 0)

        end
        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.DonateButtonColor)
        draw.RoundedBox(0, 0, 0, Donate_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.DonateButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Donate") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      DonateButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(false)
        Donate_Panel:SetVisible(true)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Donate"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableServersButton == true) then
      local ServersButton = vgui.Create("DButton", ButtonPanel)
      ServersButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      ServersButton:SetPos(ButtonX, 0)
      ServersButton:SetText("")
      local Server_Lerp = 0
      ServersButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(ServersButton:IsHovered() == true) then

          Server_Lerp = Lerp(0.05, Server_Lerp, w)

        else

          Server_Lerp = Lerp(0.05, Server_Lerp, 0)

        end
        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.ServersButtonColor)
        draw.RoundedBox(0, 0, 0, Server_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.ServerButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Servers") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      ServersButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(false)
        Server_Panel:SetVisible(true)

        Staff_Panel:SetDisabled(true)
        Staff_Panel:SetVisible(false)

        TabSelected = "Servers"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    if(OMOTD.Config.EnableStaffOnlineButton == true) then
      local StaffButton = vgui.Create("DButton", ButtonPanel)
      StaffButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
      StaffButton:SetPos(ButtonX, 0)
      StaffButton:SetText("")
      local Staff_Lerp = 0
      StaffButton.Paint = function(s, w, h)

        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
        if(StaffButton:IsHovered() == true) then

          Staff_Lerp = Lerp(0.05, Staff_Lerp, w)

        else

          Staff_Lerp = Lerp(0.05, Staff_Lerp, 0)

        end

        draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.StaffOnlineButtonColor)
        draw.RoundedBox(0, 0, 0, Staff_Lerp, h, Color(255, 255, 255, 10))
        draw.SimpleText(OMOTD.Lang.StaffButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

        if(TabSelected == "Staff") then

          draw.RoundedBox(0, 0, h * 0.95, w, h * 0.05, OMOTD.Config.SelectedButtonColor)

        end

        surface.SetDrawColor(60, 60, 60)
        surface.DrawOutlinedRect(0, 0, w, h)

      end

      StaffButton.DoClick = function()

        Home_Panel:SetDisabled(true)
        Home_Panel:SetAlpha(0)

        Rule_Panel:SetDisabled(true)
        Rule_Panel:SetAlpha(0)

        Forum_Panel:SetDisabled(true)
        Forum_Panel:SetVisible(false)

        Group_Panel:SetDisabled(true)
        Group_Panel:SetVisible(false)

        Workshop_Panel:SetDisabled(true)
        Workshop_Panel:SetVisible(false)

        Donate_Panel:SetDisabled(true)
        Donate_Panel:SetVisible(false)

        Server_Panel:SetDisabled(true)
        Server_Panel:SetVisible(false)

        Staff_Panel:SetDisabled(false)
        Staff_Panel:SetVisible(true)

        TabSelected = "Staff"

      end

      ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

    end

    local CloseButton = vgui.Create("DButton", ButtonPanel)
    CloseButton:SetSize(ButtonPanel:GetWide() * 0.1, ButtonPanel:GetTall())
    CloseButton:SetPos(ButtonX, 0)
    CloseButton:SetText("")
    local Close_Lerp = 0
    CloseButton.Paint = function(s, w, h)

      draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
      if(CloseButton:IsHovered() == true) then

        Close_Lerp = Lerp(0.05, Close_Lerp, w)

      else

        Close_Lerp = Lerp(0.05, Close_Lerp, 0)

      end
      draw.RoundedBox(0, 0, 0, w, h * 0.2, OMOTD.Config.CloseButtonColor)
      draw.RoundedBox(0, 0, 0, Close_Lerp, h, Color(255, 255, 255, 10))
      draw.SimpleText(OMOTD.Lang.CloseButton, "omotd_buttonfont", w / 2, h / 2, Color(255, 255, 255), 1, 1)

      surface.SetDrawColor(60, 60, 60)
      surface.DrawOutlinedRect(0, 0, w, h)

    end

    CloseButton.DoClick = function()

      frame:Close()

    end

    ButtonX = ButtonX + ButtonPanel:GetWide() * 0.099

end)
