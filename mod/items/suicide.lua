--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
local ____playerdata = require("playerdata")
local modPlayerData = ____playerdata.modPlayerData
local PlayerSeed = ____playerdata.PlayerSeed
function ____exports.suicide(self, _item, _rng, player)
    if (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH) and (not modPlayerData[PlayerSeed(nil, player)].lost) then
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
        body:GetSprite():Play("SarahDeath", true)
        player:SetPocketActiveItem(constants.ModItemTypes.REVIVE)
        print(body.Position.X, body.Position.Y)
    elseif (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH) and modPlayerData[PlayerSeed(nil, player)].lost then
        local body = false
        local entities = Isaac.GetRoomEntities()
        for ____, entity in ipairs(entities) do
            if (entity.Type == EntityType.ENTITY_EFFECT) and (entity.Variant == 200) then
                body = true
                player.Position = entity.Position
                player.Visible = false
                entity:GetSprite():Play("Revive", true)
                entity:GetData().player = player
            end
        end
        if body then
            player:SetPocketActiveItem(constants.ModItemTypes.SUICIDE)
            modPlayerData[PlayerSeed(nil, player)].lost = false
            player:AddCacheFlags(CacheFlag.CACHE_ALL)
            player:EvaluateItems()
        end
    end
end
function ____exports.bodyAnim(self, effect)
    if effect:GetSprite():IsFinished("Revive") then
        local player = effect:GetData().player
        player.Visible = true
        effect:Remove()
    end
end
return ____exports
