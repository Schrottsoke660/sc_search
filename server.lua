local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("rlc_search:requestSearch", function(targetId)
    local src = source

    local xPlayer = ESX.GetPlayerFromId(src)
    local targetPlayer = ESX.GetPlayerFromId(targetId)

    if not targetPlayer then
        TriggerClientEvent("rlc_search:notify", src, "Player not found!")
        return
    end

    local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(targetId)))

    if dist > 3.0 then
        TriggerClientEvent("rlc_search:notify", src, "To far away!")
        return
    end

    -- 🔥 rlc_search hook (optional)
    TriggerEvent("rlc_search:beforeSearch", src, targetId)

    -- 🔓 ox_inventory öffnen (Target Inventory)
    exports.ox_inventory:forceOpenInventory(src, 'player', targetId)

    -- optional logging / hook
    TriggerEvent("rlc_search:afterSearch", src, targetId)
end)