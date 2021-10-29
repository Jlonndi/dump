local function getInterriorByType(x, y, z, name, iplName)
	local id = 0

	if not IsIplActive(iplName) then
		RequestIpl(iplName)

		while not IsIplActive(iplName) do
			RequestIpl(iplName)
			-- print("Request Ipl:", iplName)
			Wait(100)
		end
	end

	while id == 0 do
		id = GetInteriorAtCoordsWithType(x, y, z, name)
		-- print("Interrior:", name, id)
		Wait(100)
	end

	return id
end

Citizen.CreateThread(function()
	local ipl_int_bar = getInterriorByType(-119.051,6386.766,32.099,"uj_int_bar", "uj_int_bar_milo_")
	local ipl_int_kh = getInterriorByType(-129.5960,6374.436,32.099,"uj_int_kh", "uj_int_kh_milo_")
	local ipl_int_st = getInterriorByType(-128.0602,6359.572,31.495,"uj_int_st", "uj_int_st_milo_")

	EnableInteriorProp(ipl_int_kh, "prop_lost_kh")
	DisableInteriorProp(ipl_int_kh, "prop_soa_kh")
	DisableInteriorProp(ipl_int_kh, "prop_reapers_kh")
	RefreshInterior(ipl_int_kh)

	function uj_bar_int(flag)
		if not flag then
			RefreshInterior(ipl_int_kh)
			EnableInteriorProp(ipl_int_kh, "close_door_without_bar")
			RemoveIpl("uj_int_bar_milo_")
			RequestIpl("uj_bar_ipl")
		else
			RefreshInterior(ipl_int_kh)
			DisableInteriorProp(ipl_int_kh, "close_door_without_bar")
			RequestIpl("uj_int_bar_milo_")
			RemoveIpl("uj_bar_ipl")
		end
	end

	function uj_kh_int(flag)
		if not flag then
			RefreshInterior(ipl_int_bar)
			RefreshInterior(ipl_int_st)
			EnableInteriorProp(ipl_int_bar, "close_door_bar")
			EnableInteriorProp(ipl_int_st, "close_door_without_kh")
			RemoveIpl("uj_int_kh_milo_")
			RequestIpl("uj_kh_ipl")
		else
			RefreshInterior(ipl_int_bar)
			DisableInteriorProp(ipl_int_bar, "close_door_bar")
			DisableInteriorProp(ipl_int_st, "close_door_without_kh")
			RequestIpl("uj_int_kh_milo_")
			RemoveIpl("uj_kh_ipl")
		end
	end

	function uj_st_int(flag)
		if not flag then
			RefreshInterior(ipl_int_kh)
			EnableInteriorProp(ipl_int_kh, "close_door_without_st")
			RemoveIpl("uj_int_st_milo_")
			RequestIpl("uj_st_ipl")
		else
			RefreshInterior(ipl_int_kh)
			DisableInteriorProp(ipl_int_kh, "close_door_without_st")
			RequestIpl("uj_int_st_milo_")
			RemoveIpl("uj_st_ipl")
		end
	end

	Citizen.CreateThread(function()
		uj_bar_int(true)
		uj_kh_int(true)
		uj_st_int(true)
	end)


	-- RefreshInterior(ipl_int_bar)
	-- RefreshInterior(ipl_int_kh)
	-- RefreshInterior(ipl_int_st)

	-- RequestIpl("uj_int_bar_milo_")
	-- RequestIpl("uj_int_kh_milo_")
	-- RequestIpl("uj_int_st_milo_")

	-- RequestIpl("uj_bar_ipl")
	-- RequestIpl("uj_kh_ipl")
	-- RequestIpl("uj_st_ipl")

	-- RemoveIpl("uj_bar_ipl")
	-- RemoveIpl("uj_kh_ipl")
	-- RemoveIpl("uj_st_ipl")

	-- EnableInteriorProp(ipl_int_kh, "prop_lost_kh")
	-- EnableInteriorProp(ipl_int_kh, "prop_soa_kh")
	-- EnableInteriorProp(ipl_int_kh, "prop_reapers_kh")
	-- DisableInteriorProp(ipl_int_kh, "prop_lost_kh")
	-- DisableInteriorProp(ipl_int_kh, "prop_soa_kh")
	-- DisableInteriorProp(ipl_int_kh, "prop_reapers_kh")

	-- DisableInteriorProp(ipl_int_bar, "close_door_bar")
	-- DisableInteriorProp(ipl_int_st, "close_door_without_bar")
	-- DisableInteriorProp(ipl_int_kh, "close_door_without_st")
	-- DisableInteriorProp(ipl_int_kh, "close_door_without_bar")

	-- RegisterCommand("ipl_lost", function(source, args, rawCommand)
	--     local ped = PlayerPedId()
	--     local interiorHash = GetInteriorFromEntity(ped)
	--         RefreshInterior(interiorHash)
	--         EnableInteriorProp(interiorHash, "prop_lost_kh")
	--         DisableInteriorProp(interiorHash, "prop_soa_kh")
	--         DisableInteriorProp(interiorHash, "prop_reapers_kh")
	-- end, false)

	-- RegisterCommand("ipl_soa", function(source, args, rawCommand)
	--     local ped = PlayerPedId()
	--     local interiorHash = GetInteriorFromEntity(ped)
	--         RefreshInterior(interiorHash)
	--         EnableInteriorProp(interiorHash, "prop_soa_kh")
	--         DisableInteriorProp(interiorHash, "prop_lost_kh")
	--         DisableInteriorProp(interiorHash, "prop_reapers_kh")
	-- end, false)

	-- RegisterCommand("ipl_rea", function(source, args, rawCommand)
	--     local ped = PlayerPedId()
	--     local interiorHash = GetInteriorFromEntity(ped)
	--         RefreshInterior(interiorHash)
	--         EnableInteriorProp(interiorHash, "prop_reapers_kh")
	--         DisableInteriorProp(interiorHash, "prop_lost_kh")
	--         DisableInteriorProp(interiorHash, "prop_soa_kh")
	-- end, false)
end)

Citizen.CreateThread(function()
	Wait(0)
	SetEmitterRadioStation('collision_9cn35z5', 'RADIO_08_MEXICAN')
end)