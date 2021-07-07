--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____cache = require("callbacks.cache")
local evalCache = ____cache.evalCache
local ____costumes = require("callbacks.costumes")
local costumes = ____costumes.costumes
local ____floorinit = require("callbacks.floorinit")
local newFloor = ____floorinit.newFloor
local ____razors = require("callbacks.razors")
local razor = ____razors.razor
local ____sarahlostdamage = require("callbacks.sarahlostdamage")
local sarahLostKill = ____sarahlostdamage.sarahLostKill
local ____saveload = require("callbacks.saveload")
local loadData = ____saveload.loadData
local saveData = ____saveload.saveData
local constants = require("constants")
local ____fatfetus = require("items.fatfetus")
local fatFetusTears = ____fatfetus.fatFetusTears
local gigaBombReplace = ____fatfetus.gigaBombReplace
local gigaInit = ____fatfetus.gigaInit
local gigaUpdate = ____fatfetus.gigaUpdate
local glitterdrops = ____fatfetus.glitterdrops
local rocks = ____fatfetus.rocks
local ____suicide = require("items.suicide")
local bodyAnim = ____suicide.bodyAnim
local suicide = ____suicide.suicide
local forgottenFables = RegisterMod("Forgotten Fables", 1)
forgottenFables:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, evalCache)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        saveData(nil, forgottenFables)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    function(____, player)
        loadData(nil, forgottenFables, player)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, newFloor)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, costumes)
forgottenFables:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, costumes)
forgottenFables:AddCallback(ModCallbacks.MC_USE_ITEM, costumes)
forgottenFables:AddCallback(ModCallbacks.MC_USE_CARD, costumes)
forgottenFables:AddCallback(ModCallbacks.MC_USE_PILL, costumes)
forgottenFables:AddCallback(ModCallbacks.MC_USE_ITEM, suicide, constants.ModItemTypes.SUICIDE)
forgottenFables:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, bodyAnim, constants.ModEffectVariants.TSARAHBODY)
forgottenFables:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, sarahLostKill, EntityType.ENTITY_PLAYER)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, razor, 10)
forgottenFables:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, fatFetusTears)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaBombReplace, BombVariant.BOMB_GIGA)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, rocks, ProjectileVariant.PROJECTILE_ROCK)
forgottenFables:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, glitterdrops)
return ____exports
