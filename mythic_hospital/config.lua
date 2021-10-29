Config = Config or {}
Config.Debug = false

-- Keys
Config.Keys = {}
Config.Keys.GetUp = 38 -- Key Used To Get Out Of Bed When Using /bed Command
Config.Keys.Revive = 54 -- Key Used To Revive Or Teleport

--[[
    GENERAL SETTINGS | THESE WILL AFFECT YOUR ENTIRE SERVER SO BE SURE TO SET THESE CORRECTLY
    MaxHp : Maximum HP Allowed, set to -1 if you want to disable mythic_hospital from setting this
        NOTE: Anything under 100 and you are dead
    RegenRate :
]]
Config.MaxHp = 200
Config.RegenRate = 0.0

--[[
    HiddenRevChance : The % Chance That Using The Hidden Revive Spot Will Result In A Full Revive With All Limb Damage & Bleeds Removed
    HiddenCooldown : The time, in minutes, for how long a player must wait before using the hidden revive spot again
]]
Config.HiddenRevChance = 65
Config.HiddenCooldown = 45

--[[
    Pricing
]]
Config.InjuryBase = 500
Config.HiddenInjuryBase = 10000

--[[
    AlertShowInfo :
]]
Config.AlertShowInfo = 2

--[[

]]
Config.Hospital = {
  ["pillbox"] = {
    Location = { x = 306.76513671875, y = -595.08404541016, z = 43.28405380249, h = 180.4409942627 },
    CheckInBehalf = { x = 312.38412475586, y = -592.68182373047, z = 43.284065246582 },
    ShowBlip = false,
    Blip = {
      name = "Pillbox Medical Center",
      color = 38,
      id = 153,
      scale = 0.7,
      short = false,
      x = 308.06161499023,
      y = -595.19683837891,
      z = 43.291839599609
    }
  },
  ["sandy"] = {
    Location = { x = 1841.6857910156, y = 3679.5969238281, z = 34.275730133057, h = 180.4409942627 },
    CheckInBehalf = { x = 1836.8898925781, y = 3680.9294433594, z = 34.276496887207 },
    ShowBlip = false,
    Blip = {
      name = "Sandy Shores Medical Center",
      color = 38,
      id = 153,
      scale = 0.7,
      short = false,
      x = 1836.7308349609,
      y = 3680.5466308594,
      z = 34.270038604736
    }
  },
  ["paleto"] = {
    Location = { x=-255.27424621582, y=6329.2836914063, z=32.408863067627, h = 180.4409942627 },
    CheckInBehalf = {x = -257.73870849609, y = 6329.2080078125, z = 32.408863067627},
    ShowBlip = false,
    Blip = {
      name = "Paleto Medical Center",
      color = 38,
      id = 153,
      scale = 0.7,
      short = false,
      x = -255.27424621582,
      y = 6329.2836914063,
      z = 32.408863067627
    }
  },
  ["prison"] = {
    Location = { x = 1768.791015625, y = 2570.4689941406, z = 45.729797363281, h = 180.4409942627 },
    CheckInBehalf = { x = 1767.8131103516, y = 2572.6286621094, z = 45.729797363281 },
    ShowBlip = false,
    Blip = {
      name = "Bowlingbrook Clinic",
      color = 38,
      id = 153,
      scale = 0.7,
      short = false,
      x = 1768.791015625,
      y = 2570.4689941406,
      z = 45.729797363281
    }
  }
}
--[[
    Hidden: Location of the hidden location where you can heal and no alert of GSW's will be made.
]]

Config.Hidden = {
    Location = { x = 1969.2971191406, y = 3815.6735839844, z = 33.428680419922 },
    ShowBlip = false,
}
Config.Hidden.Blip = { name = 'Hidden Medic', color = 12, id = 153, scale = 1.0, short = false, x = Config.Hidden.Location.x, y = Config.Hidden.Location.y, z = Config.Hidden.Location.z }

Config.HospitalCheckin = {
  {x = 340.10537719727, y = -586.52227783203, z = 28.791479110718, h = 67.479, location = "pillbox"},
  {x = 1838.5328369141, y = 3678.5981445312, z = 34.276371002197, h = 67.479, location = "sandy"},
  {x = -370.40383911133, y = 6108.3657226563, z = 31.850894927979, h = 67.479, location = "paleto"},
  {x = 1679.6081542969, y = 2580.3977050781, z = 45.911521911621, h = 180.4409942627, location = "prison"},
}

Config.Teleports = {
    { x = 298.57528686523, y = -599.33715820313, z = 43.292068481445, h = 338.03997802734, destination = 3, range = 2, text = Config.Strings.TeleportLower },
    { x = 309.68832397461, y = -602.75939941406, z = 43.291839599609, h = 67.832542419434, destination = 4, range = 2, text = Config.Strings.TeleportRoof },
    { x = 357.58139038086, y = -590.75146484375, z = 28.788959503174, h = 245.51211547852, destination = 1, range = 5, text = Config.Strings.TeleportEnter },
    { x = 338.8362121582, y = -583.79595947266, z = 74.165649414063, h = 247.53303527832, destination = 2, range = 2, text = Config.Strings.TeleportEnter },
}
