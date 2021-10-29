function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
   AddTextEntry("sd", "KTM SUPER DUKE R")
end)