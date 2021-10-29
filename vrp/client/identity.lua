local registration_number = "00AAA000"

local myRegistrations = nil
local allVehicleRegistrations = nil

function tvRP.initPlateData(data)
  myRegistrations = data
end

function tvRP.addPlateToList(plate, vehname, vehNetID)
  local entryFound = false
  for k,v in pairs(myRegistrations) do
    if v.registration == plate then
      entryFound = true
      v.netId = vehNetID
      break
    end
  end
  if not entryFound then
    table.insert(myRegistrations,{registration = plate, name = vehname, netId = vehNetID})
  end
end

function tvRP.removePlateFromList(plate)
  for k,v in pairs(myRegistrations) do
    if v.registration == plate then
      myRegistrations[k] = nil
    end
  end
end

function tvRP.getVehicleNameByPlate(plate)
  local retVal = nil
  for k,v in pairs(myRegistrations) do
    if v.registration == plate then
      retVal = v.name
      break
    end
  end
  return retVal
end

function tvRP.getIsVehicleOwner(plate)
  local retVal = false
  for k,v in pairs(myRegistrations) do
    if v.registration == plate then
      retVal = true
      break
    end
  end
  return retVal
end

function tvRP.getIsVehicleOwnerByNetId(vehNetId, plateCheck)
  local retVal = false
  for k,v in pairs(myRegistrations) do
    if v.netId == vehNetId then
      retVal = true
      if plateCheck ~= v.registration then
        SetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(vehNetId), v.registration)
      end
      break
    end
  end
  if not retVal then
    for k,v in pairs(allVehicleRegistrations) do
      if k == vehNetId and plateCheck == v then
        for k2,v2 in pairs(myRegistrations) do
          if v2.registration == plateCheck then
            retVal = true
            SetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(vehNetId), v2.registration)
            break
          end
        end
      end
    end
  end
  return retVal
end

function tvRP.initRegisteredVehData(data)
  if data ~= nil then
    allVehicleRegistrations = data
  end
end

function tvRP.setRegistrationNumber(registration)
  registration_number = registration
end

function tvRP.getRegistrationNumber()
  return registration_number
end
