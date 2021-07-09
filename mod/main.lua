--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
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
local revive = ____suicide.revive
local suicide = ____suicide.suicide
local ____playerdata = require("playerdata")
local GetPlayerId = ____playerdata.GetPlayerId
local PlayerData = ____playerdata.PlayerData
local modPlayerData = {
    data = {
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0),
        __TS__New(PlayerData, nil, false, 0)
    }
}
local forgottenFables = RegisterMod("Forgotten Fables", 1)
forgottenFables:AddCallback(
    ModCallbacks.MC_PRE_GAME_EXIT,
    function()
        forgottenFables:SaveData(
            json.encode(modPlayerData)
        )
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    function(____, player, flag)
        evalCache(nil, modPlayerData, player, flag)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, newFloor)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    function(____, player)
        costumes(nil, modPlayerData)
        modPlayerData.data[GetPlayerId(nil, player) + 1].player = player
        modPlayerData.data[GetPlayerId(nil, player) + 1]:RegenerateID()
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_ITEM,
    function()
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_CARD,
    function()
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_PILL,
    function()
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_ITEM,
    function(____, _item, _rng, player)
        suicide(nil, modPlayerData, player)
    end,
    constants.ModItemTypes.SUICIDE
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_ITEM,
    function(____, _item, _rng, player)
        revive(nil, modPlayerData, player)
    end,
    constants.ModItemTypes.REVIVE
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, bodyAnim, constants.ModEffectVariants.TSARAHBODY)
forgottenFables:AddCallback(
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    function(____, entity, amt, flags)
        sarahLostKill(nil, modPlayerData, entity, amt, flags)
    end,
    EntityType.ENTITY_PLAYER
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    function(____, pickup)
        razor(nil, modPlayerData, pickup)
    end,
    10
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, fatFetusTears)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaBombReplace, BombVariant.BOMB_GIGA)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, rocks, ProjectileVariant.PROJECTILE_ROCK)
forgottenFables:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, glitterdrops)
return ____exports
