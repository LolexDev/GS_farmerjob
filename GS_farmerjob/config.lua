--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Config = {}
Config.Locale = 'en' -- Jezici rs za Srpski, en za Engleski // Languages rs for Serbian, en for English
Config.seme = 'seed' -- Stvar koju dobiju kad kupe seme // Item they get after they buy seed
Config.SadnjaI = 'Polje' -- Ime blipa od polja // Name of blip field
Config.KoristiKomandu = true -- Ako ocete da koristis sa komandom da zasadi ostavite na true a ako ne stavite na false // If u want to seed with command then leave it like this but if u don't want to then set it to false
Config.semeC = 5 -- Cena semena // Price of seed
Config.Kupus = 'cabbage' -- Ime itema od kupusa // Name of cabbage item
Config.dobitak = 10 -- Ime vase stvari sto ce dobiti od sadnje // Name of your item that will they get when they finish their work
Config.polje = vector3(1954.4504, 4857.8506, 45.4610)
Config.VremeSadjenja = 5 -- U sekundama // In seconds
Config.Debug = false 
Config.LogHeader = "GS Farmerjob » Logs"
Config.Webhook = "" -- Discord webhook
Config.StateVreme = 60 -- U sekundama // In seconds

Config.Blipovi = {
    {
        Ime = "Farma", -- Ime blipa // Name of blip
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 2, -- Boja blipa // Color of blip
        Ikonica = 253, -- Blip sprite // Blip sprite
        Kordinate = vector3(2010.2825, 4985.2388, 41.2051), -- Kordinate blipa // Coords of blip
        Pokazuj = 6, -- Display
    }
}

Config.KupiSeme = { -- Buy seed
    {
    coords = vector4(2004.6752, 4983.5518, 41.4464, 309.5927), -- Coords of ped
    model = 'a_m_m_farmer_01' -- Ped
    }
}

Config.Sadnja = { -- Find field
    { coords = vector4(2016.8431, 4987.9893, 42.0983, 154.5051), model = 'a_m_m_farmer_01'}, -- Ped & coords
}

Config.Polja = { -- Fields
    { x = 1962.4537, y = 4879.8535, z = 45.5561 }, -- Blip coords
    { x = 1965.5015, y = 4877.1626, z = 44.4753}, -- Blip coords
	{ x = 1967.3612, y = 4875.2598, z = 45.4666}, -- Blip coords
	{ x = 1969.5737, y = 4873.0537, z = 45.4691}, -- Blip coords
	{ x = 1971.6034, y = 4870.7900, z = 44.4691}, -- Blip coords
	{ x = 1974.1373, y = 4868.2314, z = 44.4483}, -- Blip coords
	{ x = 1976.0349, y = 4866.3447, z = 44.4473}, -- Blip coords
	{ x = 1977.6183, y = 4864.7051, z = 44.5270}, -- Blip coords
}

Config.Opcije = { -- Opcije za kupovinu // Options for purchase
	{
		value = 'money',
		label = "Gotovina",
	},
	{
		value = 'bank',
		label = "Banka",
	},
}

Config.Kupus = { -- Targets // Cabages
["kupus1"] = { coords = vector4(1963.3850, 4879.3472, 44.5339, 231.2791), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false }, -- Target 1
["kupus2"] = { coords = vector4(1965.5015, 4877.1626, 44.4753, 225.3002), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 2
["kupus3"] = { coords = vector4(1967.3612, 4875.2598, 44.4666, 225.6067), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 3
["kupus4"] = { coords = vector4(1969.5737, 4873.0537, 44.4691, 40.2124), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 4
["kupus5"] = { coords = vector4(1971.6034, 4870.7900, 44.4691, 245.4224), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 5
["kupus6"] = { coords = vector4(1974.1373, 4868.2314, 44.4483, 226.8612), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 6
["kupus7"] = { coords = vector4(1976.0349, 4866.3447, 44.4473, 10.2722), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 7
["kupus8"] = { coords = vector4(1977.6183, 4864.7051, 44.5270, 221.2804), prop = 'prop_veg_crop_03_cab', saksija = 'prop_kitch_pot_huge', posadio = false}, -- Target 8
}

Config.Uniforme = { -- Uniforms
	farmer = {
		male = { -- Musko
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 26, ['torso_2']  = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 70, ['pants_1']  = 89,
			['pants_2']  = 10,   ['shoes_1']  = 27,
			['shoes_2']  = 0,  ['chain_1']  = 0,
			['chain_2']  = 0,
		},
		female = { -- Zensko
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
