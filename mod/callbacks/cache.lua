--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.evalCache(self, _modPlayerData, player, flags)
    if flags == CacheFlag.CACHE_SHOTSPEED then
        if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
            player.ShotSpeed = player.ShotSpeed - 0.15
        end
    end
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            player.MaxFireDelay = player.MaxFireDelay * 3
        end
        if player:HasCollectible(ModItemTypes.FAT_FETUS) then
            if (not player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)) and (not player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)) then
                player.MaxFireDelay = player.MaxFireDelay * 15
            end
        end
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(ModItemTypes.FAT_FETUS) and player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
            player.Damage = player.Damage * 2
        end
        if player:HasCollectible(ModItemTypes.BBGHOST_SHOT) or player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            player.Damage = player.Damage * 0.8
        end
    end
    if flags == CacheFlag.CACHE_LUCK then
    end
    if flags == CacheFlag.CACHE_SPEED then
    end
    if flags == CacheFlag.CACHE_FLYING then
        if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
            player.CanFly = true
        end
    end
    if flags == CacheFlag.CACHE_RANGE then
    end
end
return ____exports
