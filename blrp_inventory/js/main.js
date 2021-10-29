let char_id = null

const images = {
    'blood_vial': 'images/blood_vial.png',
    'empty_vial': 'images/empty_vial.png',
    'hair_strand': 'images/hair_strand.png',
    'jewl_silver_bracelet': 'images/jewl_silver_bracelet.png',
    'jewl_gold_bracelet': 'images/jewl_gold_bracelet.png',
    'jewl_diamond_bracelet': 'images/jewl_diamond_bracelet.png',
    'jewl_gold_rolex': 'images/jewl_gold_rolex.png',
    'jewl_diamond_rolex': 'images/jewl_diamond_rolex.png',
    'jewl_silver_necklace': 'images/jewl_silver_necklace.png',
    'jewl_gold_necklace': 'images/jewl_gold_necklace.png',
    'jewl_diamond_necklace': 'images/jewl_diamond_necklace.png',
    'veh_scrap': 'images/veh_scrap.png',
    'bank_phone': 'images/bank_phone.png',
    'usb_drive_a': 'images/usb_drive_a.png',
    'p_cone': 'images/p_cone.png',
    'm_document': 'images/m_document.png',
    'bullet_casing': 'images/bullet_casing.png',
    'pink_slip': 'images/pink_slip.png',
    'pcp': 'images/pcp.png',
    'mescaline': 'images/pcp.png',
    'heroin': 'images/heroin.png',
    'mdma': 'images/mdma.png',
    'lsd': 'images/lsd.png',
    'hydrochloride': 'images/hydrochloride.png',
    'ether': 'images/ether.png',
    'formaldehyde': 'images/formaldehyde.png',
    'safrole': 'images/safrole.png',
    'anhydride': 'images/anhydride.png',
    'opium': 'images/opium.png',
    'ergot': 'images/ergot.png',
    'lysergic': 'images/lysergic.png',
    'paper': 'images/paper.png',
    'shank_blueprint': 'images/paper.png',
    'vial': 'images/vial.png',
    'pill_binder': 'images/pill_binder.png',
    'pill_capsule': 'images/pill_capsule.png',
    'plastic bag': 'images/ziploc-bag.png',
    'steak': 'images/steak.png',
    'food_steak_cheap': 'images/steak.png',
    'scooby snacks': 'images/scooby.png',
    'scooby_snacks': 'images/scooby.png',
    'milk': 'images/milk.png',
    'hotdog': 'images/hotdog.png',
    'bread': 'images/bread.png',
    'redgull': 'images/redbull.png',
    'salt': 'images/saltpeter.png',
    'cannabis_seed': 'images/seed.png',
    'jute_seed': 'images/seed.png',
    'rare_artifact': 'images/artifact.png',
    'gold_coin': 'images/coin.png',
    'diamond_box': 'images/diamond-box.png',
    'gold_brick': 'images/gold-brick.png',
    'laptop_h': 'images/laptop.png',
    'thermal_charge': 'images/thermal.png',
    'scuba_kit': 'images/scuba.png',
    'blood_diamond': 'images/blood_diamond.png',
    'diamond_ring': 'images/ring.png',
    'key_neverland': 'images/key.png',
    'key_unknown': 'images/key.png',
    'key_pdm': 'images/key.png',
    'key_aoda': 'images/key.png',
    'key_unicorn': 'images/key.png',
    'key_vagos': 'images/key.png',
    'key_lost': 'images/key.png',
    'medkit': 'images/medical-kit.png',
    'dressing': 'images/dressing.png',
    'high_quality_fish': 'images/fish.png',
    'regular_quality_fish': 'images/fish.png',
    'fish': 'images/fish.png',
    'gadget': 'images/gadget.png',
    'cement': 'images/cement.png',
    'nocrack': 'images/cement.png',
    'ppizza': 'images/pizza.png',
    'yeast': 'images/yeast.png',
    'grape': 'images/grape.png',
    'bitter_wine': 'images/wine.png',
    'wine': 'images/wine.png',
    'gocagola': 'images/cola.png',
    'starlatte': 'images/latte.png',
    'gsr_kit': 'images/gsr.png',
    'diamond': 'images/diamond.png',
    'ruby': 'images/ruby.png',
    'old_boot': 'images/old-boot.png',
    'sapphire': 'images/saphire.png',
    'mlion_hide': 'images/hide.png',
    'deer_hide': 'images/hide.png',
    'boar_hide': 'images/hide.png',
    'rabbit_hide': 'images/hide.png',
    'coyote_hide': 'images/hide.png',
    'taco_ingredient': 'images/meat.png',
    'mlion_meat': 'images/meat.png',
    'deer_meat': 'images/meat.png',
    'boar_meat': 'images/meat.png',
    'rabbit_meat': 'images/meat.png',
    'coyote_meat': 'images/meat.png',
    'meat': 'images/meat.png',
    'prospecting_kit': 'images/prospecting-kit.png',
    'dynamite': 'images/dynamite.png',
    'hemp_cloth': 'images/hemp_cloth.png',
    'aluminium': 'images/aluminium.png',
    'raw_aluminium': 'images/raw-aluminium.png',
    'gold': 'images/gold.png',
    'raw_gold': 'images/raw-gold.png',
    'processed_gold': 'images/raw-gold.png',
    'ephedrine': 'images/ephedrine.png',
    'weapon_disable_kit': 'images/disable.png',
    'safe_kit': 'images/cracking-kit.png',
    'speedbomb': 'images/bomb.png',
    'weapon_kit': 'images/pliers.png',
    'donut': 'images/donut.png',
    'pdonut': 'images/donut.png',
    'fishing_rod': 'images/fishingrod.png',
    'key_chain': 'images/keychain.png',
    'tea': 'images/iced-tea.png',
    'icetea': 'images/iced-tea.png',
    'repairkit': 'images/industry.png',
    'sandwich': 'images/sandwich.png',
    'kebab': 'images/kebab.png',
    'binoculars': 'images/jumelles.png',
    'taco_kit': 'images/taco_kit.png',
    'repair_parts': 'images/repair-parts.png',
    'lockpick': 'images/lockpick-set.png',
    'carrepairkit': 'images/fixkit.png',
    'heavy_armor': 'images/armor.png',
    'medium_armor': 'images/armor.png',
    'light_armor': 'images/armor.png',
    'police_armor': 'images/armor.png',
    'tidalpod': 'images/tide-pod.png',
    'lotto_ticket': 'images/lottery.png',
    'peach': 'images/peach.png',
    'gauze': 'images/guaze.png',
    'inv_pack_mini_2': 'images/food_pack.png',
    'inv_pack_mini_1': 'images/drink_pack.png',
    'cookie': 'images/cookie.png',
    'coffee': 'images/coffee.png',
    'cigarette': 'images/cigarette-icon.png',
    'personal_phone': 'images/mobile-phone.png',
    'bandage': 'images/bandage.png',
    'don_pereon': 'images/don.png',
    'Vodka': 'images/vodka.png',
    'beer': 'images/beer.png',
    'firstaid': 'images/first-aid-kit.png',
    'radio': 'images/radio.png',
    'hand_radio': 'images/radio.png',
    'duty_radio': 'images/radio.png',
    'hand_gps': 'images/gps.png',
    'duty_gps': 'images/gps.png',
    'pills': 'images/pills.png',
    'hydrocodone': 'images/hydrocodone.png',
    'vicodin': 'images/vicodin.png',
    'morphine': 'images/morphine.png',
    'water': 'images/water.png',
    'water_prison': 'images/water.png',
    'tacos': 'images/taco.png',
    'lemonlimonad': 'images/lemonade.png',
    'bobburger': 'images/burger.png',
    'burger': 'images/burger.png',
    'meth': 'images/meth.png',
    'levacetylmethadol': 'images/lofexidine.png',
    'crack cocaine': 'images/cocaine-baggy.png',
    'cocaine2': 'images/cocaine-baggy.png',
    'weed2': 'images/joint.png',
    'marijuana2': 'images/weed.png',
    'marijuana1': 'images/weed.png',
    'kifflom kush buds': 'images/weed.png',
    'kifflom berry buds': 'images/weed.png',
    'weed': 'images/weed.png',
    'ziptie': 'images/zip-ties_800x.png',
    'suture': 'images/suture.png',
    'lighter': 'images/lighter.png',
    'wire_cutters': 'images/wire_cutters.png',
    'craft_plastic': 'images/craft_plastic.png',
    'evidence_bin': 'images/evidence_bin.png',
    'pd_radio_tool': 'images/pd_radio_tool.png',
    'cru_radio_tool': 'images/pd_radio_tool.png',
    'beer_patriot_free': 'images/beer_patriot.png',
    'lawyer_ticket': 'images/bank_draft.png',
    'blunt1': 'images/backhoods_blunt.png',
    'blunt2': 'images/backhoods_blunt.png',
    'blunt3': 'images/backhoods_blunt.png',
    'blunt4': 'images/backhoods_blunt.png',
    'hunting_bait_7': 'images/animal_feed.png',
    'hunting_bait_8': 'images/animal_feed.png',
    'cash': 'images/cash_item.png',
    'steel_hardened': 'images/steel.png',

    // guns / weapons / hand helds
    'wbody|weapon_knuckle': 'images/brassknuckles.png',
    'wbody|weapon_machete': 'images/machete.png',
    'wbody|weapon_firework': 'images/firework.png',
    'wbody|weapon_pistol': 'images/pistol.png',
    'wbody|weapon_pistol_mk2': 'images/pistol_mk2.png',
    'wbody|weapon_combatpistol': 'images/combat_pistol.png',
    'wbody|weapon_snspistol': 'images/sns.png', // done
    'wbody|weapon_heavypistol': 'images/heavy_pistol.png',
    'wbody|weapon_pistol50': 'images/desert_eagle.png',
    'wbody|weapon_vintagepistol': 'images/vintage_pistol.png',
    'wbody|weapon_pumpshotgun': 'images/shotgun.png',
    'wbody|weapon_pumprevolver': 'images/revolver.png',
    'wbody|weapon_revolver': 'images/revolver.png',
    'wbody|weapon_doubleaction': 'images/double_action.png',
    'wbody|weapon_assaultrifle': 'images/ak_47.png',
    'wbody|weapon_petrolcan': 'images/jerry_can.png',
    'wbody|weapon_stungun': 'images/tazer.png', // done
    'wbody|weapon_smg': 'images/smg.png', // done
    'wbody|weapon_knife': 'images/knife.png',
    'wbody|weapon_switchblade': 'images/switch_blade_body.png',
    'wbody|weapon_battleaxe': 'images/battle_axe_body.png',
    'wbody|weapon_hammer': 'images/hammer.png',
    'wbody|weapon_flashlight': 'images/flashlight.png',
    'wbody|weapon_golfclub': 'images/golfclub_body.png',
    'wbody|weapon_wrench': 'images/wrench_body.png',
    'wbody|weapon_crowbar': 'images/crowbar.png',
    'wbody|weapon_bat': 'images/bat.png',
    'wbody|weapon_nightstick': 'images/nightstick.png',
    'wbody|weapon_flare': 'images/flare.png',
    'wbody|weapon_poolcue': 'images/pool-cue.png',
    'wbody|weapon_flashbang': 'images/flashbang.png',
    'wbody|weapon_fireextinguisher': 'images/fire-extinguisher.png',
    'wbody|weapon_bottle': 'images/broken_bottle.png',
    'wbody|weapon_dagger': 'images/dagger.png',
    'wbody|weapon_shank': 'images/shank.png',
    'wbody|weapon_heavyshotgun': 'images/hunting_rifle.png',
    'wbody|weapon_lightsaber': 'images/lightsaber_green.png',
    'wbody|weapon_specialcarbine': 'images/special_carbine.png',

    'wbody|weapon_carbinerifle': 'images/wep_carbine.png',
    'wbody|weapon_carbinerifle_mk2': 'images/wep_carbine_mk2.png',
    'wbody|weapon_dbshotgun': 'images/wep_db.png',
    'wbody|weapon_gunsen': 'images/wep_gunsen.png',
    'wbody|weapon_microsmg': 'images/wep_micro_smg.png',
    'wbody|weapon_machinepistol': 'images/wep_tech9.png',
    'wbody|weapon_compactrifle': 'images/wep_compact_rifle.png',
    'wbody|weapon_musket': 'images/musket.png',
    'wbody|weapon_molotov': 'images/wep_molotov.png',
    'wbody|weapon_mg': 'images/wep_mg.png',
    'wbody|weapon_smg_mk2': 'images/wep_smg_mk2.png',
    'wbody|weapon_sawnoffshotgun': 'images/wep_sawn_off.png',
    'wbody|weapon_appistol': 'images/appistol.png',
    'wbody|weapon_beanbag': 'images/beanbag.png',
    'wbody|weapon_katana': 'images/weapon_katana.png',

    // ammo
    'wammo|weapon_firework': 'images/ammo_firework.png',
    'wammo|weapon_pistol': 'images/ammo_9mm.png',
    'wammo|weapon_pistol_mk2': 'images/ammo_9mm.png',
    'wammo|weapon_combatpistol': 'images/ammo_.40S&W.png',
    'wammo|weapon_snspistol': 'images/ammo_.380acp.png',
    'wammo|weapon_heavypistol': 'images/ammo_.45acp.png',
    'wammo|weapon_pistol50': 'images/ammo_.50ae.png',
    'wammo|weapon_vintagepistol': 'images/ammo_.45acp.png',
    'wammo|weapon_pumpshotgun': 'images/ammo_20gauge.png',
    'wammo|weapon_revolver': 'images/ammo_44magnum.png',
    'wammo|weapon_pumprevolver': 'images/ammo_.38longcolt.png',
    'wammo|weapon_doubleaction': 'images/ammo_.38longcolt.png',
    'wammo|weapon_assaultrifle': 'images/ammo_7.62x51.png',
    'wammo|weapon_specialcarbine': 'images/ammo_7.62x51.png',
    'wammo|weapon_smg': 'images/ammo_10mm.png',
    'wammo|weapon_carbinerifle': 'images/ammo_7.62x51.png',
    'wammo|weapon_carbinerifle_mk2': 'images/ammo_7.62x51.png',
    'wammo|weapon_dbshotgun': 'images/ammo_20gauge.png',
    'wammo|weapon_gunsen': 'images/ammo_.45acp.png',
    'wammo|weapon_microsmg': 'images/ammo_9mm.png',
    'wammo|weapon_musket': 'images/ammo_7.62x51.png',
    'wammo|weapon_machinepistol': 'images/ammo_9mm.png',
    'wammo|weapon_compactrifle': 'images/ammo_7.62x51.png',
    'wammo|weapon_mg': 'images/ammo_7.62x51.png',
    'wammo|weapon_smg_mk2': 'images/ammo_9mm.png',
    'wammo|weapon_sawnoffshotgun': 'images/ammo_12gauge.png',
    'wammo|weapon_appistol': 'images/ammo_9mm.png',
    'wammo|weapon_heavyshotgun': 'images/ammo_7.62x51.png',
    'wammo|weapon_beanbag': 'images/ammo_beanbag.png',
    'wammo|weapon_stungun': 'images/ammo_stuncartridge.png', // done


    'component_flashlight': 'images/flashlight_mod.png',

    'guitar(green)': 'images/guitar.png',
    'guitar(white)': 'images/guitar.png',
    'guitar(gibson)': 'images/guitar.png',
    'guitar(acoustic)': 'images/guitar.png',

    //GoPostal

    'gopostal_letter': 'images/gopostal_letter.png',
    'gopostal_parcel': 'images/gopostal_parcel.png',
    'gopostal_freight': 'images/gopostal_freight.png',

};

