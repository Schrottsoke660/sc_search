local ESX = exports['es_extended']:getSharedObject()

RegisterCommand("search", function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetId = GetPlayerServerId(closestPlayer)

        TriggerServerEvent("rlc_search:requestSearch", targetId)
    else
        TriggerEvent("rlc_search:notify", "No player nearby!")
    end
end, false)

-- optional: Notify Event
RegisterNetEvent("rlc_search:notify", function(msg)
    ESX.ShowNotification(msg)
end)