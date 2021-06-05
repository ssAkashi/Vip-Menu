--[[ aVip | Config ]]
--[[ true = enabled, false = disabled ]]

Vip = {} -- don't touch

Vip.YourEsxTrigger = 'esx:getSharedObject' -- put your trigger, usually is esx:getSharedObject :p

-- ↓ Players whitelisyed in the vip menu, whitelist with steamhex
Vip.PlayersWhitelisted = {
    'steam:110000140241cb3', -- akashi
}

-- ↓ Everything related to the opening of the menuv vip
Vip.Command = {
    CommandOpenMenu = 'vip', -- /vip in the chat for open, vous can change this
    BindOpenMenu = 'F3', -- change f3 by the control you want, the player can change it on his side in parameters --> control config --> fivem
    DescriptionCommand = 'Menu VIP', --description that will be displayed in the player settings --> control config --> fivem
    ChatAddSuggestionActivate = true, -- if you enabled this, you will have the option below.
    ChatAddSuggestion = 'For open the VIP Menu.' -- If you enable the ChatAddSuggestionActivate above, you will get this message which will appear by writing the/vip in the chat.
}

-- ↓ List of peds in the menu, between crochet = the name of the button that will be displayed in the menu,
--      and in "" put the ped model, the real name (list here --> https://docs.fivem.net/docs/game-references/ped-models/) ↓ 
Vip.ped_list_vip = {
    ["Cat"] = "a_c_cat_01",
}

-- ↓ Same as above, but with props. List of object here --> https://forge.plebmasters.de/objects?d=eyJzZWFyY2giOiIiLCJwYWdlIjoxLCJmaWx0ZXIiOnsidGFncyI6e30sImRsYyI6W10sInNpemUiOltdLCJjYXRlZ29yeSI6MH0sImNhdGVnb3J5IjowfQ%3D%3D
Vip.props_list_vip = {
    ["Table bois"] = "v_corp_cd_rectable",
}

-- ↓ All the object that you put in the menu above (the model therefore enters ""), also put in this list otherwise it will not work.
props_model_name = {
    "v_corp_cd_rectable"
}

-- ↓ All the timecycle modifier in the menu , in [] = name in the menu, "" = timecycle modifier name ↓
Vip.FiltrePlayerMenu = {
    ["Light Night"] = "cashdepotEMERGENCY",
}

-- ↓ Design configuration of the menu
Vip.ColorBanner = {
    R = 0, -- red
    G = 0, -- green
    B = 0, -- blue
    A = 255, -- opacité (255 = maximum)
    -- rgb color --> https://htmlcolorcodes.com
}

Vip.TitleMenu = {
    BannerTitle = 'VIP', -- title on the banner of the menu
    DescriptionTitle = { -- title of the descriptions in the category of the menu, under the banner
        MainDescription = 'developped by ~b~akashi', -- description of the main menu
        WeaponDescription = '↓ Weapons actions ↓', -- description of the weapon category
        CarDescription = '↓ Vehicles actions ↓', -- description of the vehicle category
        PedDescription = '↓ Peds actions ↓', -- description of the ped category
        PropDescription = '↓ Objects actions ↓', -- description of the object category
        FiltreDescription = '↓ Put an timecycle modifier ↓', -- description of the modifier category
    }
}
-- ↓ Enable / Disable menu options ↓ (no concerns about optimization)
Vip.EnabledOrDisabledOptions = {
    -- ↓ Main menu ↓
    AuthorizeWeaponMenu = true, -- for have the weapon category
    AuthorizeCarMenu = true, -- for have the car category
    AuthorizePedMenu = true, -- for have the ped category
    AuthorizePropsMenu = true, -- for have the obvject category
    AuthorizeFiltresMenu = true, -- for have the timecycle category
    -- ↓ Weapons menu ↓
    AuthorizeWeaponTint = true, -- for have the tint of weapon
    -- ↓ Vehicles menu ↓
    AuthorizeWashVehicle = true, -- for wash your vehicle (just wash, don't fixed)
    AuthorizeXenonVehicle = true, -- for enable the xenon (not the colors, juste default xenpn)
    AuthorizeXenonColourVehicle = true, -- for enabled the xenon headlight color
    AuthorizeWindowActions = true, -- pour able do the actions in the windows of your vehicle (open / close) 
    AuthorizeColorWindow = true, -- for change the windows tint of the vehicle
    AuthorizeColorPlaque = true, -- for change the color of the plate (not the text, just colour)

}

-- ↓ to configure cooldown / wait times when the button is blocked following an action on it (to avoid spam, time in milliseconds) ↓ 
-- This avoids spam, abuse, hrp  ^^', then as you feel it is not my server :p
-- 0 = no time (well yeah logical)
Vip.CooldownOptions = {
    -- ↓ Weapon menu ↓
    CooldownTintWeapon = 5000, -- time to reset a camouflage after one (in milliseconds)    
    -- ↓ Vehicle menu ↓
    CooldownXenonColorChange = 5000, -- time to reset a headlights colour after one (in milliseconds)    
    CooldownWindowColorChnage = 5000, -- time to restore a windows color after one (in milliseconds)
    CooldownPLateColorChange = 5000, -- time to restore a plate color after one (in millisecond)
    -- ↓ Object menu ↓
    CooldownSpawnProps = 3500, -- temps remettre une teinte de vitre après en avoir mis une (en milliseconde)
}