for(var i = 1; i <= 27; i++) {
  images['prison_key_' + i] = 'images/key.png'
}

function mapImage(idname) {
    if (idname) {
        let parsedName = idname.toLowerCase();
        if (idname.includes(':meta')) {
            parsedName = parsedName.substring(0, parsedName.indexOf(':'));
        }
        // console.log('checking for', parsedName)
        if (images[parsedName]) return images[parsedName];

        return `images/${parsedName}.png`
    }

    return 'images/empty.png';

}
function sortItemsByName(items) {
    items.sort(function(a, b) {
        if(a.name < b.name) { return -1; }
        if(a.name > b.name) { return 1; }
        return 0;
    })

    return items
}

function getInventoryItems(serverItems = null) {
    //console.log('---------------------- getInventoryItems')
    let items = [];
    let currentPosition = 0;
    let usedSpots = [];
    let availableSpots = [];
    let fillSpots = [];
    const oldPositions = getInventoryOrder('inventory');
    serverItems = sortItemsByName(serverItems)
    for (const key in oldPositions) {
        // name, amount, weight, description, idname, price
        // save the positions that were saved previously so we can match them to real items
        if (!serverItems.find(i => i.idname === oldPositions[key].name)) {
            delete oldPositions[key];
            saveInventoryOrder('inventory', oldPositions);
        } else {
            usedSpots.push(oldPositions[key].position);
        }
    }

    for (let i = 0; i < 100; i++) {
        if(!usedSpots.includes(i)) {
            availableSpots.push(i);
        }
    }

    for (let i = 0; i < 5; i++) {
        if (!usedSpots.includes(i)) {
            let position = availableSpots.shift();
            // console.log(`position ${i + 1} is  NOT filled`)
            fillSpots.push(position)
            // items[position] = makeEmptyItem(position);
        }
    }

    // Prevent the first 5 slots from being filled when given items
    // for (let i = 0; i < 5; i++) {
    //     if(usedSpots.includes(i)) {
    //         console.log(`position ${i + 1} is filled`)
    //     } else {
    //         usedSpots.push(i)
    //         console.log(`position is not ${i + 1} is filled`)
    //     }
    // }
    for (const key in serverItems) {
        const {name, amount, weight, description, idname, price, meta} = serverItems[key];
        const oldPosition = oldPositions.find(i => i && i.name === idname);
        if (oldPosition) {
            items[key] = {
                position: parseInt(oldPosition.position),
                id: parseInt(oldPosition.position), name: name, amount: amount,
                description: description, weight: parseFloat(weight), price: price,
                idname: idname, image: mapImage(idname), container: 'inventory', meta: meta,
            }
        } else {
            let pos = availableSpots.shift()
            // while(pos < 6) {
            //     currentPosition++
            //     // pos = availableSpots.shift()
            //     // fillSpots.push(pos)
            // }
            // fillSpots.shift() // fixed bug that replaces item with an invalid version
            items[key] = {
                position: parseInt(pos),
                id: parseInt(pos), name: name, amount: amount,
                description: description, weight: parseFloat(weight), price: price,
                idname: idname, image: mapImage(idname), container: 'inventory', meta: meta,
            }
            currentPosition++;
        }
    }

    return fillEmptySpotsAndSortPosition(fillSpots, availableSpots, items);
}

