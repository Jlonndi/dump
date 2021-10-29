Config = {}

Config.TextColor_Me         = { r = 255, g = 255, b = 255, a = 255 } -- Adjust the text color (3D and the Chat too)
Config.TextColor_Do         = { r = 255, g = 255, b = 255, a = 255 }
Config.TextColor_Try        = { r = 255, g = 255, b = 255, a = 255 }

Config.Background           = true -- Enable/Disable the background of the 3D text?

Config.BackgroundColor_Me   = { r = 63, g = 153, b = 247, a = 150 } -- Adjust the background color (3D and the Chat too)
Config.BackgroundColor_Do   = { r = 202, g = 37, b = 78, a = 150 }
Config.BackgroundColor_Try  = { r = 22, g = 173, b = 196, a = 150 }

Config.DisplayOnChat        = false -- Display actions in chat?

Config.Log                  = false -- Enable/Disable logging?
Config.Logwebhook           = "Your Webhook Url" -- If logging enabled then replace 'Your Webhook' with your Discord Channel Webhook

---------- Advanced options ----------

Config.Duration             = 8 -- Text duration (in seconds)
Config.Distance             = 15 -- Who can see my action inside the distance (in meter)
Config.TryChance            = 50 -- Chance of the try action (in %)
Config.DropShadow           = true -- Drop shadow (3D text)
Config.Font                 = 4 -- Font type in number (3D text)
