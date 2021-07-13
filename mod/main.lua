--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local callbacks = require("callbacks.callbacks")
local ____MC_POST_TEAR_UPDATE = require("callbacks.MC_POST_TEAR_UPDATE")
local tearUpdate = ____MC_POST_TEAR_UPDATE.tearUpdate
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
        callbacks:preGameExit(forgottenFables, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, tearUpdate)
forgottenFables:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    function(____, player, flag)
        callbacks:evalCache(modPlayerData, player, flag)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, callbacks.preTearCollision)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    function(____, player)
        callbacks:postPlayerInit(player, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        callbacks:postNewRoom(modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_PILL,
    function(____, pillEffect, player, flags)
        callbacks:usePill(pillEffect, player, flags, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, callbacks.npcRender)
forgottenFables:AddCallback(
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    function(____, entity, amt, flags, src)
        callbacks:entityTakeDamage(entity, amt, flags, src, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    function(____, pickup)
        callbacks:postPickupUpdate(pickup, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, callbacks.postFireTear)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, callbacks.bombUpdate)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, callbacks.bombInit)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, callbacks.projectileInit)
return ____exports
