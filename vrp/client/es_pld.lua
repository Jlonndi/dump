-- Use the following variable(s) to adjust the position.
-- adjust the x-axis (left/right)
local x = 1.000
-- adjust the y-axis (top/bottom)
local y = 1.000
-- If you do not see the HUD after restarting script you adjusted the x/y axis too far.

-- Use the following variable(s) to adjust the color(s) of each element.
-- Use the following variables to adjust the color of the border around direction.
local border_r = 255
local border_g = 255
local border_b = 255
local border_a = 100

-- Use the following variables to adjust the color of the direction user is facing.
local dir_r = 255
local dir_g = 255
local dir_b = 255
local dir_a = 255

-- Use the following variables to adjust the color of the street user is currently on.
local curr_street_r = 240
local curr_street_g = 200
local curr_street_b = 80
local curr_street_a = 255

-- Use the following variables to adjust the color of the street around the player. (this will also change the town the user is in)
local str_around_r = 255
local str_around_g = 255
local str_around_b = 255
local str_around_a = 255

-- Use the following variables to adjust the color of the city the player is in (without there being a street around them)
local town_r = 255
local town_g = 255
local town_b = 255
local town_a = 255

local hunger = 0
local thirst = 0
local job = ""
local espEnabled = false

local var1 = nil
local var2 = nil
local str_var1 = nil
local str_var2 = nil
local current_zone = nil
local direction = nil
local var1 = nil
local var1 = nil

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(6)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt3(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(2, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['golf'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', }

local showUI = true
local setVoiceProximity = "Normal"
local showAdvancedUI = false

RegisterNetEvent('camera:hideUI')
AddEventHandler('camera:hideUI', function(toggle)
  if toggle ~= nil then
    showUI = toggle
  end
end)

RegisterNetEvent('vrp:minimalHUDtoggle')
AddEventHandler('vrp:minimalHUDtoggle', function(toggle)
  if toggle ~= nil then
    showAdvancedUI = toggle
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    str_var1 = GetStreetNameFromHashKey(var1)
    str_var2 = GetStreetNameFromHashKey(var2)
    current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]
    for k,v in pairs(directions)do
      direction = GetEntityHeading(ped)
      if(math.abs(direction - k) < 22.5)then
        direction = v
        break;
      end
    end
  end
end)

Citizen.CreateThread(function()
  Citizen.Wait(5000)
  while true do
    Citizen.Wait(1)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if showUI then
      local timeMinutes = GetClockMinutes()
      if timeMinutes < 10 then
        timeMinutes = "0"..timeMinutes
      end
      local currentTime = GetClockHours()..":"..timeMinutes

      -- 1 Pixel X = 0.0005208 for 1920 - 0.0 = Left
      -- 1 Pixel Y = 0.0009259 for 1080 - 0.0 = Top
      --drawRct(   X   ,    Y  , WIDTH , HEIGHT, R , G , B , Alp)
      drawRct(0.0151032, 0.967593, 0.140616, 0.027777, 41, 41, 41, 255) -- Black background 270x30
      drawRct(0.0166656, 0.9703432, 0.067704, 0.009259, 188, 188, 188, 80) -- Health 130x10
      drawRct(0.0864528, 0.9703432, 0.067704, 0.009259, 188, 188, 188, 80) -- Armor 130x10
      drawRct(0.0166656, 0.9833058, 0.067704, 0.009259, 188, 188, 188, 80) -- Hunger 130x10
      drawRct(0.0864528, 0.9833058, 0.067704, 0.009259, 188, 188, 188, 80) -- Thirst 130x10

      -- Health Color
      local health = GetEntityHealth(ped) - 100
      local varSet = 0.067704 * (health / 100)
      drawRct(0.0166656, 0.9703432, varSet, 0.009259, 55, 115, 55, 255)

      -- Armor Color
      armor = GetPedArmour(ped)
      if armor > 100.0 then armor = 100.0 end
      local varSet = 0.067704 * (armor / 100)
      drawRct(0.0864528, 0.9703432, varSet, 0.009259, 75, 75, 255, 250)

      -- Hunger Color
      if hunger > 100.0 then hunger = 100.0 end
      local varSet = 0.067704 * (hunger / 100)
      drawRct(0.0166656, 0.9833058, varSet, 0.009259, 255, 153, 0, 250)

      -- Thirst Color
      if thirst > 100.0 then thirst = 100.0 end
      local varSet = 0.067704 * (thirst / 100)
      drawRct(0.0864528, 0.9833058, varSet, 0.009259, 75, 75, 255, 250)

      -- Aircraft / Parachute Elevation
      if GetPedParachuteState(ped) ~= -1 or IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped) then
        altitude = GetEntityHeightAboveGround(ped)
        local x,y,z = table.unpack(pos) -- Elevation from Sea Level
        feet = (z / 0.3048) -- Convert Meters to Feet
      end

      local output = ""
      local pipeRequired = false
      if IsPedInAnyVehicle(ped) then
        if tvRP.getSeatbeltStatus() then
          output = output .. "~g~Seatbelt"
        else
          output = output .. "~r~Seatbelt"
        end
        pipeRequired = true
      end
      if tvRP.getGodModeState() then
        if pipeRequired then
          output = output .. "~w~ | "
        end
        output = output .. "~r~GODMODE"
        pipeRequired = true
      end
      local isDev = GetConvarInt('dev', -1)
      if isDev == 1 then
        if pipeRequired then
          output = output .. "~w~ | "
        end
        output = output .. "~r~DEVELOPMENT SERVER"
        pipeRequired = true
      end
      if espEnabled then
        if pipeRequired then
          output = output .. "~w~ | "
        end
        output = output .. "~r~ESP"
      end
      if showAdvancedUI then -- To be replace with GPS UI
        drawTxt2(0.665, y+0.42, 1.0,1.0,0.30, output, curr_street_r, curr_street_g, curr_street_b, curr_street_a)
        drawTxt3(0.000 + 0.52, -0.001 + 1.266, 1.0,1.0,0.35, "~w~" .. currentTime, 240, 200, 80, 255)

        if IsPedInAnyHeli(ped) then -- Elevation Helicopter
          if(altitude < 91.44) then -- below 300 ft - Way to Low
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~r~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 106.68) then -- below 350 ft - Risky Level
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~o~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 121.92) then -- below 400 ft - Caution
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~y~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          else
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~w~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          end
        end

        if IsPedInAnyPlane(ped) then -- Elevation Plane
          if(altitude < 182.88) then -- below 600 ft - Way to Low
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~r~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 213.36) then -- below 700 ft - Risky Level
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~o~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 243.84) then -- below 800 ft - Caution
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~y~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          else
            drawTxt3(0.000 + 0.635, -0.001 + 1.266, 1.0,1.0,0.35, "~w~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          end
        end

        if(current_zone and str_var1) then
          drawTxt2(0.665, y+0.44, 1.0,1.0,0.80, direction, dir_r, dir_g, dir_b, dir_a)
          if str_var2 == "" then
            drawTxt2(0.695, y+0.465, 1.0,1.0,0.35, current_zone, town_r, town_g, town_b, town_a)
          else
            drawTxt2(0.695, y+0.465, 1.0,1.0,0.35, str_var2 .. ", " .. current_zone, str_around_r, str_around_g, str_around_b, str_around_a)
          end
          drawTxt2(0.695, y+0.44, 1.0,1.0,0.45, str_var1, curr_street_r, curr_street_g, curr_street_b, curr_street_a)
        end

        DisplayRadar(true)

      else
        drawTxt2(0.55, 1.433, 1.0,1.0,0.35, output, curr_street_r, curr_street_g, curr_street_b, curr_street_a)
        drawTxt3(0.52, 1.433, 1.0,1.0,0.35, "~w~" .. currentTime, 240, 200, 80, 255)

        if GetPedParachuteState(ped) ~= -1 then
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~w~" .. math.ceil(altitude) .. "~w~ ft", 240, 200, 80, 255)
        end

        if IsPedInAnyHeli(ped) then -- Elevation Helicopter
          if(altitude < 91.44) then -- below 300 ft - Way to Low
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~r~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 106.68) then -- below 350 ft - Risky Level
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~o~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 121.92) then -- below 400 ft - Caution
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~y~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          else
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~w~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          end
        end

        if IsPedInAnyPlane(ped) then -- Elevation Plane
          if(altitude < 182.88) then -- below 600 ft - Way to Low
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~r~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 213.36) then -- below 650 ft - Risky Level
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~o~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          elseif(altitude < 243.84) then -- below 700 ft - Caution
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~y~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          else
            drawTxt3(0.635, 1.433, 1.0,1.0,0.35, "~w~" .. math.ceil(feet) .. "~w~ ft", 240, 200, 80, 255)
          end
        end

        if(current_zone and str_var1) then
          drawTxt2(0.665, y+0.44, 1.0,1.0,0.80, direction, dir_r, dir_g, dir_b, dir_a)
          if str_var2 == "" then
            drawTxt2(0.695, y+0.465, 1.0,1.0,0.35, current_zone, town_r, town_g, town_b, town_a)
          else
            drawTxt2(0.695, y+0.465, 1.0,1.0,0.35, str_var2 .. ", " .. current_zone, str_around_r, str_around_g, str_around_b, str_around_a)
          end
          drawTxt2(0.695, y+0.44, 1.0,1.0,0.45, str_var1, curr_street_r, curr_street_g, curr_street_b, curr_street_a)
        end
        DisplayRadar(false)
      end
    end


    local t = 0
    if showLocalPlayerIDs then
      for _, i in ipairs(GetActivePlayers()) do
          local user_id = tvRP.getSpoofedUserId(GetPlayerServerId(i))
          if (HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(i), 17) and IsEntityVisible(GetPlayerPed(i))) then
            local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(i), 0, 0, 1.4)
            local inView = IsEntityAtCoord(PlayerPedId(), pos.x, pos.y, pos.z, 15.001, 15.001, 15.001, 0, 1, 0)
            if inView then
              local x,y,z = World3dToScreen2d(pos.x, pos.y, pos.z)
              if not user_id then
                user_id = "unk"
              end
              SetTextFont(11)
              SetTextScale(0.0, 0.30)
              SetTextColour(255, 255, 255, 255);
              SetTextDropShadow(5, 0, 78, 255, 255);
              SetTextEdge(0, 0, 0, 0, 0);
              SetTextEntry("STRING");
              SetTextCentre(1)

              if NetworkIsPlayerTalking(i) then
                AddTextComponentString("~b~"..user_id)
              else
                AddTextComponentString(user_id)
              end
              DrawText(y, z)
            end
          end
        end
    end
  end
