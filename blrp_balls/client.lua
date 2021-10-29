local balls = {"prop_beachball_01","prop_beachball_02", "prop_beach_volball01", "prop_beach_volball02"}--, "prop_bskball_01" }
local soccerball = {"p_ld_soc_ball_01"}
local Dragballs = {"prop_beachball_01","prop_beachball_02", "prop_beach_volball01", "prop_beach_volball02", "p_ld_soc_ball_01"}--, "prop_bskball_01" }

RegisterNetEvent("blrp_balls:client:createball")
AddEventHandler("blrp_balls:client:createball", function(ballType)
  if ballType ~= nil then
    CreateBall(ballType)
  end
end)

RegisterNetEvent("blrp_balls:client:deleteball")
AddEventHandler("blrp_balls:client:deleteball", function(cb)
  print("dasas?")
  exports['mythic_progbar']:Progress({
      name = "pick_up_ball",
      duration = 1000,
      label = "Picking up ball",
      useWhileDead = false,
      canCancel = true,
      controlDisables = {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      },
      animation = {
          animDict = "mini@repair",
          anim = "fixing_a_ped",
          flags = 49,
      },
  }, function(cancelled)
    if not cancelled then
      local result, hash = DeleteProp()
      print(hash)
      if result then
        local item = nil
        if hash == `prop_bskball_01` then
          item = "basketball"
        elseif hash == `p_ld_soc_ball_01` then
          item = "soccer_ball"
        end
        if item ~= nil then
          TriggerServerEvent("blrp_balls:server:giveball", item)
        end
      end
    end
  end)
end)

function CreateBall(prop)
  local ped = GetPlayerPed(-1)
  ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0, 1.0, -1.0))
  item = GetHashKey(prop)
  object = CreateObject(item, ox, oy, oz, true, true, false)
  PlaceObjectOnGroundProperly(object)
  SetEntityHeading(object, h)
  SetEntityAsMissionEntity(object, true, true)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r,g,b,a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x, y)
end

function loadAnimDict( dict )
  while ( not HasAnimDictLoaded( dict ) ) do
    RequestAnimDict( dict )
    Citizen.Wait(0)
  end
end

function CheckDragBall(pos)
  for k,v in pairs(Dragballs) do
    if DoesObjectOfTypeExistAtCoords(pos.x, pos.y, pos.z, 1.0, GetHashKey(v), 0) then
      return true, GetHashKey(v)
    end
  end
  return false
end

function DragBall()
  local pos = GetEntityCoords(GetPlayerPed(-1))
  isBall, Hash = CheckDragBall(pos)
  if isBall then
    BallProp = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Hash, false, false, false)
    NetworkRequestControlOfEntity(BallProp)
    while (NetworkGetEntityOwner(BallProp) ~= PlayerId()) and (NetworkGetEntityOwner(BallProp) ~= -1) do
      Citizen.Wait(0)
    end
    local bone = GetPedBoneIndex(GetPlayerPed(-1), 28422)
    AttachEntityToEntity(BallProp, GetPlayerPed(-1), bone, 0.2,0.0,0.0,0.0,0.0,0.0, true, true, false, true, 1, true)
    ClearPedTasks(GetPlayerPed(-1))
    loadAnimDict( "missfinale_c2mcs_1" )
    TaskPlayAnim(GetPlayerPed(-1), "missfinale_c2mcs_1","fin_c2_mcs_1_camman", 4.0, -1, -1, 48 , 0, false, false, false)
  end
end

function DeleteProp()
  local ped = GetPlayerPed(-1)
  local pos = GetEntityCoords(ped)
  isBall, Hash = CheckDragBall(pos)
  if isBall then
    BallProp = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Hash, false, false, false)
    NetworkRequestControlOfEntity(BallProp)
    while (NetworkGetEntityOwner(BallProp) ~= PlayerId()) and (NetworkGetEntityOwner(BallProp) ~= -1) do
      Citizen.Wait(0)
    end
    DetachEntity(BallProp, true, true)
    SetEntityCollision(BallProp, false, true)
    if IsEntityAnObject(BallProp) then
      DeleteObject(BallProp)
    else
      DeleteEntity(BallProp)
    end
    return true, Hash
  end
  return false, 0
end

function scenrionahoi(text)
  SetTextComponentFormat('STRING')
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, false, false, -1)
end

function CheckBall(pos)
  for k,v in pairs(balls) do

    if DoesObjectOfTypeExistAtCoords(pos.x, pos.y, pos.z, 1.0, GetHashKey(v), 0) then
      return true, GetHashKey(v)
    end
  end
  return false
end

function CheckFoot(pos)
  for k,v in pairs(soccerball) do
    if DoesObjectOfTypeExistAtCoords(pos.x, pos.y, pos.z, 1.0, GetHashKey(v), 0) then
      return true, GetHashKey(v)
    end
  end
  return false
end

