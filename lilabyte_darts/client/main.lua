local config = json.decode(LoadResourceFile(GetCurrentResourceName(), 'config.json'))
local playerPed = nil
local playerCoords = nil
local dartsCoords = vector3(config.darts.x, config.darts.y, config.darts.z)
local isInGame = false
local game = {
    focus = 100,
    trianglePoints = {
        [0] = 20,
        [10] = 3,
        [1] = 1,
        [11] = 19,
        [2] = 18,
        [12] = 7,
        [3] = 4,
        [13] = 16,
        [4] = 13,
        [14] = 8,
        [5] = 6,
        [15] = 11,
        [6] = 10,
        [16] = 14,
        [7] = 15,
        [17] = 9,
        [8] = 2,
        [18] = 12,
        [9] = 17,
        [19] = 5,
        [20] = 20
    }
}
local Scale = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS");

Citizen.CreateThread(function()
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        if not isInGame then
            local darts = nil
            local ped_coords = GetEntityCoords(PlayerPedId())
            local first_found_entity1 = GetClosestObjectOfType(ped_coords, 1.0, GetHashKey('prop_dart_bd_01'), false)
            local first_found_entity2= GetClosestObjectOfType(ped_coords, 1.0, GetHashKey('prop_dart_bd_cab_01'), false)
            if first_found_entity1 ~= 0 then
              darts = first_found_entity1
            elseif first_found_entity2 ~= 0 then
              darts = first_found_entity2
            end
            --[[
            for object in EnumerateObjects() do
                if DoesEntityExist(object) and (GetEntityModel(object) == GetHashKey('prop_dart_bd_01') or GetEntityModel(object) == GetHashKey('prop_dart_bd_cab_01')) then
                    local objectCoords = GetEntityCoords(object)
                    if #(objectCoords - playerCoords) <= 1.0 then
                        darts = object
                    end
                end
            end
            ]]
            if darts then
                DisplayHelpText(config.text.join_message..'\n'..config.text.clear_message)
                if IsControlJustPressed(0, 38) then
                    StartGame()
                elseif IsControlJustPressed(0, 75) then
                    ClearBoard()
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isInGame then
            DisplayStats()
            BeginScaleformMovieMethod(Scale, "CLEAR_ALL");
            EndScaleformMovieMethod();

            BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(2);
            PushScaleformMovieMethodParameterString("~INPUT_RELOAD~");
            PushScaleformMovieMethodParameterString(config.text.controls.throw);
            EndScaleformMovieMethod();

            BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(1);
            PushScaleformMovieMethodParameterString("~INPUT_JUMP~");
            PushScaleformMovieMethodParameterString(config.text.controls.aim);
            EndScaleformMovieMethod();

            BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(0);
            PushScaleformMovieMethodParameterString("~INPUT_VEH_DUCK~");
            PushScaleformMovieMethodParameterString(config.text.controls.exit);
            EndScaleformMovieMethod();

            BeginScaleformMovieMethod(Scale, "DRAW_INSTRUCTIONAL_BUTTONS");
            ScaleformMovieMethodAddParamInt(0);
            EndScaleformMovieMethod();

            DrawScaleformMovieFullscreen(Scale, 255, 255, 255, 255, 0);

            DisableControlAction(0, 102)
            DisableControlAction(0, 22)
            DisableControlAction(0, 21)
            DisableControlAction(0, 140)
            DisableControlAction(0, 263)

            if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 73) then
                StopGame()
            elseif not IsDisabledControlPressed(0, 22) and game['animState'] == 'aim' then
                    if IsEntityPlayingAnim(playerPed, 'mini@darts', 'throw_idle_a', 3) then
                        ClearPedTasks(playerPed)
                    end
                    ShakeGameplayCam('HAND_SHAKE', 0.0)
                    game['animState'] = 'basic'
            end

        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isInGame then
            local bodyHit, bodyHitCoords, bodyHitProp = DartboardCheckFromPed()
            local hit, hitCoords, objectProp, objectCamDirection = RayCastGamePlayCamera(40.0, 16)
            if hit and objectProp then
                if (GetEntityModel(objectProp) == GetHashKey('prop_dart_bd_01') or GetEntityModel(objectProp) == GetHashKey('prop_dart_bd_cab_01')) and (GetEntityModel(bodyHitProp) == GetHashKey('prop_dart_bd_01') or GetEntityModel(bodyHitProp) == GetHashKey('prop_dart_bd_cab_01')) then
                    if IsDisabledControlPressed(0, 22) and game['animState'] ~= 'throwing' then
                        RequestAnimDict('mini@darts')
                        while not HasAnimDictLoaded('mini@darts') do
                            Citizen.Wait(0)
                        end
                        if not IsEntityPlayingAnim(playerPed, 'mini@darts', 'throw_idle_a', 3) then
                            TaskPlayAnim(playerPed, 'mini@darts', 'throw_idle_a', 8.0, -8.0, -1, 1, 1, true, true, true)
                        end
                        if game['animState'] ~= 'aim' then
                            ShakeGameplayCam('HAND_SHAKE', 2.0)
                            game['animState'] = 'aim'
                        end
                    end

                    if IsDisabledControlJustPressed(0, 140) and game['animState'] == 'aim' then
                        local dartRotation = GetEntityRotation(game['dartProp'], 0)
                        game['animState'] = 'throwing'
                        TaskPlayAnim(playerPed, 'mini@darts', 'throw_overlay', 8.0, -8.0, 8000, 0, 1, true, true, true)
                        Citizen.Wait(200)
                        DetachEntity(game['dartProp'])
                        SetEntityRotation(game['dartProp'], dartRotation[1], dartRotation[2], dartRotation[3], 0, true)
                        SetEntityCoordsNoOffset(game['dartProp'], hitCoords, 0.0, 0.0, 0.0)
                        FreezeEntityPosition(game['dartProp'], true)
                        game['thrownDarts'] = game['thrownDarts'] + 1
                        local realOffset = GetOffsetFromEntityGivenWorldCoords(objectProp, GetEntityCoords(game['dartProp']))
                        local offset = vector3(realOffset.x + 0.0041, realOffset.y, realOffset.z + 0.0002)
                        local distance = math.sqrt((offset.x * offset.x) + (offset.z * offset.z))
                        local angle = GetAngleBetween_2dVectors(0.0, 1.0, offset.x, offset.z)
                        local points = 0
                        local pointsMultiplier = 1
                        if distance < 0.009 then
                            points = 50
                            game['bullseyes'] = game['bullseyes'] + 1
                        elseif distance < 0.021 then
                            points = 25
                        elseif distance > 0.3 then
                            points = 0
                        elseif distance >= 0.226 then
                            points = 0
                        else
                            if distance > 0.1285 and distance < 0.1405 then
                                pointsMultiplier = 3
                            elseif distance > 0.2132 and distance < 0.226 then
                                pointsMultiplier = 2
                            else
                                pointsMultiplier = 1
                            end

                            if realOffset.x < 0 then
                                angle = 360 - angle
                            end

                            local a = 0
                            local b = 0
                            local triangle = 0
                            while triangle < 21 do
                                if angle >= (a - 9.0) and angle < (a + 9.0) then
                                    points = game['trianglePoints'][triangle] * pointsMultiplier
                                end
                                a = a + 18.0
                                triangle = triangle + 1
                            end

                        end
                        game['points'] = game['points'] + points
                        Citizen.Wait(500)
                        game['dartProp'] = CreateObject(GetHashKey('prop_dart_1'), playerCoords, true, true, false)
                        AttachEntityToEntity(game['dartProp'], playerPed, GetPedBoneIndex(playerPed, 57005), 0.16, 0.05, 0.0, 300.0, 0.0, -20.0, 0, false, false, true, 0, true)
                        ClearPedTasks(playerPed)
                        ShakeGameplayCam('HAND_SHAKE', 0.0)
                        game['animState'] = 'basic'
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

