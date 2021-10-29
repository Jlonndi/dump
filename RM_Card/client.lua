local Props = {}
local showingMiranda = false

RegisterCommand('miranda', function()
    if not showingMiranda then
        startMirandaLoop()
    end
end)

local mirandaDict = 'missfam4'
local mirandaAnim = 'base'

function playMirandaAnim(ped, createProp)
    DestroyAllProps()
    LoadAnim(mirandaDict)
    TaskPlayAnim(ped, mirandaDict, mirandaAnim, 2.0, 2.0, -1, 51, 0, false, false, false)
    if createProp then
        Wait(0)
        AddPropToPlayer('prop_notepad_01', 36029, 0.14, 0.08, 0.05, -40.0, -50.0, 0.0)
    end
end

function startMirandaLoop()
    Citizen.CreateThread(function()
        showingMiranda = true
        SendNUIMessage({
            type = 'mirandaShow'
        })
        local ped = PlayerPedId()
        playMirandaAnim(ped, true)
        while showingMiranda do
            Wait(5)
            if not IsEntityPlayingAnim(ped, mirandaDict, mirandaAnim, 3) then
                playMirandaAnim(ped, false)
            end
            if IsControlJustReleased(0, 38) or IsControlJustReleased(0, 322) then
                showingMiranda = false
            end
        end
        ClearPedTasks(ped)
        DestroyAllProps()
        SendNUIMessage({
            type = 'mirandaHide'
        })
    end)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end
  
function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

function DestroyAllProps()
    for _,v in pairs(Props) do
        DeleteEntity(v)
    end
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
  
    if not HasModelLoaded(prop1) then
      LoadPropDict(prop1)
    end
  
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    table.insert(Props, prop)
    SetModelAsNoLongerNeeded(prop1)
end
  


TriggerEvent('chat:addSuggestion', '/miranda', 'RM / Open Miranda Card')


print("AUTHORIZED - RM - Discord.gg/redrum")
print("AUTHORIZED - Version 1.0.0 - Discord.gg/redrum")



                                                                                                                                     
                                                                                                                                     
print("RRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD      RRRRRRRRRRRRRRRRR   UUUUUUUU     UUUUUUUUMMMMMMMM               MMMMMMMM")
print("R::::::::::::::::R  E::::::::::::::::::::ED::::::::::::DDD   R::::::::::::::::R  U::::::U     U::::::UM:::::::M             M:::::::M")
print("R::::::RRRRRR:::::R E::::::::::::::::::::ED:::::::::::::::DD R::::::RRRRRR:::::R U::::::U     U::::::UM::::::::M           M::::::::M")
print("RR:::::R     R:::::REE::::::EEEEEEEEE::::EDDD:::::DDDDD:::::DRR:::::R     R:::::RUU:::::U     U:::::UUM:::::::::M         M:::::::::M")
print("  R::::R     R:::::R  E:::::E       EEEEEE  D:::::D    D:::::D R::::R     R:::::R U:::::U     U:::::U M::::::::::M       M::::::::::M")
print("  R::::R     R:::::R  E:::::E               D:::::D     D:::::DR::::R     R:::::R U:::::D     D:::::U M:::::::::::M     M:::::::::::M")
print("  R::::RRRRRR:::::R   E::::::EEEEEEEEEE     D:::::D     D:::::DR::::RRRRRR:::::R  U:::::D     D:::::U M:::::::M::::M   M::::M:::::::M")
print("  R:::::::::::::RR    E:::::::::::::::E     D:::::D     D:::::DR:::::::::::::RR   U:::::D     D:::::U M::::::M M::::M M::::M M::::::M")
print("  R::::RRRRRR:::::R   E:::::::::::::::E     D:::::D     D:::::DR::::RRRRRR:::::R  U:::::D     D:::::U M::::::M  M::::M::::M  M::::::M")
print("  R::::R     R:::::R  E::::::EEEEEEEEEE     D:::::D     D:::::DR::::R     R:::::R U:::::D     D:::::U M::::::M   M:::::::M   M::::::M")
print("  R::::R     R:::::R  E:::::E               D:::::D     D:::::DR::::R     R:::::R U:::::D     D:::::U M::::::M    M:::::M    M::::::M")
print("  R::::R     R:::::R  E:::::E       EEEEEE  D:::::D    D:::::D R::::R     R:::::R U::::::U   U::::::U M::::::M     MMMMM     M::::::M")
print("RR:::::R     R:::::REE::::::EEEEEEEE:::::EDDD:::::DDDDD:::::DRR:::::R     R:::::R U:::::::UUU:::::::U M::::::M               M::::::M")
print("R::::::R     R:::::RE::::::::::::::::::::ED:::::::::::::::DD R::::::R     R:::::R  UU:::::::::::::UU  M::::::M               M::::::M")
print("R::::::R     R:::::RE::::::::::::::::::::ED::::::::::::DDD   R::::::R     R:::::R    UU:::::::::UU    M::::::M               M::::::M")
print("RRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD      RRRRRRRR     RRRRRRR      UUUUUUUUU      MMMMMMMM               MMMMMMMM")