RegisterCommand("propstuck", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local propsCleared = false

    for i = 0, 10 do
        if GetPedPropIndex(playerPed, i) ~= -1 then
            ClearPedProp(playerPed, i)
            propsCleared = true
        end
    end

    for _, entity in pairs(GetGamePool('CObject')) do
        if DoesEntityExist(entity) and IsEntityAttachedToEntity(entity, playerPed) then
            DetachEntity(entity, true, true)
            DeleteEntity(entity)
            propsCleared = true
        end
    end

    if propsCleared then
        TriggerEvent('QBCore:Notify', 'Props yang menempel ke pemain berhasil dihapus!', 'success')
    else
        TriggerEvent('QBCore:Notify', 'Tidak ada props yang ditemukan.', 'error')
    end
end, false)
