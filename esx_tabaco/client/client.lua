ESX								= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
    while true do
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
        local _sleep = 1000
        if #(_charPos - vector3(115.76, -1292.41, 28.26)) < 3 then
            _sleep = 0
            DrawText3D(115.76, -1292.41, 28.50, 'Pulsa ~r~[E]~w~ para comprar tabaco.')
            if IsControlJustPressed(0, 38) then 
                OpenMenu()
            end
        end
        Citizen.Wait(_sleep)
    end
end)


--MENU

local isMenuOpen = false

local products = { 
    {label = 'Marlboro 5$', value = 'spawn_marlboro' },
    {label = 'Camel 5$', value = 'spawn_camel'},
    {label = 'Fortuna 5$', value = 'spawn_fortuna'}
}

function OpenMenu()
    isMenuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = 'Estanco', 
        align = 'top-right', 
        elements = products
    }, function(data, menu)
        menu.close()
        isMenuOpen = false
        if data.current.value == 'spawn_marlboro' then  --spawn_pistol
            SpawnMarlboro()
        end
        if data.current.value == 'spawn_camel' then  
            SpawnCamel()
        end --Carabina
        if data.current.value == 'spawn_fortuna' then  
            SpawnFortuna()
        end 
    end,
    function(data, menu) -- close menu
        menu.close()
        isMenuOpen = false
    end)

end

--FUNCIONES

function SpawnMarlboro()
    TriggerServerEvent('estanco:marlboro')
end

function SpawnCamel()
    TriggerServerEvent('estanco:camel')
end
function SpawnFortuna()
    TriggerServerEvent('estanco:fortuna')
end

-- DrawText3D
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


--EVENTOS

RegisterNetEvent('estanco:animacion')
AddEventHandler('estanco:animacion', function()
    ped = PlayerPedId()

    ExecuteCommand('e smoke')
    Citizen.Wait(26000)
    ClearPedTasks(ped)


end)