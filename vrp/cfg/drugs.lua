
local cfg = {}

-- [Seed] = {6 or more Sucesses, 5 or more Sucesses, 3 or more Sucesses}
-- If they fail under 3 they get nothing.


cfg.weedRewards = {
    ['medical_seed'] = {'medical_bud', 'medical_bud', 'medical_seed'}, --MedBud, MedBud, MedSeed
    ['cannabis_seed'] = {'marijuana2', 'marijuana', 'cannabis_seed'}, --Serpickle, Kifflom, Seed
    ['bestbuds_ficusseed'] = {'bestbuds_ficusbud', 'bestbuds_ficusbud', 'bestbuds_ficusseed'}, --FicusBud, FicusBud, FicusSeed
}

cfg.weedRewardMesssage = {
    ['marijuana'] = "Not bad, %d Kifflom Kush Buds received", --Kifflom
    ['marijuana2'] = "Perfect harvest! You got %d Serpickle Berry Buds", --Serpickle
    ['cannabis_seed'] = "Let's try this again, you recovered a seed", 
    ['medical_bud'] = "You got %d Medical Buds", 
    ['medical_seed'] = "Let's try this again, you recovered a seed",
    ['bestbuds_ficusseed'] = "Let's try this again, you recovered a seed",
    ['bestbuds_ficusbud'] = "You got %d Ficus Buds",
}

return cfg