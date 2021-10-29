Teleports = {
  -- Morgue
  [1] = {id = 1, x = 231.55276489258, y = -1360.1064453125, z = 28.65180015564, h = 50.37, name = "Exit Morgue", destination = {2}},
  [2] = {id = 2, x = 275.33160400391, y = -1360.9852294922, z = 24.537803649902, h = 49.13, name = "Enter Morgue", destination = {1}},

  -- FIB
  [4] = {id = 4, x = 136.135, y = -761.800, z = 45.752, name = "Lobby", destination = {5}},
  [5] = {id = 5, x = 136.135, y = -761.800, z = 242.152, name = "49th Floor", destination = {4}},
  [6] = {id = 6, x = 117.614, y = -736.593, z = 258.152, name = "53rd Floor", destination = {4}},

  -- Pillbox
  [10] = {id = 10, x = 329.973, y = -601.019, z = 43.284, name = "Go to 3rd Floor", destination = {11,12,13}},
  [11] = {id = 11, x = 340.964, y = -580.836, z = 28.796, name = "Go to Garage", destination = {10}},
  [12] = {id = 12, x = 338.910, y = -583.891, z = 74.166, name = "Go to Helipad", destination = {10}},
  [13] = {id = 13, x = 346.088, y = -582.565, z = 28.796, name = "Go to Lower Lobby", destination = {10}},

  -- Courthouse
    -- Exterior
    [20] = {id = 20, x = 235.639, y = -411.355, z = 48.112, name = "Exit Courthouse", destination = {21}},
    [21] = {id = 21, x = 236.025, y = -413.366, z = -118.163, name = "Enter Courthouse", destination = {20}},
    [22] = {id = 22, x = 224.759, y = -441.625, z = 45.247, name = "Exit Secure Area", destination = {23}},
    [23] = {id = 23, x = 239.112, y = -443.206, z = -22.818, name = "Enter Secure Area", destination = {22}},
    -- Lobby
    [24] = {id = 24, x = 225.127, y = -419.663, z = -118.196, name = "Go to Lobby", destination = {25}},
    -- Old Courtroom
    --[25] = {id = 25, x = 238.761, y = -334.176, z = -118.773, name = "Enter Courtroom", destination = {24}},
    -- New Courtroom
    [25] = {id = 25, x = 252.892, y = -420.921, z = -22.818, name = "Enter Courtroom", destination = {24}},

  -- Split Sides
  [50] = {id = 50, x = -459.031, y = 284.804, z = 78.521, name = "Enter Split Sides", destination = {51}},
  [51] = {id = 51, x = -430.090, y = 261.591, z = 83.005, name = "Exit Split Sides", destination = {50}},

  -- The Palace
    -- Front Door
    --[[
    [52] = {id = 52, x = -676.870, y = -2458.567, z = 13.944, name = "Exit The Palace", destination = {53}},
    [53] = {id = 53, x = -1569.359, y = -3017.293, z = -74.406, name = "Enter The Palace", destination = {52}},
    -- Back Door
    [54] = {id = 54, x = -671.163, y = -2392.512, z = 13.945, name = "Exit The Palace", destination = {55}},
    [55] = {id = 55, x = -1645.003, y = -2989.880, z = -76.718, name = "Enter The Palace", destination = {54}},
    ]]--

  -- Psychiatrist Office
  --[60] = {id = 60, x = -1910.832, y = -575.021, z = 19.097, name = "Enter Psychiatrist Office", destination = {61}},
  --[61] = {id = 61,x = -1911.578, y = -576.026, z = 19.097, name = "Exit Psychiatrist Office", destination = {60}},

  -- Humane labs
  [70] = {id = 70, x = 3540.521, y = 3675.516, z = 28.121, name = "Floor -1", destination = {71}},
  [71] = {id = 71,x = 3540.521, y = 3675.516, z = 20.992, name = "Floor -3", destination = {70}},
  [73] = {id = 73, x = 3600.971, y = 3702.508, z = 36.643, name = "Courtyard", destination = {74}},
  [74] = {id = 74, x = 3559.132, y = 3696.195, z = 30.122, name = "Floor -1", destination = {73}},

  -- Terminal Laundromat
  --[90] = {id = 90, x = 1207.314, y = -3122.413, z = 5.540, name = "Leave Laundromat", destination = {91}},
  --[91] = {id = 91, x = 1138.0211181641, y = -3198.47265625, z = -39.665668487549, name = "Enter Laundromat", destination = {90}},

  -- Yankton
  --[100] = {id = 100, x = 3557.2287597656, y = -4683.7763671875, z = 114.5895767212, name = "Travel to Ludendorff", destination = {101}},
  --[101] = {id = 101, x = -1042.578125, y = -2745.7570800781, z = 21.359403610229, name = "Travel to Los Santos", destination = {100}},

  -- Casino
  [102] = {id = 102, x = 935.59729003906, y = 46.505035400391, z = 81.09578704834, name = "Exit Casino", destination = {103}},
  [103] = {id = 103, x = 1089.6083984375, y = 206.60050964355, z = -48.999725341797, name = "Enter Casino", destination = {102}},
  [104] = {id = 104, x = 964.576171875, y = 58.703639984131, z = 112.5530090332, name = "Enter Rooftop", destination = {105}},
  [105] = {id = 105, x = 1119.3037109375, y = 266.65411376953, z = -51.040542602539, name = "Exit Rooftop", destination = {104}},

  -- Sandy dealership
  [120] = {id = 120, x = 1529.9476318359, y = 3778.3962402344, z = 34.511451721191, name = "Exit Office", destination = {121}},
  [121] = {id = 121, x = 1567.9543457031, y = 3718.9587402344, z = 11.802263259888, name = "Enter Office", destination = {120}},

-- Not Used
  -- [28] = {id = 28, x = 1088.8044433594, y = -3188.5224609375, z = -38.993465423584, name = "Cocaine Packaging", destination = {29}},
  -- [29] = {id = 29,x = -1911.6326904297, y = -576.21142578125, z = 19.146910476685, name = "Exit Cocaine Packaging", destination = {28}},


-- City Hall
[555] = {id = 555, x = -537.878, y = -186.450, z = 47.423, name = "Enter - City Hall", destination = {556}},
[556] = {id = 556, x = -589.093, y = -135.472, z = 47.767, name = "Exit - City Hall", destination = {555}},

}

-- Entrance


-- Exit
