## PX_RESTO
## tambahkan list item di qb-core/shared/items.lua
```
    -- Lisence
    ["lisensi_memasak"] 			 = {["name"] = "lisensi_memasak",  	     		["label"] = "SIM 1",	 		        ["weight"] = 0, 		["type"] = "item", 		["image"] = "simm1.png", 		     ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,  ["description"] = "Surat Izin Memasak 1"},
    ["lisensi_memasak2"] 			 = {["name"] = "lisensi_memasak2",  	     	["label"] = "SIM 2",	 		        ["weight"] = 0, 		["type"] = "item", 		["image"] = "simm2.png", 		     ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,  ["description"] = "Surat Izin Memasak 2"},
    --Food
	["resto-rendang"] 				 = {["name"] = "resto-rendang", 			 	["label"] = "Rendang", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "rendang.png", 			 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rendang Sapi."},
	["resto-ayampop"] 			     = {["name"] = "resto-ayampop", 			 	["label"] = "Ayam Pop", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "ayampop.png", 		     ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Ayam POP."},
	["resto-baso"] 				     = {["name"] = "resto-baso", 			 	    ["label"] = "Baso", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "baso.png", 			 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Baso."},
	["resto-soto"] 		             = {["name"] = "resto-soto", 			        ["label"] = "Soto", 			        ["weight"] = 2500, 		["type"] = "item", 		["image"] = "soto.png", 	         ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Soto."},
	["resto-seblak"] 		 	     = {["name"] = "resto-seblak", 				    ["label"] = "Seblak", 			        ["weight"] = 125, 		["type"] = "item", 		["image"] = "seblak.png", 			 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Seblak."},
	["resto-nasgor"] 				 = {["name"] = "resto-nasgor", 			 	  	["label"] = "Nasi Goreng", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "nasgor.png", 			 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Nasi Goreng."},
		
	--Drinks
	["resto-escoklat"] 			     = {["name"] = "resto-escoklat", 				["label"] = "Es coklat", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "escoklat.png",          ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Es Coklat."},
	["resto-kopi"] 			         = {["name"] = "resto-kopi", 				    ["label"] = "Kopi", 				    ["weight"] = 125, 		["type"] = "item", 		["image"] = "kopi.png", 		     ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Kopi."},
	["resto-esteh"] 			     = {["name"] = "resto-esteh", 				    ["label"] = "Es Teh", 				    ["weight"] = 125, 		["type"] = "item", 		["image"] = "esteh.png", 		     ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Es Teh."},
    ["resto-jusjeruk"] 			     = {["name"] = "resto-jusjeruk", 				["label"] = "Jus Jeruk", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "jusjeruk.png", 		 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Jus Jeruk."},
    ["resto-jusapel"] 			     = {["name"] = "resto-jusapel", 				["label"] = "Jus Apel", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "jusapel.png", 		     ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Jus Apel"},
    ["resto-susumochi"] 			 = {["name"] = "resto-susumochi", 				["label"] = "Susu Mochi", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "susumochi.png", 		 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Jus Apel"},
```

## Tambahkan list jabatan di @qb-core/shared/jobs.lua 
```
["resto"] = {
        label = "Restaurant",
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = "Magang",
                payment = 500
            },
            ['1'] = {
                name = "Karyawan",
                payment = 750
            },
            ['2'] = {
                name = "Manager",
                payment = 1000
            },
            ['3'] = {
                name = "Boss",
                payment = 1250
            },
            ['4'] = {
                name = "CEO",
                isboss = true,
                payment = 1500
            },
        },
    },	
```
## Tambahkan gambar item di inventory script

## tambahkan list animasi ke dpemotes.
```
["bsdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "BS Drink", AnimationOptions =
   {
       Prop = 'prop_food_bs_juice02',
       PropBone = 28422,
       PropPlacement = {0.02, 0.0, -0.10, 0.0, 0.0, -0.50},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

["fries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Fries", AnimationOptions =
    {
       Prop = 'prop_food_bs_chips',
       PropBone = 60309,
       PropPlacement = { -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 13.9598 },
       EmoteMoving = true,
   }},

["fbbq"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "fbbq", AnimationOptions =
   {
       Prop = "prop_fish_slice_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       --
       EmoteLoop = true,
       EmoteMoving = false,
   }},

```

## tambahkan 2 .ogg file [sounds] ke interact-sound/client/html/sounds
