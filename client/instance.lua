local instanceRoom = nil

function EnterInstance()
    instanceRoom = math.random(100000, 999999)  -- ID instance unik
    --print("^2[INSTANCE] Masuk ke instance: dimensi_new_char_" .. instanceRoom)

    LocalPlayer.state:set("instance", 'dimensi_new_char_'..instanceRoom, true)
    
    TriggerServerEvent('ggwpx-instance:server:SetInstance', 'dimensi_new_char_'..instanceRoom)
end

function ExitInstance()
    --print("^1[INSTANCE] Keluar dari instance...")

    LocalPlayer.state:set("instance", nil, true)

    TriggerServerEvent('ggwpx-instance:server:SetInstance', nil)
end

RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
    EnterInstance()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)  -- Cek setiap 5 detik

            if not IsNuiFocused() then
                --print("^3[DEBUG] Pemain tidak lagi di menu baju, keluar dari instance.")
                ExitInstance()
                break
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    ExitInstance()
end)
