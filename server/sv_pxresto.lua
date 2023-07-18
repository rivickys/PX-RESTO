local QBCore = exports['qb-core']:GetCoreObject()
--makanan
RegisterNetEvent('px_resto:server:makeRendang', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("raw_beef", 1)
    Player.Functions.AddItem("resto-rendang", 5)
end)

RegisterNetEvent('px_resto:server:makeAyampop', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-ayampop", 2)
end)

RegisterNetEvent('px_resto:server:makeBaso', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("raw_beef", 1)
    Player.Functions.AddItem("resto-baso", 5)
end)

RegisterNetEvent('px_resto:server:makeSoto', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-soto", 2)
end)

RegisterNetEvent('px_resto:server:makeSeblak', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-seblak", 2)
end)

RegisterNetEvent('px_resto:server:makeNasgor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-nasgor", 2)
end)

--minuman
RegisterNetEvent('px_resto:server:makeEscoklat', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-escoklat", 2)
end)

RegisterNetEvent('px_resto:server:makeKopi', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-kopi", 2)
end)

RegisterNetEvent('px_resto:server:makeEsteh', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-esteh", 2)
end)

RegisterNetEvent('px_resto:server:makeJusjeruk', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-jusjeruk", 2)
end)

RegisterNetEvent('px_resto:server:makeJusapel', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-jusapel", 2)
end)

RegisterNetEvent('px_resto:server:makeSusumochi', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("resto-susumochi", 2)
end)



--funtion animasi minum
QBCore.Functions.CreateUseableItem("resto-escoklat", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-kopi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-esteh", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-jusjeruk", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-jusapel", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-susumochi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Drink2", source, item.name)
    end
end)

--funtion animasi makan
QBCore.Functions.CreateUseableItem("resto-rendang", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-ayampop", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-baso", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-soto", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-seblak", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("resto-nasgor", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("px_resto:client:Eat", source, item.name)
    end
end)

RegisterNetEvent("px_resto:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'resto' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at resto.')
                exports['qb-management']:AddMoney('resto', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0.', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
        end
    end
end)
