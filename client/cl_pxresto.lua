local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

CreateThread(function()
    resto = AddBlipForCoord(-2232.65, -623.33, 30.96)
    SetBlipSprite (resto, 93)
    SetBlipDisplay(resto, 4)
    SetBlipScale  (resto, 0.6)
    SetBlipAsShortRange(resto, false)
    SetBlipColour(resto, 51)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Restaurant")
    EndTextCommandSetBlipName(resto)
end) 

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        BurgerZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['qb-target']:RemoveZone("resto"..k)
        end
        DeletePed(jobPed)
    end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    BurgerZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:RemoveZone("resto"..k)
    end
    DeletePed(jobPed)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function BurgerZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone("resto"..k, v.coords, v.radius, {
            name = "resto"..k,
            debugPoly = false,
            useZ=true,
        }, {
            options = {
                {
                    type = "client",
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 1.5
        })
    end
    if not DoesEntityExist(jobPed) then

	RequestModel(Config.GaragePed) while not HasModelLoaded(Config.GaragePed) do Wait(0) end

	jobPed = CreatePed(0, Config.GaragePed, Config.PedLocation, false, false)

	SetEntityAsMissionEntity(jobPed, true, true)
	SetPedFleeAttributes(jobPed, 0, 0)
	SetBlockingOfNonTemporaryEvents(jobPed, true)
	SetEntityInvincible(jobPed, true)
	FreezeEntityPosition(jobPed, true)
	loadAnimDict("timetable@ron@ig_3_couch")        
	TaskPlayAnim(jobPed, "timetable@ron@ig_3_couch", "base", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

	exports['qb-target']:AddTargetEntity(jobPed, { 
	    options = {
		{ 
		    type = "client",
		    event = "px_resto:client:jobGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Ambil kendaraan",
		    job = "resto"
		},
		{ 
		    type = "client",
		    event = "px_resto:client:storeGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Kembalikan kendaraan",
		    job = "resto"
		},
	    }, 
	    distance = 1.5, 
	})
    end
end

CreateThread(function()
    DecorRegister("bs_vehicle", 1)
end)

RegisterNetEvent('px_resto:client:jobGarage', function(vehicle)
    local vehicle = Config.Vehicle
    local coords = Config.VehicleSpawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "URR"..tostring(math.random(1000, 9999)))
        DecorSetFloat(veh, "bs_vehicle", 1)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        SetVehicleFuelLevel(veh, 100.0)
    end, coords, true)
end)

RegisterNetEvent('px_resto:client:storeGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
    if DecorExistOn((veh), "bs_vehicle") then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify("You returned the vehicle.", "success")
    else
        QBCore.Functions.Notify("This is not a work vehicle.", "error")
    end
end)
    
RegisterNetEvent("px_resto:client:frontTray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("px_resto:client:frontTray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray2", {
        maxweight = 30000,
        slots = 12,
    })
end)
RegisterNetEvent("px_resto:client:frontTray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray3", {
        maxweight = 30000,
        slots = 12,
    })
end)
RegisterNetEvent("px_resto:client:frontTray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray4", {
        maxweight = 30000,
        slots = 12,
    })
end)


RegisterNetEvent("px_resto:client:passThrough", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsBigTray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsBigTray", {
        maxweight = 300000,
        slots = 15,
    })
end)

RegisterNetEvent("px_resto:client:jobFridge", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsFridge")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsFridge", {
        maxweight = 3000000,
        slots = 30,
    })
end)

RegisterNetEvent("px_resto:client:ingredientStore", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "resto", Config.Items)
end)

RegisterNetEvent('px_resto:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("px_resto:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("px_resto:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)

