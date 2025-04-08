-- PERSONAL
RegisterNetEvent('ggwpx-stash:client:openmechanicpersonalstash', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.job or not PlayerData.citizenid then
        TriggerEvent('QBCore:Notify', 'Data belum tersedia. Coba lagi.', 'error')
        return
    end

    if PlayerData.job.name ~= "eastgarage" or not PlayerData.job.onduty then
        TriggerEvent('QBCore:Notify', 'Kamu tidak punya akses ke stash ini!', 'error')
        return
    end

    local stashName = "eastgarage_personal_" .. PlayerData.citizenid
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", stashName, {
        maxweight = 200000,
        slots = 20,
    })
    TriggerEvent("qb-inventory:client:SetCurrentStash", stashName)
end)

--SHARED
RegisterNetEvent('ggwpx-stash:client:openmechanicstash', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.job then
        TriggerEvent('QBCore:Notify', 'Data belum tersedia. Coba lagi.', 'error')
        return
    end

    if PlayerData.job.name ~= "eastgarage" or not PlayerData.job.onduty then
        TriggerEvent('QBCore:Notify', 'Kamu tidak punya akses ke stash ini!', 'error')
        return
    end

    local stashName = PlayerData.job.name.."shared"
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", stashName, {
        maxweight = 5000,
        slots = 100,
    })
    TriggerEvent("qb-inventory:client:SetCurrentStash", stashName)
end)
