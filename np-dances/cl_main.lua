local isHandcuffed, isSoftCuffed = false, false

local animations = {
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^5", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^6", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_phone^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_phone^2", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_vape_01^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_phone^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_phone", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "vehicleweapons_tula"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "outro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_down", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_f_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_si_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_ba_prop_battle_vape_01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_prop_npc_phone", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^flat^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^heel^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vap_heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
}

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffed = pIsHandcuffed
    isSoftCuffed = pIsHandcuffedAndWalking
end)


function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

RegisterNetEvent('np:dances:dance')
AddEventHandler('np:dances:dance', function(pDance)
    if not isHandcuffed and not isSoftCuffed then
        local noAnimations = #animations

        if pDance == -1 then
            pDance = math.random(noAnimations)
            print(_L("dances-selected", "You randomly selected dance %s"):format(pDance))
        end

        if pDance > noAnimations or pDance <= 0 then
            TriggerEvent('DoLongHudText', _L("dances-out-of-range", "There are only %s dances, select a number inbetween or random (no input)"):format(noAnimations))
            return
        end

        if animations[pDance] and animations[pDance].disabled then
            TriggerEvent('DoLongHudText', _L("dances-disabled", "This dance is disabled"))
            return
        end

        LoadAnimationDic(animations[pDance].dict)
        TaskPlayAnim(PlayerPedId(), animations[pDance].dict, animations[pDance].anim, 3.0, 3.0, -1, 1, 0, 0, 0, 0)
    end
end)
