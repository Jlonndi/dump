
local SEATBELT_TOGGLE = false
local IS_IN_VEHICLE = false
local IS_DRIVER = false
local MAX_PASSENGERS = nil
local CURRENT_VEHICLE = nil
local PED = PlayerPedId()
local SPEED_BUFFER = {}
local VEL_BUFFER = {}

SetFlyThroughWindscreenParams(Config.EjectCrashSpeed / 2.236936, (Config.EjectCrashSpeed + 10) / 2.236936, 17, 2000)
SetPedConfigFlag(PED, 32, true)

local function IsVehicleSeatbeltSupported(vehicle)
    local class = GetVehicleClass(vehicle)
    return Config.SupportedVehicleClasses[class]
end

local function EmitSound(sound)
    for i = -1, MAX_PASSENGERS do 
        if not IsVehicleSeatFree(CURRENT_VEHICLE, i) then
            local ply = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(CURRENT_VEHICLE, i)))
            if ply == PlayerId() then
                TriggerServerEvent('InteractSound_SV:PlayOnOne', ply, sound, Config.SoundVolume)
            else
                TriggerServerEvent('InteractSound_SV:PlayOnOne', ply, sound, Config.SoundVolume - 0.2)
            end
        end
    end
end

RegisterKeyMapping('+seatbelt', 'Toggle seatbelt', 'keyboard', Config.DefaultKeyboardSeatbeltKey)
RegisterKeyMapping('+seatbelt', 'Toggle seatbelt', 'pad_digitalbutton', Config.DefaultControllerSeatbeltKey)

RegisterCommand('+seatbelt', function()
    if IS_IN_VEHICLE then
        SEATBELT_TOGGLE = not SEATBELT_TOGGLE
        LocalPlayer.state:set('seatbelt', SEATBELT_TOGGLE, true)

        if SEATBELT_TOGGLE then
            SetPedConfigFlag(PED, 32, false) 
            ResetFlyThroughWindscreenParams()
            EmitSound('seatbelt-on')
        else
            SetPedConfigFlag(PED, 32, true) 
            SetFlyThroughWindscreenParams(Config.EjectCrashSpeed / 2.236936, (Config.EjectCrashSpeed + 10) / 2.236936, 17, 2000)
            EmitSound('seatbelt-off')
        end
    end
end, false)

RegisterCommand('-seatbelt', function() end, false)

local function UpdateVehicleStatus()
    SetTimeout(500, UpdateVehicleStatus)
    local vehicle = GetVehiclePedIsIn(PED, false)
    if vehicle ~= 0 and IsVehicleSeatbeltSupported(vehicle) then
        IS_IN_VEHICLE = true
        CURRENT_VEHICLE = vehicle
        IS_DRIVER = (GetPedInVehicleSeat(vehicle, -1) == PED and true or false)
        MAX_PASSENGERS = GetVehicleMaxNumberOfPassengers(vehicle) - 1
    else 
        if IS_IN_VEHICLE then 
            IS_IN_VEHICLE = false
            CURRENT_VEHICLE = nil
            SPEED_BUFFER = {}
            VEL_BUFFER = {}
            IS_DRIVER = false
            MAX_PASSENGERS = nil
            collectgarbage("collect")
        end
    end
end

UpdateVehicleStatus()

local function CheckSeatbeltStatus()
    SetTimeout(4500, CheckSeatbeltStatus)
    if IS_IN_VEHICLE and IS_DRIVER then
        for i = -1, MAX_PASSENGERS do
            if not IsVehicleSeatFree(CURRENT_VEHICLE, i) then
                local ply = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(CURRENT_VEHICLE, i)))
                if not Player(ply).state.seatbelt then
                    local vehicleSpeed = GetEntitySpeed(CURRENT_VEHICLE) * 2.236936
                    if vehicleSpeed >= Config.NoSeatbeltWarningSpeed then 
                        EmitSound('seatbelt-alarm')
                        break
                    end
                end
            end
        end
    end
end

CheckSeatbeltStatus()

local DisableControlAction = DisableControlAction

CreateThread(function()
    while true do 
        PED = PlayerPedId()
        if IS_IN_VEHICLE then 
            if SEATBELT_TOGGLE then 
                DisableControlAction(0, 75, true) 
                DisableControlAction(27, 75, true)
            end
        end
        Wait(0)
    end
end)