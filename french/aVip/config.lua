--[[ aVip | Config ]]
--[[ true = activer, false = desactiver ]]

Vip = {} -- ne pas toucher

Vip.YourEsxTrigger = 'esx:getSharedObject' -- mettez votre trigger, généralement esx:getSharedObject :p

-- ↓ Joueur whitelist dans le menu, whitelist par steamhex
Vip.PlayersWhitelisted = {
    'steam:110000140241cb3', -- akashi
}

-- ↓ Tout ce qui est lié à l'ouverture du menuv vip
Vip.Command = {
    CommandOpenMenu = 'vip', -- /vip dans le chat pour ouvrir, vous pouvez modifier
    BindOpenMenu = 'F3', -- changez f3 par la touche que vous souhaitez, le joueur pourra la changer de son coté dans paramètres --> config des touches --> fivem
    DescriptionCommand = 'Menu VIP', -- description qui s'affichera dans les paramètres du joueur --> config des touches --> fivem
    ChatAddSuggestionActivate = true, -- si vous avez cela, vous aurez l'option ci-dessous.
    ChatAddSuggestion = 'Pour ouvrir le menu vip.' -- si vous activez le ChatAddSuggestionActivate ci dessus, vous aurez ce message qui apparaitra en écrivant le /vip dans le chat.
}

-- ↓ Liste des peds dans le menu, entre crochet = le nom du button qui sera affiché dans le menu, 
--      et entre "" le model du ped, le vrai nom (liste ici --> https://docs.fivem.net/docs/game-references/ped-models/) ↓ 
Vip.ped_list_vip = {
    ["Chat"] = "a_c_cat_01",
}

-- ↓ Pareil que au dessus, mais avec les props. Liste des props ici --> https://forge.plebmasters.de/objects?d=eyJzZWFyY2giOiIiLCJwYWdlIjoxLCJmaWx0ZXIiOnsidGFncyI6e30sImRsYyI6W10sInNpemUiOltdLCJjYXRlZ29yeSI6MH0sImNhdGVnb3J5IjowfQ%3D%3D
Vip.props_list_vip = {
    ["Table bois"] = "v_corp_cd_rectable",
}

-- ↓ Tout les props que vous mettez dans le menu ci-dessus (le model donc entre ""), mettez également dans cette liste sinon ça ne fonctionnera pas.
props_model_name = {
    "v_corp_cd_rectable"
}

-- ↓ Tout les filtres du menu, entre [] = nom en menu, "" = nom du filtre ↓ (nom du modifier)
Vip.FiltrePlayerMenu = {
    ["Vision Nuit claire"] = "cashdepotEMERGENCY",
}

-- ↓ Configuration du design du menu
Vip.ColorBanner = {
    R = 0, -- rouge (red)
    G = 0, -- vert (green)
    B = 0, -- bleu (blue)
    A = 255, -- opacité (255 = maximum)
    -- couleur rgb --> https://htmlcolorcodes.com
}

Vip.TitleMenu = {
    BannerTitle = 'VIP', -- titre sur la bannière du menu
    DescriptionTitle = { -- titre des descriptions sur les catégories du menu, en dessous de la bannière
        MainDescription = 'developped by ~b~akashi', -- description au menu principal
        WeaponDescription = '↓ Actions armes ↓', -- description dans la catégorie arme
        CarDescription = '↓ Actions voitures ↓', -- description dans la catégorie voiture
        PedDescription = '↓ Actions peds ↓', -- description dans la catégorie ped
        PropDescription = '↓ Actions props ↓', -- description dans la catégorie props
        FiltreDescription = '↓ Mettre un filtre ↓', -- description dans la catégorie filtre
    }
}
-- ↓ Activation / Désactivation des options du menu ↓ (pas d'inquiètude au niveau de l'optimisation)
Vip.EnabledOrDisabledOptions = {
    -- ↓ Menu principal ↓
    AuthorizeWeaponMenu = true, -- pour avoir la catégorie armes
    AuthorizeCarMenu = true, -- pour avoir la catégorie voitures
    AuthorizePedMenu = true, -- pour avoir la catégorie peds
    AuthorizePropsMenu = true, -- pour avoir la catégorie props
    AuthorizeFiltresMenu = true, -- pour avoir la catégorie filtres
    -- ↓ Menu armes ↓
    AuthorizeWeaponTint = true, -- pour avoir les camos des armes
    -- ↓ Menu voitures ↓
    AuthorizeWashVehicle = true, -- pour nettoyer son véhicule (pas réparer, juste nettoyer)
    AuthorizeXenonVehicle = true, -- pour pouvoir activer le phare xénon (pas les couleurs, xenon de base)
    AuthorizeXenonColourVehicle = true, -- pour activer les couleurs des phares xenons
    AuthorizeWindowActions = true, -- pour pouvroir faire des actions sur les vitres du véhicule (ouvrir / fermer)
    AuthorizeColorWindow = true, -- pour pouvoir changer la teinte des vitres du véhicule
    AuthorizeColorPlaque = true, -- pour pouvroir changer la couleur de la plaque (et non le texte)

}

-- ↓ pour configurer les cooldown / temps d'attentes quand le button est bloqué suite à une action dessus (pour éviter les spams, temps en millisecondes ) ↓ 
-- Cela évite les spams, les abus, les hrp ^^', après comme tu sens c'est pas mon serveur :p
-- 0 = aucun temps (bah ouais logique)
Vip.CooldownOptions = {
    -- ↓ Menu armes ↓
    CooldownTintWeapon = 5000, -- temps pour remettre un camouflage après avoir mis un (en millisecondes)
    -- ↓ Menu voitures ↓
    CooldownXenonColorChange = 5000, -- temps pour remettre une couleur de phare après en avoir mis une (en millisecondes)
    CooldownWindowColorChnage = 5000, -- temps remettre une teinte de vitre après en avoir mis une (en milliseconde)
    CooldownPLateColorChange = 5000, -- temps remettre une couleur de plaque après en avoir mis une (en milliseconde)
    -- ↓ Menu props ↓
    CooldownSpawnProps = 3500, -- temps remettre une teinte de vitre après en avoir mis une (en milliseconde)
}