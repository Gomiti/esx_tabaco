ESX								= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- EVENTOS

RegisterNetEvent('estanco:marlboro')
AddEventHandler('estanco:marlboro', function()
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() < 5 then
        TriggerClientEvent('esx:showNotification', source, 'No tienes ~r~dinero!')
    elseif xPlayer.getMoney() >= 5 then
        xPlayer.removeMoney(5)
        xPlayer.addInventoryItem('marlboro', 1)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado un paquete de ~b~Marlboro ~w~ por ~g~5$!')
    end
        


end)

RegisterNetEvent('estanco:camel')
AddEventHandler('estanco:camel', function()
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() < 5 then
        TriggerClientEvent('esx:showNotification', source, 'No tienes ~r~dinero!')
    elseif xPlayer.getMoney() >= 5 then
        xPlayer.removeMoney(5)
        xPlayer.addInventoryItem('camel', 1)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado un paquete de ~b~Camel ~w~ por ~g~5$!')
    end
        


end)
RegisterNetEvent('estanco:fortuna')
AddEventHandler('estanco:fortuna', function()
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() < 5 then
        TriggerClientEvent('esx:showNotification', source, 'No tienes ~r~dinero!')
    elseif xPlayer.getMoney() >= 5 then
        xPlayer.removeMoney(5)
        xPlayer.addInventoryItem('fortuna', 1)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado un paquete de ~b~Fortuna ~w~ por ~g~5$!')
    end
        


end)

-- ITEMS USABLES

ESX.RegisterUsableItem('marlboro', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('marlboro', 1)
    xPlayer.addInventoryItem('marlboro_ciggar', 16)
    xPlayer.showNotification("~b~Has abierto un paquete de ~y~Malboro~w~.")
end)

ESX.RegisterUsableItem('camel', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('camel', 1)
    xPlayer.addInventoryItem('camel_ciggar', 16)
    xPlayer.showNotification("~b~Has abierto un paquete de ~y~Camel~w~.")
end)

ESX.RegisterUsableItem('fortuna', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('fortuna', 1)
    xPlayer.addInventoryItem('fortuna_ciggar', 16)
    xPlayer.showNotification("~b~Has abierto un paquete de ~y~Fortuna~w~.")
end)

-- EVENTOS DE ANIMACION


ESX.RegisterUsableItem('marlboro_ciggar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('marlboro_ciggar', 1)
    TriggerClientEvent('estanco:animacion', source)
end)
ESX.RegisterUsableItem('fortuna_ciggar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('fortuna_ciggar', 1)
    TriggerClientEvent('estanco:animacion', source)

end)
ESX.RegisterUsableItem('camel_ciggar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('camel_ciggar', 1)
    TriggerClientEvent('estanco:animacion', source)
end)