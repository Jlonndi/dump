Config = {}

Config.UseESX = false --Enable if you are using ESX so you can use the esx permissions.
Config.ESX_perms = { --A list of all esx permissions who are allowed to open the UI.e if you are using ESX.
  	['superadmin'] = true,
    ['admin'] = true,
}

Config.Command = 'easytime' --Customise the command name to open the UI.
Config.Notification_Type = 'mythic_new' ----chat / mythic_old / mythic_new / esx / custom
Config.Language = 'EN' --EN / FR / ES

Config.TimeCycleSpeed = 10000 -- Changing this value will effects the day/night time cycle, decreasing slows it down, incresing speeds it up. Right now its similar to the default gta5 time cycle. (in milliseconds).
Config.DynamicWeather = true --Enable if you want to allow dynamic weather.
Config.DynamicWeather_time = 30 --If dynamic weather is enabled, this value is how long until the weather changes (in minutes).
Config.RainChance = 10 --The percent chance for it to rain out of 100.
Config.SnowChance = 30 --The percent chance for it to snow out of 100.
Config.ThunderChance = 10 --The percent chance for it to thunder when raining out of 100.

Config.WeatherGroups = { --These are the weather groups, it will cycle through each group from left to right. For example, making sure it never instantly changing from sunny to thunder.
    [1] = {'CLEAR', 'OVERCAST','EXTRASUNNY', 'CLOUDS'},--clear
    [2] = {'CLOUDS','CLEARING', 'RAIN', 'THUNDER'},--rain
    [3] = {'SMOG', 'CLOUDS'},--foggy
    [4] = {'CLEAR', 'OVERCAST','EXTRASUNNY', 'CLOUDS'},--clear
}
