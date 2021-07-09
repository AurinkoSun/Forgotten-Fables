--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
local ____cache = require("callbacks.cache")
local evalCache = ____cache.evalCache
local ____costumes = require("callbacks.costumes")
local costumes = ____costumes.costumes
local ____pocketItems = require("callbacks.pocketItems")
local pocketItems = ____pocketItems.pocketItems
local constants = require("constants")
local ____blooddrive = require("items.blooddrive")
local alabasterHearts = ____blooddrive.alabasterHearts
local bloodDrive = ____blooddrive.bloodDrive
local ____fatfetus = require("items.fatfetus")
local fatFetusTears = ____fatfetus.fatFetusTears
local gigaBombReplace = ____fatfetus.gigaBombReplace
local gigaInit = ____fatfetus.gigaInit
local gigaUpdate = ____fatfetus.gigaUpdate
local glitterdrops = ____fatfetus.glitterdrops
local rocks = ____fatfetus.rocks
local ____ghostshot = require("items.ghostshot")
local ghostShot = ____ghostshot.ghostShot
local ____playerdata = require("playerdata")
local PlayerData = ____playerdata.PlayerData
local modPlayerData = {
    data = {
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0)
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
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    function()
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        costumes(nil, modPlayerData)
        pocketItems(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_ITEM,
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
    function(____, item, _rng, player)
        local ____switch9 = item
        if ____switch9 == constants.ModItemTypes.BLOODDRIVE then
            goto ____switch9_case_0
        end
        goto ____switch9_case_default
        ::____switch9_case_0::
        do
            do
                bloodDrive(nil, player, modPlayerData)
                goto ____switch9_end
            end
        end
        ::____switch9_case_default::
        do
            do
                goto ____switch9_end
            end
        end
        ::____switch9_end::
        costumes(nil, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    function(____, entity, amt, flags, src)
        if entity.Type == EntityType.ENTITY_PLAYER then
        end
        glitterdrops(nil, entity, amt, flags, src)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    function(____, pickup)
        alabasterHearts(nil, pickup)
    end,
    10
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_FIRE_TEAR,
    function(____, tear)
        fatFetusTears(nil, tear)
        ghostShot(nil, tear)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaBombReplace, BombVariant.BOMB_GIGA)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, rocks, ProjectileVariant.PROJECTILE_ROCK)
forgottenFables:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, glitterdrops)
return ____exports