local speedCheckBallFoot = 250
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(speedCheckBallFoot)
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    isFoot, Hash = CheckFoot(pos)
    if isFoot then
      speedCheckBallFoot = 8
      scenrionahoi('~c~Press ~g~~INPUT_PICKUP~~c~ - kick ball.~n~Press ~g~~INPUT_DETONATE~~c~ - grab ball.')
      FootBallProp = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Hash, false, false, false)
      local duration = 0
      local shoot = false
      if IsControlPressed(0, 47) then
        DragBall()
      else
        while IsControlPressed(0, 38)  do
          NetworkRequestControlOfEntity(FootBallProp)
          while (NetworkGetEntityOwner(FootBallProp) ~= PlayerId()) and (NetworkGetEntityOwner(FootBallProp) ~= -1) do
            Citizen.Wait(0)
          end
          TaskGoToEntity(ped, FootBallProp, 5000, 6.0, 4, 0, 0)
          Citizen.Wait(0)
          duration = duration + 0.45
          if duration < 5 then
            drawTxt("POWER",4,1,0.08,0.56,1.0,209,211,212,255)
          elseif duration > 5 and duration < 12 then
            drawTxt("POWER",4,1,0.08,0.56,1.0,10, 107, 36, 255)
          elseif duration > 12 then
            drawTxt("POWER", 4,1,0.08,0.56,1.0,176, 21, 47, 255)
          end
          shoot = true
        end

        ClearPedTasks(GetPlayerPed(-1))
        pos = GetEntityCoords(ped)

        local entitypos = GetEntityCoords(FootBallProp)
        if Vdist2(pos.x, pos.y, pos.z,entitypos.x, entitypos.y, entitypos.z) < 6.0 then

          if shoot then
            rot1 = GetEntityForwardX(ped)
            rot2 = GetEntityForwardY(ped)
            local vel = GetEntityVelocity(ped)

            loadAnimDict( "misstrevor3_beatup" )
            TaskPlayAnim(ped, "misstrevor3_beatup","guard_beatup_kickidle_guard1", 4.0, -1, -1, 47, 0, false, false, false)
            if duration > 40.0 then
              duration = 40.0
            end

            Citizen.Wait(500)
            DetachEntity(FootBallProp)
            SetEntityVelocity(FootBallProp, rot1*duration,rot2*duration, 0.3*duration)

            ClearPedTasks(ped)
          end
        end
      end

    else
      speedCheckBallFoot = 250
    end
  end
end)


local speedCheckBall = 250
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(speedCheckBall)
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    isBall, Hash = CheckBall(pos)
    if isBall then
      speedCheckBall = 8
      scenrionahoi('~c~Press ~g~~INPUT_PICKUP~~c~ - to take the ball. ~g~~INPUT_DETONATE~~c~ - throw')
      BallProp = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Hash, false, false, false)
      if IsControlJustPressed(1, 38) then
        NetworkRequestControlOfEntity(BallProp)
        while (NetworkGetEntityOwner(BallProp) ~= PlayerId()) and (NetworkGetEntityOwner(BallProp) ~= -1) do
          Citizen.Wait(0)
        end
        local bone = GetPedBoneIndex(ped, 28422)
        AttachEntityToEntity(BallProp, ped, bone, 0.2,0.0,0.0,0.0,0.0,0.0, true, true, false, true, 1, true)
        ClearPedTasks(ped)
        loadAnimDict( "missfinale_c2mcs_1" )
        TaskPlayAnim(ped, "missfinale_c2mcs_1","fin_c2_mcs_1_camman", 4.0, -1, -1, 48 , 0, false, false, false)
        takeBall = true
      end
      local shoot = false
      local duration = 0
      while IsControlPressed(0, 47)  do
        Citizen.Wait(1)
        duration = duration + 0.15
        if duration < 5 then
          drawTxt("POWER",4,1,0.08,0.56,1.0,209,211,212,255)
        elseif duration > 5 and duration < 12 then
          drawTxt("POWER",4,1,0.08,0.56,1.0,10, 107, 36, 255)
        elseif duration > 12 then
          drawTxt("POWER", 4,1,0.08,0.56,1.0,176, 21, 47, 255)
        end
        shoot = true
      end
      if shoot and takeBall then
        rot1 = GetEntityForwardX(ped)
        rot2 = GetEntityForwardY(ped)
        ClearPedTasks(ped)
        loadAnimDict( "weapons@projectile@grenade_str" )
        TaskPlayAnim(ped, "weapons@projectile@grenade_str","throw_h_fb_backward", 4.0, -1, -1, 47, 0, false, false, false)

        local vel = GetEntityVelocity(ped)
        Citizen.Wait(250)
        DetachEntity(BallProp)
        if duration > 20.0 then
          duration = 20.0
        end
        SetEntityVelocity(BallProp, rot1*duration,rot2*duration, 0.8*duration)
        ClearPedTasks(ped)
        takeBall = false
      end
    else
      speedCheckBall = 250
    end
  end
end)