function fillEmptySpotsAndSortPosition(fillSpots, availableSpots, items) {
    for (let i = 0; i < 100; i++) {
        if (! items.find(n => n.position === i)) {
            // console.log(`making empty item for pos ${i}`)
            items.push(makeEmptyItem(i))
        }
    }
    // console.log('filling slots', fillSpots)
    // for (let i = 0; i < 5; i++) {
    //     let position = fillSpots.shift();
    //     items[position] = makeEmptyItem(position);
    // }
    items.sort(function (a, b) {
        if (a.position < b.position) return -1;
        if (a.position > b.position) return 1;
        return 0;
    });
    for (const key in items) {
        if (isNaN(items[key].position)) delete items[key];
    }
    // console.log('copmuted items', items)
    return items;
}

function sortItemsByPosition(items) {
    return items.sort(function (a, b) {
        if (a.position < b.position) return -1;
        if (a.position > b.position) return 1;
        return 0;
    });
}

function getStorageItems(serverItems = null, containerName = null) {
    //console.log('---------------------- getInventoryItems')
    let items = [];
    let currentPosition = 0;
    let usedSpots = [];
    let availableSpots = [];
    let toFillSpots = [];
    const oldPositions = getInventoryOrder(containerName);
    serverItems.sort(function(a, b) {
        if(a.name < b.name) { return -1; }
        if(a.name > b.name) { return 1; }
        return 0;
    })
    for (const key in oldPositions) {
        // name, amount, weight, description, idname, price
        if (!serverItems.find(i => i.idname === oldPositions[key].name)) {
            delete oldPositions[key];
            saveInventoryOrder(containerName, oldPositions);
        } else {
            //console.log(`reserving ${oldPositions[key].name} for spot # ${oldPositions[key].position} `);
            usedSpots.push(oldPositions[key].position);
        }

    }
    for (let i = 0; i < 300; i++) {
        if(! usedSpots.includes(i)) {
            availableSpots.push(i);
        }
    }
    //console.log('availableSpots', availableSpots);
    for (const key in serverItems) {
        const {name, amount, weight, description, idname, price, meta} = serverItems[key];
        const oldPosition = oldPositions.find(i => i && i.name === idname);
        if (oldPosition) {
            //console.log('using stored position', oldPosition);
            items[key] = {
                position: parseInt(oldPosition.position),
                id: parseInt(oldPosition.position), name: name, amount: amount,
                description: description, weight: parseFloat(weight), price: price,
                idname: idname, image: mapImage(idname), container: containerName, meta: meta,
            }
        } else {
            let pos = availableSpots.shift();
            //console.log(`using ${pos} for new item`);
            items[key] = {
                position: parseInt(pos),
                id: parseInt(pos), name: name, amount: amount,
                description: description, weight: parseFloat(weight), price: price,
                idname: idname, image: mapImage(idname), container: containerName, meta: meta,
            }
            currentPosition++;
        }
    }
    // for (const position of toFillSpots) {
    //     const item = makeEmptyItem(position);
    //     items.push(item);
    // }
    for (let i = 0; i < 300; i++) {
        let position = availableSpots.shift();
        const item = makeEmptyItem(position);
        items.push(item);
    }
    items.sort(function(a, b) {
        if(a.position < b.position) { return -1; }
        if(a.position > b.position) { return 1; }
        return 0;
    })
    // console.log(items);
    // console.log('---------------------- (end) getInventoryItems')
    return items;
}