end)

--local plist = false
--local alerted = false
--function ShowPlayerList()
--  if plist == false then
--    local players
--    players = '<tr class= "titles"><th class="name">Name</th><th class="id">ID</th><th class="name">Name</th><th class="id">ID</th></tr>'
--    ptable = GetPlayers()
--    local columns = 1
--    for _, i in ipairs(ptable) do
--      local id = tvRP.getSpoofedUserId(GetPlayerServerId(i))
--      if not id then
--        id = "unk"
--      end
--      if columns == 1 then
--        columns = 2
--        players = players..' <tr class="player"><th class="name">'..tvRP.getSpoofedUserName(i)..'</th>'..' <th class="id">'..id..'</th>'
--      elseif columns == 2 then
--        columns = 1
--        players = players..' <th class="name">'..tvRP.getSpoofedUserName(i)..'</th>'..' <th class="id">'..id..'</th></tr>'
--      else
--        columns = 1
--        players = players..' <tr class="player"><th class="name">'..tvRP.getSpoofedUserName(i)..'</th>'..' <th class="id">'..id..'</th></tr>'
--      end
--    end
--    players = players..'<tr class= "player"><th class="name">Total Online: '..tostring(#ptable)..'</th></tr>'
--    SendNUIMessage({
--      meta = 'open',
--      players = players
--    })
--    plist = true
--    if not alerted and not tvRP.isAdmin() then
--      alerted = true
--      TriggerServerEvent("_chat:viewingPlayerIDs", tvRP.getMyVrpId())
--    end
--  else
--    SendNUIMessage({
--      meta = 'close'
--    })
--    plist = false
--    alerted = false
--  end
--end

RegisterNetEvent('es_pld:client:togglePlayerList')
AddEventHandler('es_pld:client:togglePlayerList', function(list_html)
  if list_html then
    SendNUIMessage({ meta = 'open', players = list_html })
  else
    SendNUIMessage({ meta = 'close' })
  end
end)

RegisterNetEvent("menu:forceCloseMenu")
AddEventHandler("menu:forceCloseMenu", function()
	SendNUIMessage({ meta = 'close' })
end)

function GetPlayers()
  local players = {}

  for _, i in ipairs(GetActivePlayers()) do
    table.insert(players, i)
  end

  return players
end

RegisterNetEvent('vrp:client:es_pld:setEspState')
AddEventHandler('vrp:client:es_pld:setEspState', function(state)
  espEnabled = state
end)

--Citizen.CreateThread( function()
--  while true do
--    Citizen.Wait(0)
--    --Displays playerlist when player hold F6
--    if not IsControlPressed(0, 121) then
--      if IsControlJustPressed(1, 167) or IsDisabledControlJustPressed(1,167) then --Start holding
--        ShowPlayerList()
--        showLocalPlayerIDs = true
--      elseif IsControlJustReleased(1, 167) or IsDisabledControlJustReleased(1,167) then --Stop holding
--        ShowPlayerList()
--        showLocalPlayerIDs = false
--      end
--    end
--  end
--end)

RegisterNetEvent('vrp:client:setShowLocalUserIdsState')
AddEventHandler('vrp:client:setShowLocalUserIdsState', function(state)
  showLocalPlayerIDs = state
end)

RegisterNetEvent('banking:updateJob')
AddEventHandler('banking:updateJob', function(nameJob)
  job = nameJob
end)

RegisterNetEvent('banking:updateHunger')
AddEventHandler('banking:updateHunger', function(food)
  hunger = food
end)

RegisterNetEvent('banking:updateThirst')
AddEventHandler('banking:updateThirst', function(drink)
  thirst = drink
end)
-- ###################################
--
--       Credits: Sighmir and Shadow
--       --- for bars
-- ###################################
function drawRct(x,y,width,height,r,g,b,a)
  DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end
