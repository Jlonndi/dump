local instance = {}
local currentMs = 0
local triedToHit = false
local isActiveGame = false
local isSkillCheck = false

function resetGameState()
    instance = {}
    currentMs = 0
    triedToHit = false
    isActiveGame = false
    isSkillCheck = false
end

-- @param action object
-- @param finish callback for when finished

function initGame(action)
    instance = action
    isActiveGame = true
    configureSkillCheck()
    if triedToHit then return false end
    local hitRange = instance.duration / instance.allow_skill_forward
    local percToSub = (instance.duration * .30)
    local insertAt = math.random(150, instance.duration - percToSub)
    local first_point = insertAt
    local second_point = insertAt + hitRange
    SendNUIMessage({
        action = "mythic_set_game",
        isSkillCheck = isSkillCheck,
        duration = instance.duration,
        skill_check = instance.skill_check,
        first_point = first_point,
        second_point = second_point,
    })
end

function configureSkillCheck()
    if not instance.skill_check then
        return
    end

    isSkillCheck = true

    if not instance.difficulty then
        instance.difficulty = 'easy'
    end

    if instance.difficulty == 'easy' then
        instance.duration = 500
        instance.allow_skill_forward = 10
    elseif instance.difficulty == 'medium' then
        instance.duration = 500
        instance.allow_skill_forward = 30
    end
end


function tryGameHit()
    if triedToHit then return false end
    --if triedToHit then return false end
    if isActiveGame then
        triedToHit = true
        SendNUIMessage({
            action = "mythic_try_game_hit",
        })
    end
end