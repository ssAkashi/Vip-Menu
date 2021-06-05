function inVIPMenu(player)
    local whitelisted = false
    for _,v in pairs(Vip.PlayersWhitelisted) do
        for _,v2 in pairs(GetPlayerIdentifiers(player)) do
            if string.lower(v2) == string.lower(v) then
                whitelisted = true
            end
        end
    end
    return whitelisted
end

RegisterServerEvent('aCore:refreshVipAccessServer')
AddEventHandler('aCore:refreshVipAccessServer', function()
	if inVIPMenu(source) then
		TriggerClientEvent("aCore:refreshVipAccessServer2", source)
	end
end)