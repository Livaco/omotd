/*

Welcome to the config. I've tried to make everything as configurable as possible so theres a little bit to go through.
If you need any help with this make a support ticket at https://livacoweb.000webhostapp.com/

*/

-- General Settings


-- Name of the server, for the title.
OMOTD.Config.ServerName = "Cool Server"

-- Groups that count as a Staff Member. Used for the staff online panel.
OMOTD.Config.StaffGroups = {"owner", "superadmin", "admin"}

-- Command to open the MOTD, includes prefix.
OMOTD.Config.OpenCommand = "!motd"

-- Only worry about the bellow settings if you are using bLogs.

-- Log if the menu is opened.
OMOTD.Config.bLogs.LogMenuOpen = true

-- Log if a staff member has been added/removed from the Staff Menu.
OMOTD.Config.bLogs.LogStaffEdit = true

-- UI Settings


-- Text for the announcement at the side.
OMOTD.Config.AnnouncementText = [[Welcome to our server! Make sure to read the rules and have fun!]]

-- The color of the bar at the bottom of the selected panel button.
OMOTD.Config.SelectedButtonColor = Color(200, 200, 200)

-- Home ribbon color.
OMOTD.Config.HomeButtonColor = Color(150, 200, 60)

-- Rule ribbon color.
OMOTD.Config.RuleButtonColor = Color(10, 120, 60)

-- Forum ribbon color.
OMOTD.Config.ForumButtonColor = Color(0, 140, 130)

-- Group ribbon color.
OMOTD.Config.GroupButtonColor = Color(0, 130, 190)

-- Workshop ribbon color.
OMOTD.Config.WorkshopButtonColor = Color(0, 80, 150)

-- Donate ribbon color.
OMOTD.Config.DonateButtonColor = Color(80, 50, 140)

-- Servers ribbon color.
OMOTD.Config.ServersButtonColor = Color(0, 100, 50)

-- Staff Online ribbon color.
OMOTD.Config.StaffOnlineButtonColor = Color(0, 80, 70)

-- Close ribbon color.
OMOTD.Config.CloseButtonColor = Color(200, 0, 0)

-- Enable the rule button. If this is disabled it will not be accessable.
OMOTD.Config.EnableRuleButton = true

-- Enable the forum button. If this is disabled it will not be accessable.
OMOTD.Config.EnableForumButton = true

-- Enable the group button. If this is disabled it will not be accessable.
OMOTD.Config.EnableGroupButton = true

-- Enable the workshop button. If this is disabled it will not be accessable.
OMOTD.Config.EnableWorkshopButton = true

-- Enable the donate button. If this is disabled it will not be accessable.
OMOTD.Config.EnableDonateButton = true

-- Enable the servers button. If this is disabled it will not be accessable.
OMOTD.Config.EnableServersButton = true

-- Enable the staff online button. If this is disabled it will not be accessable.
OMOTD.Config.EnableStaffOnlineButton = true

-- All the panel options, note if the button is true it will have no diffrence. Also make sure all links include the http://

-- Home Panel Options


-- Text at the bottom of the home panel.
OMOTD.Config.HomeText = [[Welcome to our server! Make sure to read the rules and Have Fun! Contact a staff member if you need assistance!]]

-- Rule Panel Options


-- If the rules should open a URL or simply use text.
OMOTD.Config.UseURLInRules = false

-- If the above option is true, what URL does it open.
OMOTD.Config.RuleURL = "https://www.google.com/"

-- If the panel is not using a link, what text should be drawn.
OMOTD.Config.Rules = [[Rules of our network! Failure to abide by these rules will result in punishment!
1. No spamming.
2. No messing with others props.
3. Have fun!]]

-- Forum Panel Options


-- Forum URL.
OMOTD.Config.ForumURL = "https://www.google.com/"

-- Group Panel Options


-- Steam Group URL.
OMOTD.Config.GroupURL = "https://www.google.com/"

-- Workshop Panel Options


-- Workshop URL.
OMOTD.Config.WorkshopURL = "https://www.google.com/"

-- Donate Panel Options


-- Donate URL
OMOTD.Config.DonateURL = "https://www.google.com/"

-- Servers Panel Options


-- The color of the steam profile button.
OMOTD.Config.ProfileColor = Color(0, 150, 0)

/*

All the servers to be displayed.


Template:

ID - Make sure this is not the same as any others otherwise data will be overridden.
Name - Name of the server to be displayed. Make sure it is wrapped in quotations.
IP - The IP address of the server. If you do not know this contact the hosting provider on where to find it.
R, G, B - Red, Green and Blue values for the color. Use this if you are not sure: https://www.rapidtables.com/web/color/RGB_Color.html

[ID] = {
  name = "Name",
  ip = "IP",
  color = Color(R, G, B),
},

Example:

[69] = { -- Unique ID
  name = "Some Shite Server", -- Name
  ip = "69.420.69.420:69696", -- IP
  color = Color(0, 200, 0), -- RGB, displays green.
},

I understand this can be hard to understand, take a look at the default three if you are struggling. If you still don't understand, make a support ticket on my website and I will assist you.#
livaco.tk

*/

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

  [4] = {
    name = "Our StarwarsRP Server",
    ip = "00.000.00.000:00000",
    color = Color(200, 0, 0),
  },

}
