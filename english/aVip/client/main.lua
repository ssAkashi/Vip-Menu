-- ESX LIB
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent(Vip.YourEsxTrigger, function(lib) ESX = lib end)
		Citizen.Wait(10)
	end
end)

-- Thread & Event

Citizen.CreateThread(function()
    while true do
        if NetworkIsSessionStarted() then
            TriggerServerEvent("aCore:refreshVipAccessServer")
            Citizen.Wait(3600000)
        end
    end
end)

RegisterNetEvent('aCore:refreshVipAccessServer2')
AddEventHandler('aCore:refreshVipAccessServer2',function() 
    access_to_vip_menu = true
end)

-- Command

RegisterCommand(Vip.Command.CommandOpenMenu, function()
    if access_to_vip_menu == true then
        openVIPMenu()
    end
end)
RegisterKeyMapping(Vip.Command.CommandOpenMenu, Vip.Command.DescriptionCommand, 'keyboard', Vip.Command.BindOpenMenu)
Citizen.CreateThread(function()
	if Vip.Command.ChatAddSuggestionActivate then
		TriggerEvent('chat:addSuggestion', '/'..Vip.Command.CommandOpenMenu, Vip.Command.ChatAddSuggestion)
	end
end)

-- Functions

KeyboardInput = function(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(1.0)

    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

local dict2 = "scr_powerplay"
local particleName2 = "scr_powerplay_beast_vanish"
SetParticle = function()
	Citizen.CreateThread(function()
		RequestNamedPtfxAsset(dict2)
		while not HasNamedPtfxAssetLoaded(dict2) do
			Citizen.Wait(0)
		end
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped, true))
		local a = 0
		while a < 25 do
			UseParticleFxAssetNextCall(dict2)
			StartParticleFxNonLoopedAtCoord(particleName2, x, y, z, 1.50, 1.50, 1.50, 1.50, false, false, false)
			SetParticleFxLoopedColour(0, 255, 255, 255, 0)
			a = a + 1
			break
			Citizen.Wait(500)
		end
	end)
end

SpawnVipProps = function()
	for k,v in pairs(Vip.props_list_vip) do
	RequestModel(v)
    while not HasModelLoaded(v) do Citizen.Wait(10) end
    local coords, forward = GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId())
    local props_coords = coords + forward * 1.0
    ESX.Game.SpawnObject(v, props_coords, function(props) 
		SetEntityHeading(props, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(props)
        FreezeEntityPosition(props, true)
        SetEntityInvincible(props, true)
        end)
    end
end

MarkVipProps = function()
	local pCoords = GetEntityCoords(PlayerPedId())
	local closestDistance = -1
	local closestEntity   = nil
	for i=1, #props_model_name, 1 do
		local object = GetClosestObjectOfType(pCoords, 3.0, GetHashKey(props_model_name[i]), false, false, false)
		local objectCoords = GetEntityCoords(object)
		if DoesEntityExist(object) then
			local objCoords = GetEntityCoords(object)
			local distance = #(pCoords - objCoords)
			if closestDistance == -1 or closestDistance > distance then
				closestDistance = distance
				closestEntity   = object
			end
		end
		if closestDistance ~= -1 and closestDistance <= 3.0 then
			DrawMarker(22, objectCoords.x, objectCoords.y, objectCoords.z+1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255,0,0, 255, 55555, false, true, 2, false, false, false, false)
		end
	end
end

DeleteVipProps = function()
	local pCoords = GetEntityCoords(PlayerPedId())
    local closestDistance = -1
    local closestEntity   = nil
    for i=1, #props_model_name, 1 do
        local object = GetClosestObjectOfType(pCoords, 3.0, GetHashKey(props_model_name[i]), false, false, false)
        if DoesEntityExist(object) then
            local objCoords = GetEntityCoords(object)
			local distance = #(pCoords - objCoords)
            if closestDistance == -1 or closestDistance > distance then
				closestDistance = distance
				closestEntity   = object
                end
        	end
        if closestDistance ~= -1 and closestDistance <= 3.0 then
            DeleteEntity(object)
        end
    end
end