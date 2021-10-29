--===============================
-- by JUST INTERIOR STUDIO
-- Discord UncleJust#0001
--===============================

--==============================================================
--НАСТРОЙКИ НАХОДЯТ В САМОМ НИЗУ СКРИПТА / SETTINGS ARE LOWEST SCRIPT
--==============================================================


--============================ НЕ ТРОГАТЬ / DO TOUCH ==================================

Citizen.CreateThread(function()

    RequestIpl("int_sheriff_first_milo_")
    RequestIpl("int_sheriff_main_milo_")
    RequestIpl("int_sheriff_second_milo_")
    RequestIpl("int_sheriff_stairs1_milo_")
    RequestIpl("int_sheriff_stairs2_milo_")

    local int_sheriff3 = GetInteriorAtCoordsWithType(1850.305,3690.974,38.071,"int_sheriff_second")
    local int_sheriff2 = GetInteriorAtCoordsWithType(1851.168,3684.968,34.270,"int_sheriff_main")
    local int_sheriff1 = GetInteriorAtCoordsWithType(1855.779,3686.197,30.267,"int_sheriff_first")
    local int_sh_stair1 = GetInteriorAtCoordsWithType(1847.633,3681.130,34.269,"int_sheriff_stairs1")
    local int_sh_stair2 = GetInteriorAtCoordsWithType(1855.953,3699.315,34.270,"int_sheriff_stairs2")

    function RefreshIpl()
        RefreshInterior(int_sheriff1)
        RefreshInterior(int_sheriff2)
        RefreshInterior(int_sheriff3)
        RefreshInterior(int_sh_stair1)
        RefreshInterior(int_sh_stair2)
    end

    local bcsd = false
    function sheriff_bcsd(bcsd)
        if bcsd then
            bcsd = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_bcsd")
            EnableInteriorProp(int_sheriff2, "sheriff_bcsd")
            EnableInteriorProp(int_sheriff3, "sheriff03_bcsd")
            EnableInteriorProp(int_sh_stair2, "sheriff_stair2_bcsd")

        else
            bcsd = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_bcsd")
            DisableInteriorProp(int_sheriff2, "sheriff_bcsd")
            DisableInteriorProp(int_sheriff3, "sheriff03_bcsd")
            DisableInteriorProp(int_sh_stair2, "sheriff_stair2_bcsd")
        end
    end

    local lssd = false
    function sheriff_lssd(lssd)
        if lssd then
            lssd = true
            RefreshIpl()
            EnableInteriorProp(int_sh_stair2, "sheriff_stair2_lssd")
            EnableInteriorProp(int_sheriff1, "sheriff01_lssd")
            EnableInteriorProp(int_sheriff3, "sheriff03_lssd")
            EnableInteriorProp(int_sheriff2, "sheriff_lssd")

        else
            lssd = false
            RefreshIpl()
            DisableInteriorProp(int_sh_stair2, "sheriff_stair2_lssd")
            DisableInteriorProp(int_sheriff1, "sheriff01_lssd")
            DisableInteriorProp(int_sheriff3, "sheriff03_lssd")
            DisableInteriorProp(int_sheriff2, "sheriff_lssd")
        end
    end

    local state = false
    function sheriff_state(state)
        if state then
            state = false
            RefreshIpl()
            EnableInteriorProp(int_sh_stair2, "sheriff_stair2_state")
            EnableInteriorProp(int_sheriff3, "sheriff03_state")
            EnableInteriorProp(int_sheriff2, "sheriff_state")
            EnableInteriorProp(int_sheriff1, "sheriff01_state")
        else
            state = false
            RefreshIpl()
            DisableInteriorProp(int_sh_stair2, "sheriff_stair2_state")
            DisableInteriorProp(int_sheriff3, "sheriff03_state")
            DisableInteriorProp(int_sheriff2, "sheriff_state")
            DisableInteriorProp(int_sheriff1, "sheriff01_state")
        end
    end

    local bcso = false
    function sheriff_bcso(bcso)
        if bcso then
            bcso = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_bcso")
            EnableInteriorProp(int_sh_stair2, "sheriff_stair2_bcso")
            EnableInteriorProp(int_sheriff3, "sheriff03_bcso")
            EnableInteriorProp(int_sheriff2, "sheriff_bcso")

        else
            bcso = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_bcso")
            DisableInteriorProp(int_sh_stair2, "sheriff_stair2_bcso")
            DisableInteriorProp(int_sheriff3, "sheriff03_bcso")
            DisableInteriorProp(int_sheriff2, "sheriff_bcso")
        end
    end



    local open1 = false
    function blind_toggle(open1)
        if open1 then
            open1 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_blind_open")
            EnableInteriorProp(int_sheriff3, "sheriff03_blind_open")
            EnableInteriorProp(int_sheriff3, "sheriff03_office_blind_open")
            DisableInteriorProp(int_sheriff2, "sheriff_blind_close")
            DisableInteriorProp(int_sheriff3, "sheriff03_blind_close")
            DisableInteriorProp(int_sheriff3, "sheriff03_offece_blind_close")
        else
            open1 = false
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_blind_close")
            EnableInteriorProp(int_sheriff3, "sheriff03_blind_close")
            EnableInteriorProp(int_sheriff3, "sheriff03_offece_blind_close")
            DisableInteriorProp(int_sheriff2, "sheriff_blind_open")
            DisableInteriorProp(int_sheriff3, "sheriff03_blind_open")
            DisableInteriorProp(int_sheriff3, "sheriff03_office_blind_open")
        end
    end

    local mug01_1 = false
    function mug_room1_01(mug01_1)
        if mug01_1 then
            mug01_1 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_room1_mug")
        else
            mug01_1 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_room1_mug")
        end
    end

    local mug01_2 = false
    function mug_room2_01(mug01_2)
        if mug01_2 then
            mug01_2 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_room2_mug")
        else
            mug01_2 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_room2_mug")
        end
    end

    local mug01_3 = false
    function mug_room3_01(mug01_3)
        if mug01_3 then
            mug01_3 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_room3_mug")
        else
            mug01_3 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_room3_mug")
        end
    end

    local mug01_5 = false
    function mug_room5_01(mug01_5)
        if mug01_5 then
            mug01_5 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_room5_mug")
        else
            mug01_5 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_room5_mug")
        end
    end

    local evedence = false
    function evedence_toggle(evedence)
        if evedence then
            evedence = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence")
        else
            evedence = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence")
        end
    end

    local coke = false
    function evedence_coke(coke)
        if coke then
            coke = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_coke")
        else
            coke = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_coke")
        end
    end

    local weed = false
    function evedence_weed(weed)
        if weed then
            weed = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_weed")
        else
            weed = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_weed")
        end
    end

    local box = false
    function evedence_box(box)
        if box then
            box = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_box")
        else
            box = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_box")
        end
    end

    local money = false
    function evedence_money(money)
        if money then
            money = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_money")
        else
            money = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_money")
        end
    end

    local meth = false
    function evedence_meth(meth)
        if meth then
            meth = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_meth")
        else
            meth = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_meth")
        end
    end

    local jewels = false
    function evedence_jewels(jewels)
        if jewels then
            jewels = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_jewels")
        else
            jewels = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_jewels")
        end
    end

    local elec = false
    function evedence_elec(elec)
        if elec then
            elec = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_elec")
        else
            elec = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_elec")
        end
    end

    local med = false
    function evedence_med(med)
        if med then
            med = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_med")
        else
            med = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_med")
        end
    end

    local weap = false
    function evedence_weap(weap)
        if weap then
            weap = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff1, "sheriff01_evedence_weap")
        else
            weap = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff1, "sheriff01_evedence_weap")
        end
    end

    local mug02_1 = false
    function mug_room1_02(mug02_1)
        if mug02_1 then
            mug02_1 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room1_mug")
        else
            mug02_1 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room1_mug")
        end
    end

    local mug02_2 = false
    function mug_room2_02(mug02_2)
        if mug02_2 then
            mug02_2 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room2_mug")
        else
            mug02_2 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room2_mug")
        end
    end

    local mug02_3 = false
    function mug_room3_02(mug02_3)
        if mug02_3 then
            mug02_3 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room3_mug")
        else
            mug02_3 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room3_mug")
        end
    end

    local mug02_4 = false
    function mug_room4_02(mug02_4)
        if mug02_4 then
            mug02_4 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room4_mug")
        else
            mug02_4 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room4_mug")
        end
    end

    local mug02_5 = false
    function mug_room5_02(mug02_5)
        if mug02_5 then
            mug02_5 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room5_mug")
        else
            mug02_5 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room5_mug")
        end
    end

    local mug02_6 = false
    function mug_room6_02(mug02_6)
        if mug02_6 then
            mug02_6 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room6_mug")
        else
            mug02_6 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room6_mug")
        end
    end

    local mug03_1 = false
    function mug_room1_03(mug03_1)
        if mug03_1 then
            mug03_1 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff3, "sheriff03_room1_mug")
        else
            mug03_1 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff3, "sheriff03_room1_mug")
        end
    end

    local mug_stair_1 = false
    function stair_mug_1(mug_stair_1)
        if mug_stair_1 then
            mug_stair_1 = true
            RefreshIpl()
            EnableInteriorProp(int_sh_stair1, "sheriff_stair1_mug")
        else
            mug_stair_1 = false
            RefreshIpl()
            DisableInteriorProp(int_sh_stair1, "sheriff_stair1_mug")
        end
    end

    local mug_stair_2 = false
    function stair_mug_2(mug_stair_2)
        if mug_stair_2 then
            mug_stair_2 = true
            RefreshIpl()
            EnableInteriorProp(int_sh_stair2, "sheriff_stair2_mug")
        else
            mug_stair_2 = false
            RefreshIpl()
            DisableInteriorProp(int_sh_stair2, "sheriff_stair2_mug")
        end
    end

    local weap1 = false
    function weap_staff_1(weap1)
        if weap1 then
            weap1 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_weap_1")
        else
            weap1 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_weap_1")
        end
    end

    local weap2 = false
    function weap_staff_2(weap2)
        if weap2 then
            weap2 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_weap_2")
        else
            weap2 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_weap_2")
        end
    end

    local weap3 = false
    function weap_staff_3(weap3)
        if weap3 then
            weap3 = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_weap_3")
        else
            weap3 = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_weap_3")
        end
    end

    local staff = false
    function weap_staff(staff)
        if staff then
            staff = true
            RefreshIpl()
            EnableInteriorProp(int_sheriff2, "sheriff_room3_staff")
        else
            staff = false
            RefreshIpl()
            DisableInteriorProp(int_sheriff2, "sheriff_room3_staff")
        end
    end
    --================================================================================

    --==========================
    --НАСТРОЙКИ / SETTINGS
    --==========================

    --ru: Меняйте значения false/true в функциях ниже чтобы включить или выключить ipl интерьера
    --eng: Change the values of false / true in the functions below to enable or disable the interior ipl

    sheriff_bcsd(true) --Enable BCSD Symbols
    sheriff_lssd(false) --Enable LSSD Symbols
    sheriff_state(false) --Enable STATE Symbols
    sheriff_bcso(false) --Enable BCSO Symbols

    blind_toggle(true) --Lower or raise the blinds

    weap_staff(true) --Add or remove weapon room content
    weap_staff_1(true) --Add or remove weapon room content
    weap_staff_2(true) --Add or remove weapon room content
    weap_staff_3(true) --Add or remove weapon room content

    mug_room1_01(true) --add or remove dirt on the -1st floor in 1 room
    mug_room2_01(true) --add or remove dirt on the -1st floor in 2 room
    mug_room3_01(true) --add or remove dirt on the -1st floor in 3 room
    mug_room5_01(true) --add or remove dirt on the -1st floor in 5 room

    mug_room1_02(true) --add or remove dirt on the 1st floor in 1 room
    mug_room2_02(true) --add or remove dirt on the 1st floor in 2 room
    mug_room3_02(true) --add or remove dirt on the 1st floor in 3 room
    mug_room4_02(true) --add or remove dirt on the 1st floor in 4 room
    mug_room5_02(true) --add or remove dirt on the 1st floor in 5 room
    mug_room6_02(true) --add or remove dirt on the 1st floor in 6 room

    mug_room1_03(true) --add or remove dirt on the 3st floor

    stair_mug_1(true) --add or remove dirt on the stair 1
    stair_mug_2(true) --add or remove dirt on the stair 2

    evedence_toggle(true) --Add or remove boxes in evidence room
    evedence_coke(false) --Add or remove COKE staff in evidence room
    evedence_weed(false) --Add or remove WEED staff in evidence room
    evedence_box(false) --Add or remove BOX staff in evidence room
    evedence_money(false) --Add or remove MONEY staff in evidence room
    evedence_meth(false) --Add or remove METH staff in evidence room
    evedence_jewels(false) --Add or remove JEWELS staff in evidence room
    evedence_elec(false) --Add or remove ELECTRIC staff in evidence room
    evedence_med(false) --Add or remove MEDICAL staff in evidence room
    evedence_weap(false) --Add or remove WEAPON staff in evidence room

end)