function makeEmptyItem(slot) {
    return {position: parseInt(slot), id: slot, name: 'None', amount: 0, image: ''};
}
/** Send XHR request to get choices **/
function getFakeItemdata(item) {

    if (!item) {
        return false;
    }

    return [];

    return [
        ['Use', '', 1],
        ['Give', 'Give items to the nearest player', 9],
        ['Trash', 'Destroy Items', 10],
    ];

}

function setCharId(id) {
    char_id = id
}

function getCharId(id) {
    return char_id
}

function parseItemHtml(item, on_hotbar) {
    if(!item) console.error('error with item parseItemHtml', item)
    let html = null;
    if (item.name === 'None' || item.amount === 0) {
        html = `
            <div data-position="${item.position}" data-isNone="true" data-slotArea="true" class=" grid-first-five grid-item grid-item-fake" id="item-${item.id}" data-itemName="${item.name}" data-identifier="${item.id}">
                <div class="item-image">
                      <img alt="ghosted" class="ghosted" src="${item.image}"/>
                </div>
                <div class="item-name" id="item-name">
                    <!-- no item name for empty item -->
                </div>
            </div>`;
    } else if(item.price) {
        //console.log('parsing with price')
        html = `
            <div data-position="${item.position}" data-slotArea="true" class="grid-item-real" data-itemName="${item.name}" data-identifier="${item.id}" data-itemCode="${item.idname}" data-slotCode="${item.idname}">
                <div class="item-price">
                    <span class="span-amount">$${item.price}</span>
                    <span class="span-weight">${item.weight}</span>
                </div>
                <div class="item-image" id="item-${item.id}" data-itemName="${item.name}" data-itemCode="${item.idname}" data-identifier="${item.id}">
                        <img src="${item.image}"/>
                </div>
                <div class="item-name">
                    <span class="span-name">${item.name}</span>
                </div>
            </div>`;
    } else if(on_hotbar) {
        let image = ''
        if(item.image) image = `<img class="slot-image" alt="slot" src="${item.image}"/>`
        html = `
            <div data-hotbarPosition="${item.hotbar_position}" class="grid-item-hotbar">
                <div class="item-weight"></div>
                <div class="item-image">
                    ${image}
                </div>
            </div>`;
    } else {
        if(item.name.includes('body')) item.name = item.name.replace(' body', '')
        if(item.name.includes('_')) item.name = item.name.replace('_', ' ')
        html = `
            <div data-position="${item.position}" data-slotArea="true" class="grid-first-five grid-item-real" data-itemName="${item.name}" data-identifier="${item.id}" data-itemCode="${item.idname}" data-slotCode="${item.idname}">
                <div class="item-weight">
                    <span class="span-amount">${item.amount}</span>
                    <span class="span-weight">${item.weight}</span>
                </div>
                <div class="item-image">
                    <img class="slot-image" alt="slot" src="${item.image}"/>
                </div>
                <div class="item-name">
                    <span class="span-name">${item.name}</span>
                </div>
            </div>`;
    }
    return html;
}

