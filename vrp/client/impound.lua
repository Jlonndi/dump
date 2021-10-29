function tvRP.impoundVehicleAtYard()
	local radius = 5
	local player = PlayerPedId()
	local vehicle = nil
	local distance = nil
	tvRP.selectTargetVehicle(radius, function(vehicle)
		if vehicle ~= -1 and vehicle ~= nil then
			-- TODO add something to avoit your tow from being impounded at yar
			px, py, pz = table.unpack(GetEntityCoords(player, true))
			vx, vy, vz = table.unpack(GetEntityCoords(vehicle, false))
			coordA = GetEntityCoords(player, true)
			local plate = nil
			local carName = nil
			distance = #(vector3(px, py, pz)-vector3(vx, vy, vz))

			impounded = false
			if distance ~= nil and distance <= radius and vehicle ~= 0 then
				carModel = GetEntityModel(vehicle)
				carName = GetDisplayNameFromVehicleModel(carModel)
				plate = GetVehicleNumberPlateText(vehicle)
				args = tvRP.stringsplit(plate)
				plate = args[1]
				local nid = NetworkGetNetworkIdFromEntity(vehicle)
				--SetEntityAsMissionEntity(vehicle, true, true)
				--DeleteVehicle(vehicle)
				vRPserver.deleteVehicle_sv({nid})
			end
			Citizen.Wait(500)
			-- check if the vehicle failed to impound. This happens if another player is nearby
			local vehicle_out = tvRP.searchForVeh(player,10,plate,carName)
			if plate ~= nil and carName ~= nil and not DoesEntityExist(vehicle) then
				tvRP.notify("Vehicle Impounded.")
				impounded = true
				local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
				return TriggerServerEvent('vrp:server:finishImpound', true, carName, plate, x, y, z)
			end
			if not impounded then
				tvRP.notify("No Vehicle Nearby.")
			end
			return TriggerServerEvent('vrp:server:finishImpound', false, "", "", "","","")
		else
			tvRP.notify("No vehicle to impound.")
			return TriggerServerEvent('vrp:server:finishImpound', false, "", "", "","","")
		end

		print('this should not of been printed, for client/impound.lua')
	end)
end

function tvRP.tagNearestVehicleForTow(radius)
	vehicle = GetClosestVehicle(radius)
	local netId = NetworkGetNetworkIdFromEntity(vehicle)
	plate = GetVehicleNumberPlateText(vehicle)
	if plate ~= nil and vehicle ~= nil and vehicle ~= -1 then
		args = tvRP.stringsplit(plate)
		if args ~= nil then
			plate = args[1]
			carModel = GetEntityModel(vehicle)
			carName = GetDisplayNameFromVehicleModel(carModel)
			if tvRP.getIsVehicleOwnerByNetId(netId,plate) or tvRP.isCop() then
				tvRP.notify("Vehicle tagged for towing")
				-- vRPserver.serverVehicleDoorLocks({netId, 2})
				player = PlayerPedId()
				coord = GetEntityCoords(player, true)
				vRPserver.addToTowList({plate,carName,coord.x,coord.y,coord.z})

        TriggerEvent('blrp_core:client:prepareAlert', {
	        sender = GetPlayerServerId(PlayerId()),
          service_name = 'Tow Truck',
          allow_phone = false,
          coords = coord,
          msg = 'Vehicle marked for towing. Please bring to impound lot'
        })

				SetEntityAsMissionEntity(vehicle,true,true)
			else
				tvRP.notify("You cannot tag someone else's vehicle for towing")
			end
		else
			tvRP.notify("No vehicle found")
		end
	else
		tvRP.notify("No vehicle found")
	end
end
