OMOTD = OMOTD or {} -- No touchy
OMOTD.Config = OMOTD.Config or {} -- No touchy

-- Welcome to the config. I've tried to make everything as configurable as possible so theres a little bit to go through. If you have any questions or need help make a support ticket.

-- The name of the server, used for the title.
OMOTD.Config.ServerName = "Cool Server"

-- The ULX/FAdmin groups that count as "Staff".
OMOTD.Config.StaffGroups = {"owner", "superadmin", "admin"}

-- Button Colors - Color(R, G, B)

-- The alpha for the button animations, try to keep this low.
OMOTD.Config.AlphaForAnim = 10

-- The color of the bar for the selected panel
OMOTD.Config.SelectedButtonColor = Color(200, 200, 200)

-- The color of the Home Ribbon, along of the color for when it's hovered
OMOTD.Config.HomeButtonColor = Color(150, 200, 60)

-- The color of the Rule Ribbon, along of the color for when it's hovered
OMOTD.Config.RuleButtonColor = Color(10, 120, 60)

-- The color of the Forum Ribbon, along of the color for when it's hovered
OMOTD.Config.ForumButtonColor = Color(0, 140, 130)

-- The color of the Group Ribbon, along of the color for when it's hovered
OMOTD.Config.GroupButtonColor = Color(0, 130, 190)

-- The color of the Workshop Ribbon, along of the color for when it's hovered
OMOTD.Config.WorkshopButtonColor = Color(0, 80, 150)

-- The color of the Donate Ribbon, along of the color for when it's hovered
OMOTD.Config.DonateButtonColor = Color(80, 50, 140)

-- The color of the Server Portal Ribbon, along of the color for when it's hovered
OMOTD.Config.ServersButtonColor = Color(0, 100, 50)

-- The color of the Staff Online Ribbon, along of the color for when it's hovered
OMOTD.Config.StaffOnlineButtonColor = Color(0, 80, 70)

-- The color of the Close Ribbon, along of the color for when it's hovered
OMOTD.Config.CloseButtonColor = Color(200, 0, 0)


-- Button Enablers
-- (The Home menu cannot be removed)

-- Enable the Rule button.
OMOTD.Config.EnableRuleButton = true

-- Enable the Forum button.
OMOTD.Config.EnableForumButton = true

-- Enable the Group button.
OMOTD.Config.EnableGroupButton = true

-- Enable the Workshop button.
OMOTD.Config.EnableWorkshopButton = true

-- Enable the Donate button.
OMOTD.Config.EnableDonateButton = true

-- Enable the Server Portal button.
OMOTD.Config.EnableServersButton = true

-- Enable the Staff Online button.
OMOTD.Config.EnableStaffOnlineButton = true

-- Menu settings

-- The announcement text for the side.
OMOTD.Config.AnnouncementText = [[Welcome to our server! Make sure to read the rules and have fun!]]

-- The custom text box in the home.
OMOTD.Config.HomeText = [[Welcome to our server! Make sure to read the rules and Have Fun! Contact a staff member if you need assistance!]]

-- Use a URL for the rules panel
OMOTD.Config.UseURLInRules = false
-- If above is true, what URL to open
OMOTD.Config.RuleURL = "https://www.google.com/"
-- The rules of the server if URL is false.
OMOTD.Config.Rules = [[Rules of our network! Failure to abide by these rules will result in punishment!
1. No spamming.
2. No messing with others props.
3. Have fun!]]

-- What URL to open in the forums panel.
OMOTD.Config.ForumURL = "https://www.google.com/"

-- What URL to open in the Steam Group panel.
OMOTD.Config.GroupURL = "https://www.google.com/"

-- What URL to open in the Workshop panel.
OMOTD.Config.WorkshopURL = "https://www.google.com/"

-- What URL to open in the Donate panel.
OMOTD.Config.DonateURL = "https://www.google.com/"

-- The color for the Staff Profile button, along with the animation color
OMOTD.Config.ProfileColor = Color(0, 150, 0)

-- The servers to add to the Server Portal. Put as many as you want!

--[[Template:

[ID] = {
  name = "Server Name",
  ip = "Server IP + Port",
  color = Color(R, G, B), -- Color of the button
  animcolor = Color(R, G, B), -- Color for the animation
},

Make sure the ID is a number and it is increased each time you add a server

]]

OMOTD.Config.Servers = {

  [1] = {
    name = "Our Sandbox Server",
    ip = "00.000.00.000:00000",
    color = Color(60, 80, 140),
  },

  [2] = {
    name = "Our TTT Server",
    ip = "00.000.00.000:00000",
    color = Color(0, 80, 70),
  },

  [3] = {
    name = "Our MilitaryRP Server",
    ip = "00.000.00.000:00000",
    color = Color(150, 200, 60),
  },

}

-- Congradulations! You're done!