function parseOptionHtml(name) {
    return `
    <div class="option-item" id="option-${name}" data-actionName="${name}" data-actionId="${name}">
        ${name}
    </div>`;
}

function playTickSound() {
    let audio = new Audio('audio/pick.mp3');
    audio.volume = 0.03;
    audio.play();
}


function playPickUpSound() {
    let audio = new Audio('audio/pick.mp3');
    audio.volume = 0.10;
    audio.play();
}

function performRequestItemActions(item) {
    // Return with buy/sell options without touching server if item has a price assigned
    if(item.price) {
        fillActions(['Buy', 'Sell'])
        return false;
    }
    fetch(`https://blrp_inventory/requestItemActions`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            item_code: item.idname,
        })
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
    // fillActions(getFakeItemdata(item));
}

function performItemAction(action_name, item_code, amount, meta) {
    fetch(`https://blrp_inventory/performItemAction`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            action_name: action_name.replace(' & Close', ''),
            item_code: item_code,
            item_amount: amount,
            meta: meta,
        })
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
}

function performMoveToStorage(item_code, amount, chest_name, meta) {
    fetch(`https://blrp_inventory/performMoveToStorage`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            item_code: item_code,
            item_amount: amount,
            chest_name: chest_name,
            meta: meta,
        })
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
}

