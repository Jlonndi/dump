local units = {
  { name = "1", x = 284.63751220703, y = -641.30194091797, z = 42.018608093262, h = 180.0, onwer = nil },
  { name = "2", x = 288.25314331055, y = -642.77227783203, z = 42.018604278564, h = 180.0, onwer = nil },
  { name = "3", x = 291.92153930664, y = -644.07543945312, z = 42.018604278564, h = 180.0, onwer = nil },
  { name = "4", x = 288.14358520508, y = -654.84265136719, z = 42.018608093262 , h = 0.0, onwer = nil },
  { name = "5", x = 284.52877807617, y = -653.33245849609, z = 42.018611907959, h = 0.0, onwer = nil },
  { name = "6", x = 280.77423095703, y = -652.09405517578, z = 42.018608093262, h = 0.0, onwer = nil },
}


local lobbyMarker = {x = 279.7380065918, y = -645.68481445312, z = 42.01863861084}
local aptCenter = { name = "Apartment Center", x = 313.76293945312, y = -656.84606933594, z = -100.74578857422, h = 68.383483886719 }
local aptDoor = { name = "Apartment Exit", x = 310.93322753906, y = -655.06652832031, z = -100.78575134277, h = 23.70355796814 }
local aptStash = { name = "Apartment Stash", x = 310.73696899414, y = -659.50518798828, z = -100.78572845459, h = 59.155685424805 }
local aptOutfits = { name = "Apartment Outfits", x = 314.89227294922, y = -660.67553710938, z = -100.7857131958, h = 109.99528503418 }
local aptLogout = { name = "Apartment Logout", x = 311.48278808594, y = -663.85595703125, z = -100.7857131958, h = 259.78408813477 }
local aptSpawn = { name = "Apartment Spawn", x = 312.27755737305, y = -656.19873046875, z = -100.75157928467, h = 95.0 }
local apt = nil
local myAptName = ""

local inApartment = false
local myRoomBlip = nil

RegisterNetEvent('mythic_instances:client:onCreate')
AddEventHandler('mythic_instances:client:onCreate', function(instance)
  if instance.type == 'apartment' then
    TriggerEvent('mythic_instances:client:enter', instance)
  end
end)

RegisterNetEvent('mythic_instances:client:onPlayerLeft')
AddEventHandler('mythic_instances:client:onPlayerLeft', function(instance, player)
  if player == instance.host then
    TriggerEvent('mythic_instances:client:leave')
  end
end)

RegisterNetEvent('mythic_instances:client:onPlayerLeft')
AddEventHandler('mythic_instances:client:onPlayerLeft', function(instance, player)
  if player == instance.host then
    TriggerEvent('mythic_instances:client:leave')
  end
end)

AddEventHandler('mythic_instances:client:loaded', function()
  TriggerEvent('mythic_instances:client:registerType', 'apartment', function(instance)
    print('Entering Instance ...')
  end, function(instance)
    print('Exiting Instance ...')
  end)
end)

RegisterNetEvent('mythic_characters:client:CharacterSpawned')
AddEventHandler('mythic_characters:client:CharacterSpawned', function()
  CheckIfInApt()
end)


RegisterNetEvent('mythic_apartment:client:kickout')
AddEventHandler('mythic_apartment:client:kickout', function()
  if inApartment then
    inApartment = false
    TriggerEvent('mythic_instances:client:leave')
    TriggerEvent("CarryPeople:cl_cancel")
    SendNUIMessage({ action = "exit" })
    local rndElevator = GetRandomIntInRange(1, 6)
    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do Wait(0) end
    Citizen.Wait(500)
    for i = 1, 25 do
        SetEntityCoords(GetPlayerPed(-1), units[rndElevator].x, units[rndElevator].y, units[rndElevator].z)
        SetEntityHeading(GetPlayerPed(-1), units[rndElevator].h)
        Wait(50)
    end
    while IsEntityWaitingForWorldCollision(PlayerPedId()) do
        SetEntityCoords(GetPlayerPed(-1), units[rndElevator].x, units[rndElevator].y, units[rndElevator].z)
        SetEntityHeading(GetPlayerPed(-1), units[rndElevator].h)
        Wait(50)
    end
    DoScreenFadeIn(1500)
  end
end)

