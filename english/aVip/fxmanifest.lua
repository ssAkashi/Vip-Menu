fx_version 'adamant'
game { 'gta5' };

developer 'Akashi'
discord 'A̴k̴a̴s̴h̴i̴#0001'

shared_script 'config.lua'

client_scripts {
    -- ↓ RageUI src ↓
    "TheRageUI/client/RMenu.lua",
    "TheRageUI/client/menu/RageUI.lua",
    "TheRageUI/client/menu/Menu.lua",
    "TheRageUI/client/menu/MenuController.lua",
    "TheRageUI/client/components/*.lua",
    "TheRageUI/client/menu/elements/*.lua",
    "TheRageUI/client/menu/items/*.lua",
    "TheRageUI/client/menu/panels/*.lua",
    "TheRageUI/client/menu/windows/*.lua",
    -- ↓ Script client ↓
    'client/*.lua',
}

server_scripts {
    -- ↓ Script server ↓
    'server/*.lua',
}

--[[dependencies {
	'skinchanger',
	'esx_skin',
}]]