function performMoveToInventory(item_code, amount, chest_name, meta) {
    fetch(`https://blrp_inventory/performMoveToInventory`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            item_code: item_code,
            item_amount: amount,
            chest_name: chest_name,
            meta: meta,
        })
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
}

function setItemSlots(slots) {
    fetch(`https://blrp_inventory/setItemSlots`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(slots)
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
}


function escapeInterface(mode, storage_name) {
    fetch(`https://blrp_inventory/escape`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            mode: mode,
            chest_name: storage_name,
        })
    }).then(resp => resp.json()).then(resp => {
        return resp;
    });
}






function animateColorPercent(selector, percent, time) {
    let percentColors = [
        { pct: 0, color: '#00FF00' },	{ pct: 3, color: '#12FF00' },	{ pct: 6, color: '#24FF00' },
        { pct: 10, color: '#47FF00' },	{ pct: 13, color: '#58FF00' },	{ pct: 16, color: '#6AFF00' },
        { pct: 20, color: '#7CFF00' },	{ pct: 23, color: '#8DFF00' },	{ pct: 26, color: '#9FFF00' },
        { pct: 30, color: '#B0FF00' },	{ pct: 33, color: '#C2FF00' },	{ pct: 36, color: '#D4FF00' },
        { pct: 40, color: '#E5FF00' },	{ pct: 43, color: '#F7FF00' },	{ pct: 46, color: '#FFF600' },
        { pct: 50, color: '#FFE400' },	{ pct: 53, color: '#FFD300' },	{ pct: 56, color: '#FFC100' },
        { pct: 60, color: '#FFAF00' },	{ pct: 63, color: '#FF9E00' },	{ pct: 66, color: '#FF8C00' },
        { pct: 70, color: '#FF7B00' },	{ pct: 73, color: '#FF6900' },	{ pct: 76, color: '#FF5700' },
        { pct: 80, color: '#FF4600' },	{ pct: 83, color: '#FF3400' },	{ pct: 86, color: '#FF2300' },
        { pct: 90, color: '#FF1100' },	{ pct: 93, color: '#FF0000' },	{ pct: 96, color: '#FF0000' },
        { pct: 100, color: '#FF0000' }
    ];
    const closest = percentColors.reduce((a, b) => {
        return Math.abs(b.pct - percent) < Math.abs(a.pct - percent) ? b : a;
    });
    $(selector).css('background-color', closest.color);
    $(selector).animate({width:(200/100)*percent}, time);
}