function CheckIfInApt()
  local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)
  local cntrDistance = #(vector3(aptCenter.x, aptCenter.y, aptCenter.z) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
  if cntrDistance < 20 and not inApartment then
    inApartment = true
    Citizen.Wait(500)
    startInstanceLoop()
    InApartment()
  end
end

RegisterNetEvent('mythic_apartment:client:init')
AddEventHandler('mythic_apartment:client:init', function(aptName, prison)
  myAptName = aptName
  startMainLoop()
  if prison <= 0 then
    CheckIfInApt()
  end
  local myRoomBlip = addBlip(lobbyMarker.x, lobbyMarker.y, lobbyMarker.z, 350, 35, "Hotel Room")
end)

function addBlip(x,y,z,idtype,idcolor,text)
  if x ~= nil and y ~= nil and z ~= nil then
    local blip = AddBlipForCoord(x+0.001,y+0.001,z+0.001) -- solve strange gta5 madness with integer -> double
    SetBlipSprite(blip, idtype)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip,idcolor)

    if text ~= nil then
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(text)
      EndTextCommandSetBlipName(blip)
    end

    return blip
  end
  return nil
end

function InApartment()
  Citizen.CreateThread(function()
    Citizen.Wait(1500)
    while inApartment do
      Citizen.Wait(0)
      plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)
      local exitDistance = #(vector3(aptDoor.x, aptDoor.y, aptDoor.z) - vector3(plyCoords.x, plyCoords.y, plyCoords.z))
      local stashDistance = #(vector3(aptStash.x, aptStash.y, aptStash.z) - vector3(plyCoords.x, plyCoords.y, plyCoords.z))
      local outfitsDistance = #(vector3(aptOutfits.x, aptOutfits.y, aptOutfits.z) - vector3(plyCoords.x, plyCoords.y, plyCoords.z))
      local logoutDistance = #(vector3(aptLogout.x, aptLogout.y, aptLogout.z) - vector3(plyCoords.x, plyCoords.y, plyCoords.z))

      if stashDistance < 0.8 then
        DrawText3d(aptStash.x, aptStash.y, aptStash.z,"~r~[~w~E~r~]~w~ Storage",0.25)
        if IsControlJustReleased(0, 54) then
          TriggerServerEvent("vRP:openChest","cheapMotel")
        end
      end

      if outfitsDistance < 0.8 then
        DrawText3d(aptOutfits.x, aptOutfits.y, aptOutfits.z,"~r~[~w~E~r~]~w~ Closet",0.25)
        if IsControlJustReleased(0, 54) then
          TriggerServerEvent("vRP:openWardrobe")
        end
      end

      if logoutDistance < 0.8 then
        DrawText3d(aptLogout.x, aptLogout.y, aptLogout.z,"~r~[~w~E~r~]~w~ Logout",0.25)

        if IsControlJustReleased(0, 54) then
          TriggerEvent('core:client:wipeWeapons')
          TriggerEvent('core:client:wipeProps')
          Citizen.Wait(500)
          -- Save any bullets that may have been fired (prevent exploiting)
          TriggerEvent('blrp_inventory:saveUsedBullets')
          TriggerServerEvent("vRP:syncPosition")
          inApartment = false
          TriggerEvent('disclaimer:reload')
          TriggerEvent('mythic_instances:client:leave')
          TriggerServerEvent('vrp:server:forceSaveSelf') -- Prevent exploiting
          TriggerServerEvent('mythic_characters:server:Logout')
          if myRoomBlip ~= nil then
            RemoveBlip(myRoomBlip)
          end
        end
      end

      if exitDistance < 0.8 then
        DrawText3d(aptDoor.x, aptDoor.y, aptDoor.z,"~r~[~w~E~r~]~w~ Exit",0.25)
        if IsControlJustReleased(0, 54) then
          inApartment = false
          TriggerEvent('mythic_instances:client:leave')
          TriggerEvent("CarryPeople:cl_cancel")
          SendNUIMessage({ action = "exit" })
          local rndElevator = GetRandomIntInRange(1, 6)
          DoScreenFadeOut(750)
          while not IsScreenFadedOut() do Wait(0) end
          Citizen.Wait(500)
          for i = 1, 25 do
              SetEntityCoords(GetPlayerPed(-1), units[rndElevator].x, units[rndElevator].y, units[rndElevator].z)
              SetEntityHeading(GetPlayerPed(-1), units[rndElevator].h)
              Wait(50)
          end
          while IsEntityWaitingForWorldCollision(PlayerPedId()) do
              SetEntityCoords(GetPlayerPed(-1), units[rndElevator].x, units[rndElevator].y, units[rndElevator].z)
              SetEntityHeading(GetPlayerPed(-1), units[rndElevator].h)
              Wait(50)
          end
          DoScreenFadeIn(1500)
          Citizen.Wait(1500)
        end
      end
    end
  end)
