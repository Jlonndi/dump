Config = {}

-- 0.1 - 1.0
Config.SoundVolume = 1.5

-- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
-- Keybind is toggleable by players in their GTA settings
Config.DefaultKeyboardSeatbeltKey = 'K'

-- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/pad_digitalbutton/
Config.DefaultControllerSeatbeltKey = 'LLEFT_INDEX'

Config.EjectCrashSpeed = 40

-- In MPH
Config.NoSeatbeltWarningSpeed = 20

-- Classes of vehicles which support seatbelts
-- https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.SupportedVehicleClasses = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = false,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = false,
    [14] = false,
    [15] = false,
    [16] = false,
    [17] = true,
    [18] = true,
    [19] = true,
    [20] = true,
    [21] = false,
}