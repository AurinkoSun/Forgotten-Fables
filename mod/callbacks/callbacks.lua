--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____MC_ENTITY_TAKE_DMG = require("callbacks.MC_ENTITY_TAKE_DMG")
local entityTakeDamage = ____MC_ENTITY_TAKE_DMG.entityTakeDamage
local ____MC_EVALUATE_CACHE = require("callbacks.MC_EVALUATE_CACHE")
local evalCache = ____MC_EVALUATE_CACHE.evalCache
local ____MC_POST_BOMB_INIT = require("callbacks.MC_POST_BOMB_INIT")
local bombInit = ____MC_POST_BOMB_INIT.bombInit
local ____MC_POST_BOMB_UPDATE = require("callbacks.MC_POST_BOMB_UPDATE")
local bombUpdate = ____MC_POST_BOMB_UPDATE.bombUpdate
local ____MC_POST_FIRE_TEAR = require("callbacks.MC_POST_FIRE_TEAR")
local postFireTear = ____MC_POST_FIRE_TEAR.postFireTear
local ____MC_POST_NEW_ROOM = require("callbacks.MC_POST_NEW_ROOM")
local postNewRoom = ____MC_POST_NEW_ROOM.postNewRoom
local ____MC_POST_NPC_RENDER = require("callbacks.MC_POST_NPC_RENDER")
local npcRender = ____MC_POST_NPC_RENDER.npcRender
local ____MC_POST_PICKUP_UPDATE = require("callbacks.MC_POST_PICKUP_UPDATE")
local postPickupUpdate = ____MC_POST_PICKUP_UPDATE.postPickupUpdate
local ____MC_POST_PLAYER_INIT = require("callbacks.MC_POST_PLAYER_INIT")
local postPlayerInit = ____MC_POST_PLAYER_INIT.postPlayerInit
local ____MC_POST_PLAYER_UPDATE = require("callbacks.MC_POST_PLAYER_UPDATE")
local playerUpdate = ____MC_POST_PLAYER_UPDATE.playerUpdate
local ____MC_POST_PROJECTILE_INIT = require("callbacks.MC_POST_PROJECTILE_INIT")
local projectileInit = ____MC_POST_PROJECTILE_INIT.projectileInit
local ____MC_POST_UPDATE = require("callbacks.MC_POST_UPDATE")
local postUpdate = ____MC_POST_UPDATE.postUpdate
local ____MC_PRE_GAME_EXIT = require("callbacks.MC_PRE_GAME_EXIT")
local preGameExit = ____MC_PRE_GAME_EXIT.preGameExit
local ____MC_PRE_SPAWN_CLEAR_AWARD = require("callbacks.MC_PRE_SPAWN_CLEAR_AWARD")
local clearaward = ____MC_PRE_SPAWN_CLEAR_AWARD.clearaward
local ____MC_PRE_TEAR_COLLISION = require("callbacks.MC_PRE_TEAR_COLLISION")
local preTearCollision = ____MC_PRE_TEAR_COLLISION.preTearCollision
local ____MC_USE_ITEM = require("callbacks.MC_USE_ITEM")
local useItem = ____MC_USE_ITEM.useItem
local ____MC_USE_PILL = require("callbacks.MC_USE_PILL")
local usePill = ____MC_USE_PILL.usePill
____exports.playerUpdate = playerUpdate
____exports.useItem = useItem
____exports.entityTakeDamage = entityTakeDamage
____exports.evalCache = evalCache
____exports.bombInit = bombInit
____exports.postFireTear = postFireTear
____exports.postNewRoom = postNewRoom
____exports.npcRender = npcRender
____exports.postPickupUpdate = postPickupUpdate
____exports.postPlayerInit = postPlayerInit
____exports.projectileInit = projectileInit
____exports.preGameExit = preGameExit
____exports.preTearCollision = preTearCollision
____exports.usePill = usePill
____exports.bombUpdate = bombUpdate
____exports.postUpdate = postUpdate
____exports.clearaward = clearaward
return ____exports
