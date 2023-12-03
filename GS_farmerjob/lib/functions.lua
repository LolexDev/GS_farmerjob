function progressbar(message, time)
    lib.progressBar({
        duration = time,
        label = message,
        position = 'bottom',
        useWhileDead = false,
    })
end

local blipovi = {}

function napraviBlipove()
    for _, location in ipairs(Config.Polja) do
        local blip = AddBlipForCoord(location.x, location.y, location.z)

        SetBlipSprite(blip, 1) 
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.SadnjaI)
        EndTextCommandSetBlipName(blip)

		table.insert(blipovi, blip)
    end
end

function skloniBlipove()
    for _, blip in ipairs(blipovi) do
        RemoveBlip(blip)
    end
    blipovi = {}
end

function staviSkin()

	local playerPed = PlayerPedId()

	if DoesEntityExist(playerPed) then

		Citizen.CreateThread(function()

			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforme['farmer'].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforme['farmer'].female)
				end
			end)

		SetPedArmour(playerPed, 0)
		ClearPedBloodDamage(playerPed)
		ResetPedVisibleDamage(playerPed)
		ClearPedLastWeaponDamage(playerPed)
		ResetPedMovementClipset(playerPed, 0)

		end)
	end
end