function getRealPercentage(current_weight, total_weight) {
    let decreaseValue = current_weight - total_weight;
    let percentWeight = (decreaseValue / current_weight) * 100;
    percentWeight = Math.round(percentWeight);
    percentWeight = 100 - percentWeight;
    return percentWeight;
}


function saveInventoryOrder(name, data) {
    if(name === 'market') return
    if(name && name.includes('player_chest_')) return
    let items = [];
    if(name === 'inventory') name = `${char_id}_inventory`
    if(data.length < 1) return
    for (const item of data) {
        if (item && item.name === 'None') continue;
        if (item && item.idname) {
            items.push({
                name: item.idname,
                position: parseInt(item.position)
            });
        } else if (item && item.name) {
            items.push({
                name: item.name,
                position: parseInt(item.position)
            });
        }
    }
    localStorage.setItem(name, JSON.stringify(items));
}

function getInventoryOrder(containerName) {
    if(containerName === 'market') return []
    if(!containerName) return console.error('Must include a container name');
    if(!containerName === undefined) return console.error('Must include a container name');
    if(containerName === 'inventory') containerName = `${char_id}_inventory`
    const data = localStorage.getItem(containerName);
    if (!data) {
        return [];
    }
    return JSON.parse(data);
}

color_convert = function() {
    var pub = {}, canvas, context;
    canvas = document.createElement('canvas');
    canvas.height = 1;
    canvas.width = 1;
    context = canvas.getContext('2d');

    function byte_to_hex(byte) {
        // Turns a number (0-255) into a 2-character hex number (00-ff)
        return ('0'+byte.toString(16)).slice(-2);
    }

    pub.to_rgba_array = function(color) {
        /**
         * Turns any valid canvas fillStyle into a 4-element Uint8ClampedArray with bytes
         * for R, G, B, and A. Invalid styles will return [0, 0, 0, 0]. Examples:
         * color_convert.to_rgb_array('red')  # [255, 0, 0, 255]
         * color_convert.to_rgb_array('#ff0000')  # [255, 0, 0, 255]
         * color_convert.to_rgb_array('garbagey')  # [0, 0, 0, 0]
         */
        // Setting an invalid fillStyle leaves this unchanged
        context.fillStyle = 'rgba(0, 0, 0, 0)';
        // We're reusing the canvas, so fill it with something predictable
        context.clearRect(0, 0, 1, 1);
        context.fillStyle = color;
        context.fillRect(0, 0, 1, 1);
        return context.getImageData(0, 0, 1, 1).data;
    }

    pub.to_rgba = function(color) {
        /**
         * Turns any valid canvas fill style into an rgba() string. Returns
         * 'rgba(0,0,0,0)' for invalid colors. Examples:
         * color_convert.to_rgba('red')  # 'rgba(255,0,0,1)'
         * color_convert.to_rgba('#f00')  # 'rgba(255,0,0,1)'
         * color_convert.to_rgba('garbagey')  # 'rgba(0,0,0,0)'
         * color_convert.to_rgba(some_pattern)  # Depends on the pattern
         *
         * @param color  A string, pattern, or gradient
         * @return  A valid rgba CSS color string
         */
        var a = pub.to_rgba_array(color);
        return 'rgba('+a[0]+','+a[1]+','+a[2]+','+(a[3]/255)+')';
    }

    pub.to_hex = function(color) {
        /**
         * Turns any valid canvas fill style into a hex triple. Returns
         * '#000000' for invalid colors. Examples:
         * color_convert.to_hex('red')  # '#ff0000'
         * color_convert.to_hex('rgba(255,0,0,1)')  # '#ff0000'
         * color_convert.to_hex('garbagey')  # '#000000'
         * color_convert.to_hex(some_pattern)  # Depends on the pattern
         *
         * @param color  A string, pattern, or gradient
         * @return  A valid rgba CSS color string
         */
        var a = pub.to_rgba_array(color);
        // Sigh, you can't map() typed arrays
        var hex = [0,1,2].map(function(i) { return byte_to_hex(a[i]) }).join('');
        return '#'+hex;
    }

    return pub;
}();