function StartGame()
    isInGame = true
    game['thrownDarts'] = 0
    game['bullseyes'] = 0
    game['points'] = 0
    game['dartProp'] = CreateObject(GetHashKey('prop_dart_1'), playerCoords, true, true, false)
    game['animState'] = 'basic'
    AttachEntityToEntity(game['dartProp'], playerPed, GetPedBoneIndex(playerPed, 57005), 0.16, 0.05, 0.0, 300.0, 0.0, -20.0, 0, false, false, true, 0, true)
end

function StopGame()
    if game['dartProp'] then
        DeleteEntity(game['dartProp'])
    end
    game['dartProp'] = nil
    isInGame = false
    ClearPedTasks(playerPed)
    ShakeGameplayCam('HAND_SHAKE', 0.0)
end

function ClearBoard()
    for object in EnumerateObjects() do
        if GetEntityModel(object) == GetHashKey('prop_dart_1') then
            local objectCoords = GetEntityCoords(object)
            if #(objectCoords - playerCoords) <= 2.0 then
                SetEntityAsMissionEntity(object, true, true)
                NetworkRequestControlOfEntity(object)
                while not NetworkHasControlOfEntity(object) do
                    Citizen.Wait(0)
                end
                DeleteObject(object)
                DeleteEntity(object)
            end
        end
    end
end

-- /dartPos 0.16 0.05 0.0 300.0 0.0 -20.0
RegisterCommand('dartPos', function(source, args)
    local currentRotation = GetEntityRotation()
    SetEntityRotation(game['dartProp'], (tonumber(args[1])) or 0.0, tonumber(args[2]) or 0.0, tonumber(args[3]) or 0.0)
end)

RegisterCommand('dartSound', function(source, args)
    PlaySoundFromCoord(-1, args[1], playerCoords, 0, false, 10.0, false)
end)

function DisplayStats()
    local str = config.text.info_message
    str = str:gsub('{{darts_thrown}}', game['thrownDarts'])
    str = str:gsub('{{bullseyes}}', game['bullseyes'])
    str = str:gsub('{{points}}', game['points'])
    local focusStr = '~g~'..game['focus']..'~w~'
    if game['focus'] < 60 then
        focusStr = '~o~'..game['focus']..'~w~'
    elseif game['focus'] < 30 then
        focusStr = '~r~'..game['focus']..'~w~'
    end
    DisplayHelpText(str)
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance, type)
	local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, type or -1, -1, 1))
	return b, c, e, direction
end

function DartboardCheckFromPed()
    local forwardVector = GetEntityForwardVector(playerPed)
    local destination = vector3(playerCoords.x + forwardVector.x * 16, playerCoords.y + forwardVector.y * 16, playerCoords.z + 0.8)
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestCapsule(playerCoords, destination, 2.0, 16, 0, 7))
    return b, c, e
end


  local function EnumerateEntities(poolname)
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
