traffic_density = 0.5
ambient_vehicle = 0.6
random_vehicle = 0.6
parked_vehicle_density = 0.6
ped_density = 2.0
scenario_ped_density = 1.5
meth_hash = `a_m_y_methhead_01`

Citizen.CreateThread(function()
	--SetPedPopulationBudget(100)
	--SetVehiclePopulationBudget(8)
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(PlayerPedId())
		local current_zone = GetNameOfZone(pos.x, pos.y, pos.z)
		if current_zone == 'ARMYB' then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0,0.0)
		else
			SetAmbientVehicleRangeMultiplierThisFrame(ambient_vehicle)
			SetVehicleDensityMultiplierThisFrame(traffic_density)
			SetRandomVehicleDensityMultiplierThisFrame(random_vehicle)
			SetParkedVehicleDensityMultiplierThisFrame(parked_vehicle_density)
			SetPedDensityMultiplierThisFrame(ped_density)
			SetScenarioPedDensityMultiplierThisFrame(scenario_ped_density,scenario_ped_density)
		end
		SetPedModelIsSuppressed(meth_hash, true)
	end
end)
