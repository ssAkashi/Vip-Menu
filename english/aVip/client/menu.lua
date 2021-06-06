function VIPMenu()
	RMenu.Add('vip_menu', 'main_menu', RageUI.CreateMenu(Vip.TitleMenu.BannerTitle, ""))
    RMenu:Get('vip_menu', 'main_menu'):SetSubtitle(Vip.TitleMenu.DescriptionTitle.MainDescription)
    RMenu.Add('vip_menu', 'vip_weapon', RageUI.CreateSubMenu(RMenu:Get('vip_menu', 'main_menu'), Vip.TitleMenu.BannerTitle, Vip.TitleMenu.DescriptionTitle.WeaponDescription))
    RMenu.Add('vip_menu', 'vip_car', RageUI.CreateSubMenu(RMenu:Get('vip_menu', 'main_menu'), Vip.TitleMenu.BannerTitle, Vip.TitleMenu.DescriptionTitle.CarDescription))
    RMenu.Add('vip_menu', 'vip_ped', RageUI.CreateSubMenu(RMenu:Get('vip_menu', 'main_menu'), Vip.TitleMenu.BannerTitle, Vip.TitleMenu.DescriptionTitle.PedDescription))
    RMenu.Add('vip_menu', 'vip_props', RageUI.CreateSubMenu(RMenu:Get('vip_menu', 'main_menu'), Vip.TitleMenu.BannerTitle, Vip.TitleMenu.DescriptionTitle.PropDescription))
    RMenu.Add('vip_menu', 'vip_filtre', RageUI.CreateSubMenu(RMenu:Get('vip_menu', 'main_menu'), Vip.TitleMenu.BannerTitle, Vip.TitleMenu.DescriptionTitle.FiltreDescription))
    RMenu:Get('vip_menu', 'main_menu'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
    RMenu:Get('vip_menu', 'vip_weapon'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
    RMenu:Get('vip_menu', 'vip_car'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
    RMenu:Get('vip_menu', 'vip_ped'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
    RMenu:Get('vip_menu', 'vip_props'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
    RMenu:Get('vip_menu', 'vip_filtre'):SetRectangleBanner(Vip.ColorBanner.R, Vip.ColorBanner.G, Vip.ColorBanner.B, Vip.ColorBanner.A)
	RMenu:Get('vip_menu', 'main_menu').Closed = function()
		openVIP = false
    end
    if openVIP then
        RageUI.Visible(RMenu:Get('vip_menu', 'main_menu'), false)
    else
        openVIP = true
        openVIPMenu()
    end
end

local weapon_list = {
    "Normal",
    "Green",
    "Gold",
    "Pink",
    "Army",
    "LSPD",
    "Orange",
    "Platinium",
}
local weapon_list_index = 1
local blocked_camo_weapon_button = false

local washvehicle = false
local xenon_color_list = {
    "Default",
    "White",
    "Blue",
    "Electric Blue",
    "Mint Green",
    "Lime Green",
    "Yellow",
    "Golden Shower",
    "Orange",
    "Red",
    "Pony Pink",
    "Hot Pink",
    "Purple",
    "Blacklight",
}
local xenon_color_index = 1
local enabled_xenon = false
local blocked_xenon_color_button = false
local activeXenon = false
local window_tint_list = {
    "Default",
    "Pure Black",
    "Dark Smoke",
    "Light Smoke",
    "Stock",
    "Limo",
    "Green"
}
local window_action = { "Ouvrir", "Fermer "}
local window_action_index = 1
local window_tint_index = 1
local activeWindowTint = false
local plate_color_list = {
    "Blue on White",
    "Yellow on Black",
    "Yellow on Blue",
    "Blue on White2",
    "Blue on White3",
    "Yankton",
}
local plate_color_index = 1
local activePlate = false

local spawn_props_acess = false

function openVIPMenu()
    if openVIP then
        openVIP = false
    else
        openVIP = true
        VIPMenu()
        RageUI.Visible(RMenu:Get('vip_menu', 'main_menu'), true)
        Citizen.CreateThread(function()
            while openVIP do
                Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('vip_menu', 'main_menu'), true, true, true, function()
                    if Vip.EnabledOrDisabledOptions.AuthorizeWeaponMenu then
                        RageUI.ButtonWithStyle("Weapon Category", "To access at the weapon category.", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('vip_menu', 'vip_weapon'))
                    end
                    if Vip.EnabledOrDisabledOptions.AuthorizeCarMenu then
                        RageUI.ButtonWithStyle("Car Category", "To access at the vehicle category.", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('vip_menu', 'vip_car'))
                    end
                    if Vip.EnabledOrDisabledOptions.AuthorizePedMenu then
                        RageUI.ButtonWithStyle("Ped Category", "To access at the ped category.", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('vip_menu', 'vip_ped'))
                    end
                    if Vip.EnabledOrDisabledOptions.AuthorizePropsMenu then
                        RageUI.ButtonWithStyle("Object Category", "To access at the object category.", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('vip_menu', 'vip_props'))
                    end
                    if Vip.EnabledOrDisabledOptions.AuthorizeFiltresMenu then
                        RageUI.ButtonWithStyle("Timecycle Modifier Category", "To access at the timecycle modifier category.", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('vip_menu', 'vip_filtre'))
                    end
                end)
                RageUI.IsVisible(RMenu:Get('vip_menu', 'vip_weapon'), true, true, true, function()
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator('') RageUI.Separator('~r~No actions possibles in vehicle !') RageUI.Separator('')
                    else
                        if Vip.EnabledOrDisabledOptions.AuthorizeWeaponTint then
                            RageUI.List("Weapon Tint", weapon_list, weapon_list_index, "Choice tint for your weapon.", {RightBadge = RageUI.BadgeStyle.Gun}, not blocked_camo_weapon_button, function(_,a,s,i)
                                weapon_list_index = i
                                if a then
                                    if weapon_list_index == 1 then
                                        if s then
                                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0)
                                        end
                                    else
                                        if weapon_list_index == 2 then
                                            if s then
                                             --  blocked_camo_weapon_button = true
                                                SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1)
                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                    blocked_camo_weapon_button = false
                                                end)
                                            end
                                        else
                                            if weapon_list_index == 3 then
                                                if s then
                                                 --   blocked_camo_weapon_button = true
                                                    SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2)
                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                        blocked_camo_weapon_button = false
                                                    end)
                                                end
                                            else
                                                if weapon_list_index == 4 then
                                                    if s then
                                                      --  blocked_camo_weapon_button = true
                                                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3)
                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                            blocked_camo_weapon_button = false
                                                        end)
                                                    end
                                                else
                                                    if weapon_list_index == 5 then
                                                        if s then
                                                        --    blocked_camo_weapon_button = true
                                                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 4)
                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                                blocked_camo_weapon_button = false
                                                            end)
                                                        end
                                                    else
                                                        if weapon_list_index == 6 then
                                                            if s then
                                                              --  blocked_camo_weapon_button = true
                                                                SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 5)
                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                                    blocked_camo_weapon_button = false
                                                                end)
                                                            end
                                                        else
                                                            if weapon_list_index == 7 then
                                                                if s then
                                                                 --   blocked_camo_weapon_button = true
                                                                    SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 6)
                                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                                        blocked_camo_weapon_button = false
                                                                    end)
                                                                end
                                                            else
                                                                if weapon_list_index == 8 then
                                                                    if s then
                                                                   --     blocked_camo_weapon_button = true
                                                                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 7)
                                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownTintWeapon, function()
                                                                            blocked_camo_weapon_button = false
                                                                        end)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end)
                RageUI.IsVisible(RMenu:Get('vip_menu', 'vip_car'), true, true, true, function()
                    pVeh = GetVehiclePedIsUsing(PlayerPedId())
                    pVeh2 = GetVehiclePedIsIn(PlayerPedId(), true)
                    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator("") RageUI.Separator("~r~You is not in vehicle !") RageUI.Separator("")
                    else
                        if Vip.EnabledOrDisabledOptions.AuthorizeWashVehicle then
                            RageUI.ButtonWithStyle("Wash Vehicle", "Wash your vehicle is in.", {RightLabel = "→→"}, not washvehicle, function(_,_,s)
                                if s then
                                    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                        ESX.ShowAdvancedNotification('Information', 'VIP', '~r~You is not in vehicle.', 'CHAR_SOCIAL_CLUB', 1)
                                    else
                                        washvehicle = true
                                        WashDecalsFromVehicle(pVeh, 1.0)
                                        ESX.ShowAdvancedNotification('Information', 'VIP', 'Vehicle wash with success !', 'CHAR_SOCIAL_CLUB', 1)
                                        Citizen.SetTimeout(5000, function()
                                            washvehicle = false
                                        end)
                                    end
                                end
                            end)
                        end
                        if Vip.EnabledOrDisabledOptions.AuthorizeXenonVehicle then
                            RageUI.Separator('↓ Phares xénon ↓')
                            RageUI.Checkbox("Enabled xenon headlights", "Enabled / Disabled the headlights xenon.", activeXenon, { Style = RageUI.CheckboxStyle.Tick }, function(_,s,_,c)
                                activeXenon = c;
                                if s then
                                    if c then
                                    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                        ESX.ShowAdvancedNotification('Information', 'VIP', '~r~You is not in vehicle !', 'CHAR_SOCIAL_CLUB', 1)
                                        activeXenon = false
                                    else
                                        activeXenon = true
                                        enabled_xenon = true
                                        local player_vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                                        SetVehicleModKit(player_vehicle, 0)
                                        ToggleVehicleMod(player_vehicle, 18, true)
                                        SetVehicleWindowTint(player_vehicle, 2)
                                        ToggleVehicleMod(player_vehicle, 22, true)
                                        SetVehicleWindowTint(player_vehicle, 3)
                                        ToggleVehicleMod(player_vehicle, 20, true)
                                    end
                                    else
                                        activeXenon = false
                                        xenon_check = false
                                        ToggleVehicleMod(pVeh, 22, false)
                                    end
                                end
                            end)
                        end
                        if activeXenon then
                            RageUI.List("Xenon headlights colour", xenon_color_list, xenon_color_index, "Choice a color for you xenon headlights.", {RightBadge = RageUI.BadgeStyle.Car}, not blocked_xenon_color_button, function(_,a,s,i)
                                xenon_color_index = i
                                if a then
                                    if xenon_color_index == 1 then
                                        if s then
                                            SetVehicleHeadlightsColour(pVeh, -1)
                                        end
                                    else
                                        if xenon_color_index == 2 then
                                            if s then
                                               -- blocked_xenon_color_button = true
                                                SetVehicleHeadlightsColour(pVeh, 0)
                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                    blocked_camo_weapon_button = false
                                                end)
                                            end
                                        else
                                            if xenon_color_index == 3 then
                                                if s then
                                                 --   blocked_xenon_color_button = true
                                                    SetVehicleHeadlightsColour(pVeh, 1)
                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                        blocked_xenon_color_button = false
                                                    end)
                                                end
                                            else
                                                if xenon_color_index == 4 then
                                                    if s then
                                                      --  blocked_xenon_color_button = true
                                                        SetVehicleHeadlightsColour(pVeh, 2)
                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                            blocked_xenon_color_button = false
                                                        end)
                                                    end
                                                else
                                                    if xenon_color_index == 5 then
                                                        if s then
                                                       --     blocked_xenon_color_button = true
                                                            SetVehicleHeadlightsColour(pVeh, 3)
                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                blocked_xenon_color_button = false
                                                            end)
                                                        end
                                                    else
                                                        if xenon_color_index == 6 then
                                                            if s then
                                                              --  blocked_xenon_color_button = true
                                                                SetVehicleHeadlightsColour(pVeh, 4)
                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                    blocked_xenon_color_button = false
                                                                end)
                                                            end
                                                        else
                                                            if xenon_color_index == 7 then
                                                                if s then
                                                                 --   blocked_xenon_color_button = true
                                                                    SetVehicleHeadlightsColour(pVeh, 5)
                                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                        blocked_xenon_color_button = false
                                                                    end)
                                                                end
                                                            else
                                                                if xenon_color_index == 8 then
                                                                    if s then
                                                                     --   blocked_xenon_color_button = true
                                                                        SetVehicleHeadlightsColour(pVeh, 6)
                                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                            blocked_xenon_color_button = false
                                                                        end)
                                                                    end
                                                                else
                                                                    if xenon_color_index == 9 then
                                                                        if s then
                                                                         --   blocked_xenon_color_button = true
                                                                            SetVehicleHeadlightsColour(pVeh, 7)
                                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                blocked_xenon_color_button = false
                                                                            end)
                                                                        end
                                                                    else
                                                                        if xenon_color_index == 10 then
                                                                            if s then
                                                                                blocked_xenon_color_button = true
                                                                                SetVehicleHeadlightsColour(pVeh, 8)
                                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                    blocked_xenon_color_button = false
                                                                                end)
                                                                            end
                                                                        else
                                                                            if xenon_color_index == 11 then
                                                                                if s then
                                                                                  --  blocked_xenon_color_button = true
                                                                                    SetVehicleHeadlightsColour(pVeh, 9)
                                                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                        blocked_xenon_color_button = false
                                                                                    end)
                                                                                end
                                                                            else
                                                                                if xenon_color_index == 12 then
                                                                                    if s then
                                                                                     --   blocked_xenon_color_button = true
                                                                                        SetVehicleHeadlightsColour(pVeh, 10)
                                                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                            blocked_xenon_color_button = false
                                                                                        end)
                                                                                    end
                                                                                else
                                                                                    if xenon_color_index == 13 then
                                                                                        if s then
                                                                                        --    blocked_xenon_color_button = true
                                                                                            SetVehicleHeadlightsColour(pVeh, 11)
                                                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                                blocked_xenon_color_button = false
                                                                                            end)
                                                                                        end
                                                                                    else
                                                                                        if xenon_color_index == 14 then
                                                                                            if s then
                                                                                            --    blocked_xenon_color_button = true
                                                                                                SetVehicleHeadlightsColour(pVeh, 12)
                                                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownXenonColorChange, function()
                                                                                                    blocked_xenon_color_button = false
                                                                                                end)
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                        if Vip.EnabledOrDisabledOptions.AuthorizeWindowActions or Vip.EnabledOrDisabledOptions.AuthorizeColorWindow then
                            RageUI.Separator('↓ Windows ↓')
                        end
                            if Vip.EnabledOrDisabledOptions.AuthorizeWindowActions then
                            RageUI.List("Windows actions", window_action, window_action_index, "Open or close your vehicle windows.", {}, true, function(_,a,s,i) -- its very good for teamspeak
                                window_action_index = i
                                if a then
                                    if window_action_index == 1 then
                                        if s then
                                            RollDownWindows(pVeh2)
                                        end
                                    else
                                        if window_action_index == 2 then
                                            if s then
                                                for i = 0,7,1 do
                                                    RollUpWindow(pVeh2, i)
                                                    FixVehicleWindow(pVeh2, i)
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                        if Vip.EnabledOrDisabledOptions.AuthorizeColorWindow then
                            RageUI.List("Color", window_tint_list, window_tint_index, "Choice a color of your windows.", {}, not activeWindowTint, function(_,a,s,i)
                                window_tint_index = i
                                if a then
                                    if window_tint_index == 1 then
                                        if s then
                                         --   activeWindowTint = true
                                            SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId()), 0)
                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                activeWindowTint = false
                                            end)
                                        end
                                    else
                                        if window_tint_index == 2 then
                                            if s then
                                        --        activeWindowTint = true
                                                SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId()), 1)
                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                    activeWindowTint = false
                                                end)
                                            end
                                        else
                                            if window_tint_index == 3 then
                                                if s then
                                                 --   activeWindowTint = true
                                                    SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(), true), 2)
                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                        activeWindowTint = false
                                                    end)
                                                end
                                            else
                                                if window_tint_index == 4 then
                                                    if s then
                                                      --  activeWindowTint = true
                                                        SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(), true), 3)
                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                            activeWindowTint = false
                                                        end)
                                                    end
                                                else
                                                    if window_tint_index == 5 then
                                                        if s then
                                                        --    activeWindowTint = true
                                                            SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(), true), 4)
                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                                activeWindowTint = false
                                                            end)
                                                        end
                                                    else
                                                        if window_tint_index == 6 then
                                                            if s then
                                                             --   activeWindowTint = true
                                                                SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(), true), 5)
                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                                    activeWindowTint = false
                                                                end)
                                                            end
                                                        else
                                                            if window_tint_index == 7 then
                                                                if s then
                                                                --    activeWindowTint = true
                                                                    SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId(), true), 6)
                                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownWindowColorChnage, function()
                                                                        activeWindowTint = false
                                                                    end)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                        if Vip.EnabledOrDisabledOptions.AuthorizeColorPlaque then
                            RageUI.Separator('↓ Plate ↓')
                            RageUI.List("Color", plate_color_list, plate_color_index, "Choice a plate color for your vehicle.", {}, not activePlate, function(_,a,s,i)
                                plate_color_index = i
                                if a then
                                    if plate_color_index == 1 then
                                        if s then
                                         --   activePlate = true
                                            SetVehicleNumberPlateTextIndex(pVeh, 0)
                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                activePlate = false
                                            end)
                                        end
                                    else
                                        if plate_color_index == 2 then
                                            if s then
                                            --    activePlate = true
                                                SetVehicleNumberPlateTextIndex(pVeh, 1)
                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                    activePlate = false
                                                end)
                                            end
                                        else
                                            if plate_color_index == 3 then
                                                if s then
                                                 --   activePlate = true
                                                    SetVehicleNumberPlateTextIndex(pVeh, 2)
                                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                        activePlate = false
                                                    end)
                                                end
                                            else
                                                if plate_color_index == 4 then
                                                    if s then
                                                  --      activePlate = true
                                                        SetVehicleNumberPlateTextIndex(pVeh, 3)
                                                        Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                            activePlate = false
                                                        end)
                                                    end
                                                else
                                                    if plate_color_index == 5 then
                                                        if s then
                                                     --       activePlate = true
                                                            SetVehicleNumberPlateTextIndex(pVeh, 4)
                                                            Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                                activePlate = false
                                                            end)
                                                        end
                                                    else
                                                        if plate_color_index == 6 then
                                                            if s then
                                                           --     activePlate = true
                                                                SetVehicleNumberPlateTextIndex(pVeh, 5)
                                                                Citizen.SetTimeout(Vip.CooldownOptions.CooldownPLateColorChange, function()
                                                                    activePlate = false
                                                                end)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('vip_menu', 'vip_ped'), true, true, true, function()
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator('') RageUI.Separator('~r~Aucune actions possible dans un véhicule !') RageUI.Separator('')
                    else
                        RageUI.ButtonWithStyle("Reset my character", "Set your character to default.", {RightLabel = "→→"}, not washvehicle, function(_,_,s)
                            if s then
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    local Male = skin.sex == 0
                                    TriggerEvent('skinchanger:loadDefaultModel', Male, function()
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                            TriggerEvent('skinchanger:loadSkin', skin)
                                            TriggerEvent('esx:restoreLoadout')
                                        end)
                                    end)
                                end)
                            end
                        end)
                        RageUI.ButtonWithStyle("Choice a ped", "Choice a ped with model name.", {RightLabel = "→→"}, not washvehicle, function(_,_,s)
                            if s then
                                local ped_name = KeyboardInput('Name of the ped ', '', 50)
                                local ped_hash_choice = GetHashKey(ped_name)
                                if ped_name ~= nil then
                                    RequestModel(ped_hash_choice)
                                    while not HasModelLoaded(ped_hash_choice) do Citizen.Wait(10) end
                                    SetParticle()
                                    SetPlayerModel(PlayerId(), ped_hash_choice)
                                    SetModelAsNoLongerNeeded(ped_hash_choice)
                                end
                            end
                        end)
                        RageUI.Separator("↓ Available Peds ↓")
                        for k,v in pairs(Vip.ped_list_vip) do
                            RageUI.ButtonWithStyle(k, "Choice this ped : ~b~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                                if s then
                                    SetParticle()
                                    local ped_hash = GetHashKey(v)
                                    RequestModel(ped_hash)
                                    while not HasModelLoaded(ped_hash) do Citizen.Wait(10) end
                                    SetEntityVisible(PlayerPedId(), true)
                                    SetPlayerModel(PlayerId(), ped_hash)
                                    SetModelAsNoLongerNeeded(ped_hash)
                                    TriggerEvent('skinchanger:getSkin', function(skin) -- for patch the invisibility bug with different ped
                                        clothes_skin = {
                                                ['bags_1'] = 0, ['bags_2'] = 0,
                                                ['tshirt_1'] = 2, ['tshirt_2'] = 2,
                                                ['torso_1'] = 2, ['torso_2'] = 2,
                                                ['arms'] = 2,
                                                ['pants_1'] = 2, ['pants_2'] = 2,
                                                ['shoes_1'] = 2, ['shoes_2'] = 2,
                                                ['mask_1'] = 2, ['mask_2'] = 2,
                                                ['bproof_1'] = 2,
                                                ['bproof_2'] = 2,
                                                ['chain_1'] = 0,
                                                ['helmet_1'] = 1, ['helmet_2'] = 1,
                                            }
                                        TriggerEvent('skinchanger:loadClothes', skin, clothes_skin)
                                    end)
                                end
                            end)
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('vip_menu', 'vip_props'), true, true, true, function()
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator('') RageUI.Separator('~r~Aucune actions possible dans un véhicule !') RageUI.Separator('')
                    else
                        RageUI.ButtonWithStyle("Remove this props", "Remove the props you did spawn.", {RightLabel = "→→"}, true, function(_,a,s)
                            if a then
                                MarkVipProps()
                            end
                            if s then
                                DeleteVipProps()
                            end
                        end)
                        RageUI.Separator('↓ Spawn Props ↓')
                        for k,v in pairs(Vip.props_list_vip) do
                            RageUI.ButtonWithStyle(k, "Spawn this props : ~b~"..k, {RightLabel = "→→"}, not spawn_props_acess, function(_,a,s)
                                if s then
                                  --  spawn_props_acess = true
                                    SpawnVipProps()
                                    Citizen.SetTimeout(Vip.CooldownOptions.CooldownSpawnProps, function()
                                        spawn_props_acess = false
                                    end)
                                end
                            end)  
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('vip_menu', 'vip_filtre'), true, true, true, function()
                    RageUI.ButtonWithStyle("Visions / Normal colors", "~r~Reset the colors + visions, put back his normal game.", {RightLabel = "→→"}, true, function(_,_,s)
                        if s then
                            SetTimecycleModifier('')
                        end
                    end)

                    RageUI.Separator('↓ Available Timecycle Modifier ↓')
                    for k,v in pairs(Vip.FiltrePlayerMenu) do
                        RageUI.ButtonWithStyle(k, "Use this light / vision : ~b~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                SetTimecycleModifier(v)
                            end
                        end)
                    end
                end)
            end
        end)
    end
end