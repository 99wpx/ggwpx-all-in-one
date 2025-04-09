local QBCore = exports['qb-core']:GetCoreObject()

local playerInstances = {}

RegisterNetEvent('ggwpx-instance:server:SetInstance', function(instanceId)
    local src = source
    if instanceId then
        playerInstances[src] = instanceId
    else
        playerInstances[src] = nil
    end
    
    if instanceId then
        SetPlayerRoutingBucket(src, tonumber(instanceId:match('%d+')))
    else
        SetPlayerRoutingBucket(src, 0)
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    playerInstances[src] = nil
end)

QBCore.Functions.CreateCallback('ggwpx-instance:server:GetPlayerInstance', function(source, cb)
    cb(playerInstances[source] or nil)
end)
