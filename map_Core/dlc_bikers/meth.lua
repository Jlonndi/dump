
-- Meth Lab: 1009.5, -3196.6, -39.0

exports('GetBikerMethLabObject', function()
    return BikerMethLab
end)

BikerMethLab = {
    interiorId = 247041,
    Ipl = {
        Interior = {
            ipl = "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo",
            Load = function() EnableIpl(BikerMethLab.Ipl.Interior.ipl, true) end,
            Remove = function() EnableIpl(BikerMethLab.Ipl.Interior.ipl, false) end
        },
    },
    Style = {
        none = "", empty = "meth_lab_empty", basic = {"meth_lab_basic", "meth_lab_setup"}, upgrade = {"meth_lab_upgrade", "meth_lab_setup"},
        Set = function(style, refresh)
            BikerMethLab.Style.Clear(false)
            if (style ~= "") then
                SetIplPropState(BikerMethLab.interiorId, style, true, refresh)
            else
                if (refresh) then RefreshInterior(BikerMethLab.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(BikerMethLab.interiorId, {BikerMethLab.Style.empty, BikerMethLab.Style.basic, BikerMethLab.Style.upgrade}, false, refresh)
        end
    },
    Security = {
        none = "", upgrade = "meth_lab_security_high",
        Set = function(security, refresh)
            BikerMethLab.Security.Clear(false)
            if (security ~= "") then
                SetIplPropState(BikerMethLab.interiorId, security, true, refresh)
            else
                if (refresh) then RefreshInterior(BikerMethLab.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(BikerMethLab.interiorId, BikerMethLab.Security.upgrade, false, refresh)
        end
    },
    Details = {
        production = "meth_lab_production",			-- Products
        Enable = function (details, state, refresh)
            SetIplPropState(BikerMethLab.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        BikerMethLab.Ipl.Interior.Load()
        BikerMethLab.Style.Set(BikerMethLab.Style.basic)
        BikerMethLab.Security.Set(BikerMethLab.Security.upgrade)
        BikerMethLab.Details.Enable(BikerMethLab.Details.production, true)
        RefreshInterior(BikerMethLab.interiorId)
        local iplId = GetInteriorAtCoordsWithType(962.66778564453,-1145.1177978516,-4.0858283042908,"bkr_Biker_DLC_INT_Ware01")
        SetIplPropState(iplId,"meth_lab_setup",true,nil)
        RefreshInterior(iplId)
    end
}

exports('GetBikerMethLabObject2', function()
    return BikerMethLab2
end)

BikerMethLab2 = {
    interiorId = GetInteriorAtCoordsWithType(962.66778564453,-1145.1177978516,-4.0858283042908,"bkr_Biker_DLC_INT_Ware01"),
    Ipl = {
        Interior = {
            ipl = "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo",
            Load = function() EnableIpl(BikerMethLab2.Ipl.Interior.ipl, true) end,
            Remove = function() EnableIpl(BikerMethLab2.Ipl.Interior.ipl, false) end
        },
    },
    Style = {
        none = "", empty = "meth_lab_empty", basic = {"meth_lab_basic", "meth_lab_setup"}, upgrade = {"meth_lab_upgrade", "meth_lab_setup"},
        Set = function(style, refresh)
            BikerMethLab2.Style.Clear(false)
            if (style ~= "") then
                SetIplPropState(BikerMethLab2.interiorId, style, true, refresh)
            else
                if (refresh) then RefreshInterior(BikerMethLab2.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(BikerMethLab2.interiorId, {BikerMethLab2.Style.empty, BikerMethLab2.Style.basic, BikerMethLab2.Style.upgrade}, false, refresh)
        end
    },
    Security = {
        none = "", upgrade = "meth_lab_security_high",
        Set = function(security, refresh)
            BikerMethLab2.Security.Clear(false)
            if (security ~= "") then
                SetIplPropState(BikerMethLab2.interiorId, security, true, refresh)
            else
                if (refresh) then RefreshInterior(BikerMethLab2.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(BikerMethLab2.interiorId, BikerMethLab2.Security.upgrade, false, refresh)
        end
    },
    Details = {
        production = "meth_lab_production",			-- Products
        Enable = function (details, state, refresh)
            SetIplPropState(BikerMethLab2.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        BikerMethLab2.Ipl.Interior.Load()
        BikerMethLab2.Style.Set(BikerMethLab2.Style.basic)
        BikerMethLab2.Security.Set(BikerMethLab2.Security.upgrade)
        BikerMethLab2.Details.Enable(BikerMethLab2.Details.production, true)
        RefreshInterior(BikerMethLab2.interiorId)

    end
}