end

local instanceLoopActive = false

function startInstanceLoop()
  if not instanceLoopActive then
    TriggerServerEvent('instance:enterInstance', 'motel', true)
    Citizen.CreateThread(function()
      while inApartment do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local cntrDistance = #(vector3(aptCenter.x, aptCenter.y, aptCenter.z) - GetEntityCoords(GetPlayerPed(-1), 0))
        if cntrDistance > 50 then
          inApartment = false
          TriggerEvent("CarryPeople:cl_cancel")
          SendNUIMessage({ action = "exit" })
        end
      end
      instanceLoopActive = false
      TriggerServerEvent('instance:leaveInstance', 'motel', true)
    end)
  end
end

local mainLoopRunning = false
function startMainLoop()
  if not mainLoopRunning then
    mainLoopRunning = true
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(1)
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)
        local lobbydistance = #(vector3(lobbyMarker.x, lobbyMarker.y, lobbyMarker.z) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
        if lobbydistance < 20 then
          for k,v in pairs(units) do
            local distance = #(vector3(v.x, v.y, v.z) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
            if distance < 1 then
              if not IsPedInAnyVehicle(GetPlayerPed(), true) then
                DrawText3d(v.x, v.y, v.z,"~r~[~w~E~r~]~w~ Enter",0.25)
                if IsControlJustReleased(0, 54) then
                  TriggerEvent("vrp:client:playerPkg", function(pkg)
                    if not pkg.isInComa and not pkg.isHandcuffed and not pkg.isZiptied then
                      inApartment = true
                      SendNUIMessage({ action = "enter" })
                      TriggerEvent("CarryPeople:cl_cancel")
                      DoScreenFadeOut(750)
                      while not IsScreenFadedOut() do Wait(0) end
                      for i = 1, 25 do
                          SetEntityCoords(GetPlayerPed(-1), aptSpawn.x, aptSpawn.y, aptSpawn.z+0.08)
                          SetEntityHeading(GetPlayerPed(-1), aptSpawn.h)
                          Wait(50)
                      end
                      while IsEntityWaitingForWorldCollision(PlayerPedId()) do
                          SetEntityCoords(GetPlayerPed(-1), aptSpawn.x, aptSpawn.y, aptSpawn.z+0.08)
                          SetEntityHeading(GetPlayerPed(-1), aptSpawn.h)
                          Wait(50)
                      end
                      ClearPedWetness(PlayerPedId())
                      Citizen.Wait(500)
                      startInstanceLoop()
                      InApartment()
                      DoScreenFadeIn(1500)
                    end
                  end)
                end
              end
              break
            end
          end
        else
          Citizen.Wait(5000)
        end
      end
    end)
  end
end

function DrawText3d(x,y,z,text,scale,r,g,b)
  local r = r or 255
  local g = g or 255
  local b = b or 255
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())

  if onScreen then
    SetTextScale(scale, scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r,g,b,255)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end
