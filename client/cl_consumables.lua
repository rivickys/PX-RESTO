local QBCore = exports['qb-core']:GetCoreObject()   

RegisterNetEvent('px_resto:client:Eat', function(itemName)
    if itemName == "burger-fries" then
        TriggerEvent('animations:client:EmoteCommandStart', {"fries"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    end
    QBCore.Functions.Progressbar("eat_something", "Memakan..", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        end
    end)
end)

RegisterNetEvent('px_resto:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bsdrink"})
    QBCore.Functions.Progressbar("drink_something", "Meminum..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        end
    end)
end)
--khusus susu mochi
RegisterNetEvent('px_resto:client:Drink2', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bsdrink"})
    QBCore.Functions.Progressbar("drink_something", "Meminum..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
            TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(10, 10))
    end)
end)

-- PRODUCTION EVENTS MAKANAN--          
--rendang
RegisterNetEvent('px_resto:client:makeRendang', function()
	local ingredients = QBCore.Functions.HasItem({'raw_beef', 'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak Rendang..", 12000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeRendang")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["raw_beef"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-rendang"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--ayam pop
RegisterNetEvent('px_resto:client:makeAyampop', function()
    local ingredients = QBCore.Functions.HasItem({'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak Ayam Pop..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeAyampop")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-ayampop"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--baso
RegisterNetEvent('px_resto:client:makeBaso', function()
	local ingredients = QBCore.Functions.HasItem({'raw_beef', 'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak Baso..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeBaso")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["raw_beef"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-baso"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--soto
RegisterNetEvent('px_resto:client:makeSoto', function()
	local ingredients = QBCore.Functions.HasItem({'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak Soto..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeSoto")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-soto"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--seblak
RegisterNetEvent('px_resto:client:makeSeblak', function()
	local ingredients = QBCore.Functions.HasItem({'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak seblak..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeSeblak")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-seblak"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--nasgor
RegisterNetEvent('px_resto:client:makeNasgor', function()
	local ingredients = QBCore.Functions.HasItem({'lisensi_memasak'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Memasak Nasi Goreng..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeNasgor")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-nasgor"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('px_resto:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
            TriggerEvent('px_resto:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)

-- PRODUCTION EVENTS MINUMAN --
--es coklat
RegisterNetEvent('px_resto:client:makeEscoklat', function()
	local ingredients = QBCore.Functions.HasItem("lisensi_memasak")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Es Coklat..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeEscoklat")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-escoklat"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--kopi
RegisterNetEvent('px_resto:client:makeKopi', function()
	local ingredients = QBCore.Functions.HasItem("lisensi_memasak")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Kopi..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeKopi")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-kopi"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--es teh
RegisterNetEvent('px_resto:client:makeEsteh', function()
	local ingredients = QBCore.Functions.HasItem("lisensi_memasak")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Es Teh..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeEsteh")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-esteh"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--jus jeruk
RegisterNetEvent('px_resto:client:makeJusjeruk', function()
	local ingredients = QBCore.Functions.HasItem("lisensi_memasak")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Jus Jeruk..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeJusjeruk")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-jusjeruk"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--jus apel
RegisterNetEvent('px_resto:client:makeJusapel', function()
	local ingredients = QBCore.Functions.HasItem("lisensi_memasak")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Jus Apel..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeJusapel")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-jusapel"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki bahan.', 'error')
    end
end)
--susu mochi
RegisterNetEvent('px_resto:client:makeSusumochi', function()
	local ingredients = QBCore.Functions.HasItem('lisensi_memasak2')
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        QBCore.Functions.Progressbar("bs_stuff", "Membuat Susu Mochi..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("px_resto:server:makeSusumochi")
            --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["resto-susumochi"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Dibatalkan.", "error")
        end)
    else		
        QBCore.Functions.Notify('Kamu tidak memiliki lisensi untuk membuat ini.', 'error')
    end
end)
-- MENUS --     

RegisterNetEvent('px_resto:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('px_resto:client:cookBurgers', function()
    exports['qb-menu']:openMenu({
        {
            header = "Kompor",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Rendang",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeRendang",
            }
        },
        {
            header = "Ayam pop",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeAyampop",
            }
        },
        {
            header = "Baso",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeBaso",
            }
        },
        {
            header = "Soto",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeSoto",
            }
        },
        {
            header = "Seblak",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeSeblak",
            }
        },
        {
            header = "Nasi goreng",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeNasgor",
            }
        },
        {
            header = "Kembali",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "px_resto:closemenu"
            }
        },
    })
end)

RegisterNetEvent('px_resto:client:drinkStation', function()
    exports['qb-menu']:openMenu({
        {
            header = "Buat minuman",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Es coklat",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeEscoklat",
            }
        },
        {
            header = "Kopi",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeKopi",
            }
        },
        {
            header = "Es Teh",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeEsteh",
            }
        },
        {
            header = "Jus Jeruk",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeJusjeruk",
            }
        },
        {
            header = "Jus Apel",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeJusapel",
            }
        },
        {
            header = "Susu Mochi",
            txt = "",
            icon = "",
            params = {
                event = "px_resto:client:makeSusumochi",
            }
        },
        {
            header = "Kembali",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "px_resto:closemenu"
            }
        },
    })
end)
