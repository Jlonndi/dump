local box = nil
local animlib = 'anim@mp_fireworks'

local setFwFountain = function(firecoords,times,box,colour)
  if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
    RequestNamedPtfxAsset("scr_indep_fireworks")
    while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
      Wait(10)
    end
  end

  repeat
    UseParticleFxAssetNextCall("scr_indep_fireworks")
    if colour == "red" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 0.0, 0.0 ,0.0)
    elseif colour == "blue" then
      SetParticleFxNonLoopedColour(0.0, 0.0, 255.0, 0.0 ,0.0)
    elseif colour == "white" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 255.0, 0.0, 0.0)
    elseif colour == "green" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "yellow" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "purple" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 255.0, 0.0, 0.0)
    elseif colour == "turqouise" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 255.0, 0.0, 0.0)
    end
    part1 = StartParticleFxNonLoopedAtCoord("scr_indep_firework_".."fountain", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false)
    times = times - 1
    Citizen.Wait(2000)
  until(times == 0)
  DeleteEntity(box)
  box = nil
end

local setFwShotburst = function(firecoords,times,box,colour)
  if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
    RequestNamedPtfxAsset("scr_indep_fireworks")
    while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
      Wait(10)
    end
  end

  repeat
    UseParticleFxAssetNextCall("scr_indep_fireworks")
    if colour == "red" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 0.0, 0.0 ,0.0)
    elseif colour == "blue" then
      SetParticleFxNonLoopedColour(0.0, 0.0, 255.0, 0.0 ,0.0)
    elseif colour == "white" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 255.0, 0.0, 0.0)
    elseif colour == "green" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "yellow" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "purple" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 255.0, 0.0, 0.0)
    elseif colour == "turqouise" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 255.0, 0.0, 0.0)
    end
    part1 = StartParticleFxNonLoopedAtCoord("scr_indep_firework_".."shotburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false)
    times = times - 1
    Citizen.Wait(2000)
  until(times == 0)
  DeleteEntity(box)
  box = nil
end

local setFwStarburst = function(firecoords,times,box,colour)
  if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
    RequestNamedPtfxAsset("scr_indep_fireworks")
    while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
      Wait(10)
    end
  end

  repeat
    UseParticleFxAssetNextCall("scr_indep_fireworks")
    if colour == "red" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 0.0, 0.0 ,0.0)
    elseif colour == "blue" then
      SetParticleFxNonLoopedColour(0.0, 0.0, 255.0, 0.0 ,0.0)
    elseif colour == "white" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 255.0, 0.0, 0.0)
    elseif colour == "green" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "yellow" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "purple" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 255.0, 0.0, 0.0)
    elseif colour == "turqouise" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 255.0, 0.0, 0.0)
    end
    part1 = StartParticleFxNonLoopedAtCoord("scr_indep_firework_".."starburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false)
    times = times - 1
    Citizen.Wait(2000)
  until(times == 0)
  DeleteEntity(box)
  box = nil
end

local setFwTrailburst = function(firecoords,times,box,colour)
  if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
    RequestNamedPtfxAsset("scr_indep_fireworks")
    while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
      Wait(10)
    end
  end

  repeat
    UseParticleFxAssetNextCall("scr_indep_fireworks")
    if colour == "red" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 0.0, 0.0 ,0.0)
    elseif colour == "blue" then
      SetParticleFxNonLoopedColour(0.0, 0.0, 255.0, 0.0 ,0.0)
    elseif colour == "white" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 255.0, 0.0, 0.0)
    elseif colour == "green" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "yellow" then
      SetParticleFxNonLoopedColour(255.0, 255.0, 0.0, 0.0, 0.0)
    elseif colour == "purple" then
      SetParticleFxNonLoopedColour(255.0, 0.0, 255.0, 0.0, 0.0)
    elseif colour == "turqouise" then
      SetParticleFxNonLoopedColour(0.0, 255.0, 255.0, 0.0, 0.0)
    end
    part1 = StartParticleFxNonLoopedAtCoord("scr_indep_firework_".."trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false)
    times = times - 1
    Citizen.Wait(2000)
  until(times == 0)
  DeleteEntity(box)
  box = nil
end

local firework_types = {
  ["Fountain"] = {anim = "PLACE_FIREWORK_4_CONE", prop = "ind_prop_firework_04", action = setFwFountain},
  ["Shotburst"] = {anim = "PLACE_FIREWORK_3_BOX", prop = "ind_prop_firework_03", action = setFwShotburst},
  ["Starburst"] = {anim = "PLACE_FIREWORK_2_CYLINDER", prop = "ind_prop_firework_02", action = setFwStarburst},
  ["Trailburst"] = {anim = "PLACE_FIREWORK_1_ROCKET", prop = "ind_prop_firework_04", action = setFwTrailburst},
}

RegisterNetEvent('vrp:fireworks:deploy')
AddEventHandler('vrp:fireworks:deploy', function(type, colour)
  tvRP.deployFireWork(type, colour)
end)

RegisterNetEvent('vrp:fireworks:deployPosition')
AddEventHandler('vrp:fireworks:deployPosition', function(type, colour, firecoords, times)
  firework_types[type].action(firecoords,times,-1,colour)
end)

function tvRP.deployFireWork(type, colour)
  RequestAnimDict(animlib)

  while not HasAnimDictLoaded(animlib) do
    Citizen.Wait(10)
  end
  local pedcoords = GetEntityCoords(GetPlayerPed(-1))
  local ped = GetPlayerPed(-1)


  TaskPlayAnim(ped, animlib, firework_types[type].anim, -1, -8.0, 3000, 0, 0, false, false, false)
  Citizen.Wait(4000)
  ClearPedTasks(ped)

  box = CreateObject(GetHashKey(firework_types[type].prop), pedcoords, true, false, false)
  PlaceObjectOnGroundProperly(box)
  FreezeEntityPosition(box, true)
  Citizen.CreateThread(function()
    local fireBox = box
    local firecoords = GetEntityCoords(fireBox)
    local times = 20
    Citizen.Wait(10000)
    vRPserver.initFireworkSynq({firecoords,times,fireBox,colour,type})
    --firework_types[type].action(firecoords,times,fireBox,colour)
  end)
end

function tvRP.shootFireworks(firecoords,times,fireBox,colour,type)
  firework_types[type].action(firecoords,times,fireBox,colour)
end
