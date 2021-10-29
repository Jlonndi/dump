function WalkMenuStart(name)
  RequestWalking(name)
  SetPedMovementClipset(PlayerPedId(), name, 0.2)
  RemoveAnimSet(name)
end

function RequestWalking(set)
  RequestAnimSet(set)
  while not HasAnimSetLoaded(set) do
    Citizen.Wait(1)
  end
end

function WalksOnCommand(args)
  local WalksCommand = ""
  for a in pairsByKeys(DP.Walks) do
    WalksCommand = WalksCommand .. ""..string.lower(a)..", "
  end
  EmoteChatMessage(WalksCommand)
  EmoteChatMessage("To reset do /walk reset")
end

function WalkCommandStart(args)
  local cmd = args[2]
  if cmd ~= nil then
    local name = firstToUpper(args[2])

    if name == "Reset" then
        ResetPedMovementClipset(PlayerPedId()) return
    end

    local name2 = table.unpack(DP.Walks[name])
    if name2 ~= nil then
      WalkMenuStart(name2)
    else
      EmoteChatMessage("'"..name.."' is not a valid walk")
    end
  end
end

RegisterNetEvent("dpemotes:WalksOnCommand")
AddEventHandler("dpemotes:WalksOnCommand", function(args)
  WalksOnCommand(args)
end)

RegisterNetEvent("dpemotes:WalkCommandStart")
AddEventHandler("dpemotes:WalkCommandStart", function(args)
  WalkCommandStart(args)
end)
