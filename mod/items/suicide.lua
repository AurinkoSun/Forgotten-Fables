--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
local ____playerdata = require("playerdata")
local modPlayerData = ____playerdata.modPlayerData
local PlayerSeed = ____playerdata.PlayerSeed
function ____exports.suicide(self, _item, _rng, player)
    local returner = false
    if (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH) and (modPlayerData[PlayerSeed(nil, player)].lost ~= true) then
        print("tsarah killed herself")
        player:AddBrokenHearts(1)
        modPlayerData[PlayerSeed(nil, player)].lost = true
        player:AddCacheFlags(CacheFlag.CACHE_ALL)
        player:EvaluateItems()
        local body = Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            200,
            0,
            player.Position,
            Vector(0, 0),
            player
        )
        print(body.Position.X, body.Position.Y)
        returner = true
    elseif (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH) and modPlayerData[PlayerSeed(nil, player)].lost then
        local body = false
        local entities = Isaac.GetRoomEntities()
        for ____, entity in ipairs(entities) do
            if (entity.Type == EntityType.ENTITY_EFFECT) and (entity.Variant == 200) then
                body = true
                player.Position = entity.Position
                entity:Remove()
            end
        end
        if body then
            modPlayerData[PlayerSeed(nil, player)].lost = false
            player:AddCacheFlags(CacheFlag.CACHE_ALL)
            player:EvaluateItems()
            returner = true
        end
    end
    return returner
end
return ____exports
