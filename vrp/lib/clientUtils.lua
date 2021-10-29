function GetClosestPed(radius)
    local closestPed = 0

    for ped in EnumeratePeds() do
        local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped), true)
        if distanceCheck <= radius+.000001 and ped ~= PlayerPedId() then
            closestPed = ped
            break
        end
    end

    return closestPed
end

function GetPlayers()
	local players = {}

	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)

		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end

	return players
end

function GetClosestPlayer(coords) -- needs updating for all calls
	local players, closestDistance, closestPlayer = GetPlayers(), -1, -1
	local coords, usePlayerPed = coords, false
	local playerPed, playerId = PlayerPedId(), PlayerId()

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		usePlayerPed = true
		coords = GetEntityCoords(playerPed)
	end

	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])

		if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
			local targetCoords = GetEntityCoords(target)
			local distance = #(coords - targetCoords)

			if closestDistance == -1 or closestDistance > distance then
				closestPlayer = players[i]
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

function GetClosestPlayers(radius)
  local closestPeds = {}

  for ped in EnumeratePeds() do
    local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped), true)
    if distanceCheck <= radius+.000001 and ped ~= PlayerPedId() then
      local closePedID = GetPlayerByEntityID(ped)
      if closePedID ~= nil and NetworkIsPlayerActive(closePedID) then
        local closestPed = GetPlayerServerId(closePedID)
        table.insert(closestPeds, closestPed)
      end
    end
  end
  return closestPeds
end

function GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

function GetClosestVehicle(radius)
	local vehicles = GetVehicles()
	local closestVehicle, closestDistance,  coords = -1, -1, -1
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance = #(coords - vehicleCoords)

		if (closestDistance == -1 or closestDistance > distance) and distance <= radius then
			closestVehicle = vehicles[i]
		end
	end

	return closestVehicle
end

function TargetVehicleInProximity(radius,vplate,vname)
  local closestVeh = 0

  for veh in EnumerateVehicles() do
    local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(veh), true)
    if distanceCheck <= radius+.000001 then
      local carModel = GetEntityModel(veh)
      local carName = GetDisplayNameFromVehicleModel(carModel)
      local plate = GetVehicleNumberPlateText(veh)
      local args = tvRP.stringsplit(plate)
      closestVeh = veh
      if args ~= nil then
        plate = args[1]
        if vplate == plate and string.lower(vname) == string.lower(carName) then
          return true
        end
      end
    end
    end
  return false
end

function GetClosestParkedVehicles(radius, maxQty)
	local closestVehicles = {}
	local count = 0
	for veh in EnumerateVehicles() do
		local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(veh), true)
		local popType = GetEntityPopulationType(veh)
		if distanceCheck <= radius+.000001 and popType == 2 then
			count = count + 1
			table.insert(closestVehicles, veh)
		end
		if count == maxQty then
			break
		end
	end
	return closestVehicles
end

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

function EnumerateEntities(poolname)
  return coroutine.wrap(function()
		for _, pool_handle in ipairs(GetGamePool(poolname)) do
			coroutine.yield(pool_handle)
		end
  end)
end

function EnumerateObjects()
  return EnumerateEntities('CObject')
end

function EnumeratePeds()
  return EnumerateEntities('CPed')
end

function EnumerateVehicles()
  return EnumerateEntities('CVehicle')
end

function EnumeratePickups()
  return EnumerateEntities('CPickup')
end

function GetPlayerByEntityID(id)
  for _, i in ipairs(GetActivePlayers()) do
    if(GetPlayerPed(i) == id) then return i end
  end
	return nil
end
