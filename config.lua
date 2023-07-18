Config = {}

Config.NewCore = true

Config.GaragePed = "csb_burgerdrug"

Config.PedLocation = vector4(0, 0, 0, 0)

Config.VehicleSpawn = vector4(0, 0, 0, 0)

Config.Vehicle = 'stalion2'

HungerFill = { -- How much they fill your hunger
    ["resto-rendang"] = math.random(35, 45),
    ["resto-ayampop"] = math.random(35, 45),
    ["resto-baso"] = math.random(35, 45),
    ["resto-soto"] = math.random(35, 45),
    ["resto-seblak"] = math.random(20, 35),
    ["resto-nasgor"] = math.random(20, 35),
    ["resto-susumochi"] = math.random(10, 10),
}

ThirstFill = { -- How much they fill your thirst.
    ["resto-escoklat"] = math.random(25, 35),
    ["resto-kopi"] = math.random(25, 35),
    ["resto-esteh"] = math.random(25, 35),
    ["resto-jusjeruk"] = math.random(25, 35),
    ["resto-jusapel"] = math.random(25, 35),
    ["resto-susumochi"] = math.random(10, 10),
}

Config.Zones = {
    [1] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "far fa-clipboard", event = "px_resto:client:frontTray", label = "Food Tray", }, 
    [2] = { coords = vector3(-2245.02, -624.75, 14.81), radius = 0.9, icon = "fa-solid fa-beer-mug-empty", event = "px_resto:client:drinkStation", label = "Mesin minuman", job = "resto" }, 
    [3] = { coords = vector3(-2243.98, -623.36, 14.81), radius = 0.9, icon = "fa-solid fa-burger", event = "px_resto:client:cookBurgers", label = "Kompor", job = "resto" }, 
    [4] = { coords = vector3(0, 0, 0), radius = 1.55, icon = "fa-solid fa-fire-burner", event = "px_resto:client:makeFries", label = "Make Fries", job = "resto" },
    [5] = { coords = vector3(0, 0, 0), radius = 1.35, icon = "fa-solid fa-box-open", event = "px_resto:client:ingredientStore", label = "Ingredients", job = "resto" },
    [6] = { coords = vector3(-2243.32, -640.32, 13.9), radius = 0.75, icon = "fa-solid fa-briefcase", event = "qb-bossmenu:client:OpenMenu", label = "Manage Business", job = {['resto'] = 4} },
    [7] = { coords = vector3(0, 0, 0), radius = 1.15, icon = "fa-solid fa-square-up-right", event = "px_resto:client:jobFridge", label = "Food Storage", job = "resto" },
    [8] = { coords = vector3(0, 0, 0), radius = 1.0, icon = "far fa-clipboard", event = "px_resto:client:passThrough", label = "Big Tray", job = "resto" },
    [9] = { coords = vector3(0, 0, 0), radius = 0.6, icon = "fa-solid fa-clock", event = "px_resto:clientToggleDuty", label = "on/off Duty", job = "resto" },
    [10] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "px_resto:bill", label = "Bill Customer", job = "resto" },
    [11] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "px_resto:bill", label = "Bill Customer", job = "resto" },
    [12] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "px_resto:bill", label = "Bill Customer", job = "resto" },
    [13] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "px_resto:bill", label = "Bill Customer", job = "resto" },
    [14] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "far fa-clipboard", event = "px_resto:client:frontTray2", label = "Food Tray", },
    [15] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "far fa-clipboard", event = "px_resto:client:frontTray3", label = "Food Tray", },
    [16] = { coords = vector3(0, 0, 0), radius = 0.8, icon = "far fa-clipboard", event = "px_resto:client:frontTray4", label = "Food Tray", },  
}

Config.Items = {
label = "Shop",
    slots = 7,
    items = {
        [1] = {
            name = "burger-bun",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "burger-raw",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "burger-tomato",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "burger-lettuce",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "burger-potato",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "burger-mshakeformula",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "burger-sodasyrup",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}
