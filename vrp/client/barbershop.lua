function tvRP.setOverlay(custom,spawn)
  --[[
  if custom then
    local ped = PlayerPedId()
    local hashMaleMPSkin = GetHashKey("mp_m_freemode_01")
    local hashFemaleMPSkin = GetHashKey("mp_f_freemode_01")
    if  custom["-1"][1] == 255 then
      if (GetEntityModel(ped) == hashMaleMPSkin) then
        custom["-1"] = {0,0,0}
      elseif (GetEntityModel(ped) == hashFemaleMPSkin) then
        custom["-1"] = {21,0,0}
      end
    end
    if spawn then
      SetPedHeadBlendData(ped,custom["-1"][1],custom["-1"][1],custom["-1"][1],custom["-1"][1],custom["-1"][2],custom["-1"][3],1.0,0.0,0.0,false)
    end
    -- parts
    for k,v in pairs(custom) do
      if tonumber(k) == 12 then
        SetPedComponentVariation(ped, 2, v[1], 0, 1)
        SetPedHairColor(ped, v[3], v[3])
      elseif tonumber(k) == -1 then
        SetPedHeadBlendData(ped,v[1],v[1],v[1],v[1],v[2],v[3],1.0,0.0,0.0,false)
      else
        SetPedHeadOverlay(ped, tonumber(k), v[1], 1.0)
        SetPedHeadOverlayColor(ped, tonumber(k), v[2], v[3], v[3])
      end
    end
    vRPserver.updateOverlay({custom})
  end
  ]]--
end
-- SetPedHeadBlendData(PlayerPedId(),12,12,12,12,0,2,1.0,0.0,0.0,false) -- Face {12,0,2}

function tvRP.getDrawablesBarber(part)
  if part == 12 then
    return tonumber(GetNumberOfPedDrawableVariations(PlayerPedId(),2))
  elseif part == -1 then
    return tonumber(GetNumberOfPedDrawableVariations(PlayerPedId(),0))
  else
    return tonumber(GetNumHeadOverlayValues(part))
  end
end

function tvRP.resetBarberSyling()
  old_custom = {
    ["-1"] = {255,0,0},
    ["0"] = {255,0,0},
    ["1"] = {255,1,0},
    ["2"] = {255,1,0},
    ["3"] = {255,0,0},
    ["4"] = {255,0,0},
    ["5"] = {255,2,0},
    ["6"] = {255,0,0},
    ["7"] = {255,0,0},
    ["8"] = {255,2,0},
    ["9"] = {255,0,0},
    ["10"] = {255,1,0},
    ["11"] = {255,0,0},
    ["12"] = {255,0,0}
  }
  tvRP.setOverlay(old_custom,false)
end

function tvRP.getTextures()
  return tonumber(GetNumHairColors())
end
