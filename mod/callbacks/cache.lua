--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ModPlayerTypes = ____constants.ModPlayerTypes
local ____playerdata = require("playerdata")
local modPlayerData = ____playerdata.modPlayerData
local PlayerSeed = ____playerdata.PlayerSeed
function ____exports.evalCache(self, player, flags)
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(ModItemTypes.FAT_FETUS) then
            if (player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false) and (player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) == false) then
                player.MaxFireDelay = player.MaxFireDelay * 15
            end
        end
        if player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH then
            if modPlayerData[PlayerSeed(nil, player)].lost then
                player.MaxFireDelay = player.MaxFireDelay - 3
            else
                player.MaxFireDelay = player.MaxFireDelay - 1
            end
        end
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH then
            player.Damage = player.Damage + (0.5 * modPlayerData[PlayerSeed(nil, player)].razors)
        end
        if player:HasCollectible(ModItemTypes.FAT_FETUS) and player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
            player.Damage = player.Damage * 2
        end
        if player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH then
            player.Damage = player.Damage - 1.5
        end
    end
    if flags == CacheFlag.CACHE_LUCK then
        if (player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH) and modPlayerData[PlayerSeed(nil, player)].lost then
            player.Luck = player.Luck - 2
        end
    end
    if flags == CacheFlag.CACHE_SPEED then
        if player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH then
            if modPlayerData[PlayerSeed(nil, player)].lost then
                player.MoveSpeed = player.MoveSpeed - 0.1
            else
                player.MoveSpeed = player.MoveSpeed + 0.2
            end
        end
    end
    if flags == CacheFlag.CACHE_FLYING then
        if (player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH) and modPlayerData[PlayerSeed(nil, player)].lost then
            player.CanFly = true
        end
    end
    if flags == CacheFlag.CACHE_RANGE then
        if player:GetPlayerType() == ModPlayerTypes.TAINTED_SARAH then
            player.TearHeight = player.TearHeight - 1.5
        end
    end
end
return ____exports
