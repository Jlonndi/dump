local ind = {l = false, r = false}
local oldCarSpeed = -1

Citizen.CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then

				-- Speed
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 2.236936)
				if carSpeed ~= oldCarSpeed then
					SendNUIMessage({
						showhud = true,
						speed = carSpeed
					})
				end
				oldCarSpeed = carSpeed
				-- Lights
				_,lightsOnCheck,highbeamsOnCheck = GetVehicleLightsState(PedCar)
				if(lightsOnCheck == 1) then
					SendNUIMessage({
						lightsOn = true
					})
				else
					SendNUIMessage({
						lightsOn = false
					})
				end
				if(highbeamsOnCheck == 1) then
					SendNUIMessage({
						highbeamsOn = true
				})
				else
					SendNUIMessage({
						highbeamsOn = false
				})
				end

				-- Turn Signals
				-- SetVehicleIndicatorLights (1 left -- 0 right)
				local VehIndicatorLight = GetVehicleIndicatorLights(GetVehiclePedIsUsing(PlayerPedId()))
				if(VehIndicatorLight == 0) then
					SendNUIMessage({
						leftturnSignal = false,
						rightturnSignal = false,
					})
				elseif(VehIndicatorLight == 1) then
					SendNUIMessage({
						leftturnSignal = true,
						rightturnSignal = false,
					})
				elseif(VehIndicatorLight == 2) then
					SendNUIMessage({
						leftturnSignal = false,
						rightturnSignal = true,
					})
				elseif(VehIndicatorLight == 3) then
					SendNUIMessage({
						leftturnSignal = true,
						rightturnSignal = true,
					})
				end

			else
				SendNUIMessage({
					showhud = false
				})
			end
		else
			SendNUIMessage({
				showhud = false
			})
		end

		Citizen.Wait(100)
	end
end)

-- Consume fuel factor
--[[
Citizen.CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
				fuel = GetVehicleFuelLevel(PedCar)
				rpm = GetVehicleCurrentRpm(PedCar)
				rpmfuel = 0

				if rpm > 0.9 then
					rpmfuel = fuel - rpm / 0.8
					Citizen.Wait(1000)
				elseif rpm > 0.8 then
					rpmfuel = fuel - rpm / 1.1
					Citizen.Wait(1500)
				elseif rpm > 0.7 then
					rpmfuel = fuel - rpm / 2.2
					Citizen.Wait(2000)
				elseif rpm > 0.6 then
					rpmfuel = fuel - rpm / 4.1
					Citizen.Wait(3000)
				elseif rpm > 0.5 then
					rpmfuel = fuel - rpm / 5.7
					Citizen.Wait(4000)
				elseif rpm > 0.4 then
					rpmfuel = fuel - rpm / 6.4
					Citizen.Wait(5000)
				elseif rpm > 0.3 then
					rpmfuel = fuel - rpm / 6.9
					Citizen.Wait(6000)
				elseif rpm > 0.2 then
					rpmfuel = fuel - rpm / 7.3
					Citizen.Wait(8000)
				else
					rpmfuel = fuel - rpm / 7.5
					Citizen.Wait(15000)
				end

				carFuel = SetVehicleFuelLevel(PedCar, rpmfuel)

				SendNUIMessage({
			showfuel = true,
					fuel = fuel
				})
			end
		end

		Citizen.Wait(1)
	end
end)
]]--

RegisterNetEvent('speedometer:fuel')
AddEventHandler('speedometer:fuel', function(fuelAmount)
	if fuelAmount ~= nil then
		SendNUIMessage({
			showfuel = true,
			fuel = fuelAmount
		})
	end
end)
