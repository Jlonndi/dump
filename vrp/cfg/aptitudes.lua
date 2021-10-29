
local cfg = {}

-- exp notes:
-- levels are defined by the amount of xp
-- with a step of 5: 5|15|30|50|75 (by default)
-- total exp for a specific level, exp = step*lvl*(lvl+1)/2
-- level for a specific exp amount, lvl = (sqrt(1+8*exp/step)-1)/2

-- define groups of aptitudes
--- _title: title of the group
--- map of aptitude => {title,init_exp,max_exp}
---- max_exp: -1 for infinite exp
cfg.gaptitudes = {
  ["physical"] = {
    _title = "Physical",
    ["strength"] = {"Strength", 30, 140}, -- 140 = 7 levels total / 30 = start at level 3
  },
  --["smarts"] = {
  --  _title = "Smarts",
  --  ["lockpicking"] = {"Lockpicking", 0, 115}, -- 140 = 6 levels total / 30 = start at level 3
  --},
}

cfg.gym_title = "Gym"

cfg.gym_fee = 750

cfg.membership_duration = 15 -- in minutes

cfg.excercises = {
	["pushup"] = {task = "WORLD_HUMAN_PUSH_UPS", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to do push-ups"},
	["situp"] = {task = "WORLD_HUMAN_SIT_UPS", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to do sit-ups"},
	["jog"] = {task = "WORLD_HUMAN_JOG_STANDING", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to jog in place" },
	["pullup"] = {task = "prop_human_muscle_chin_ups", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to do pull-ups"},
	["freeweight"] = {task = "world_human_muscle_free_weights", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to use free weights"},
	["flex"] = {task = "world_human_muscle_flex", gain = 3, time = 30, text = "Press ~INPUT_PICKUP~ to flex"},
}

cfg.marker_type = 409
cfg.marker_colour = 61

cfg.workouts = {
	["beach"] = {
		-- {x,y,z,task,time (sec)}
		{-59.195709228516,-1284.9909667969,30.905090332031,"pullup"},--
		--{-63.274345397949,-1285.5603027344,30.905086517334,"pullup"},
		{-63.165878295898,-1289.0612792969,30.905082702637,"jog"},--
		{-63.274345397949,-1285.5603027344,30.905086517334,"jog"},--
		--{-1200.1920166016,-1563.7802734375,4.6180872917175,"flex"},
		{-62.457065582275,-1282.4361572266,30.905103683472,"freeweight"}, --
		{-59.178009033203,-1282.3878173828,30.905101776123,"freeweight"}, --
		{-60.987071990967,-1279.0643310547,30.905099868774,"situp"},--
		--{-1207.6096191406,-1565.9970703125,4.6079335212708,"situp"},
		--{-1202.3642578125,-1567.1461181641,4.6102633476257,"pushup"},
		--{-1202.3364257813,-1572.6575927734,4.6079297065735,"pushup"},
		{-58.683292388916,-1287.8170166016,30.905086517334,"flex"},
	},

  ["prison"] = {
		-- {x,y,z,task,time (sec)}
		{1746.654296875,2481.8322753906,45.740661621094,"pullup"},
		{1744.8330078125,2477.8146972656,45.759204864502,"jog"},
		{1746.1494140625,2484.0261230469,45.740661621094,"flex"},
		{1743.9844970703,2483.2172851563,45.740661621094,"freeweight"},
		{1743.9429931641,2479.3037109375,45.759346008301,"situp"},
	}
}

cfg.gyms = {
	{"beach",-55.311302185059,-1288.8365478516,30.905080795288},
  {"prison",1749.1452636719,2486.1257324219,45.740661621094},
}

return cfg
