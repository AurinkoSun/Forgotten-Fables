
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file)
    if ____moduleCache[file] then
        return ____moduleCache[file]
    end
    if ____modules[file] then
        ____moduleCache[file] = ____modules[file]()
        return ____moduleCache[file]
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["main"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
FatFetus = RegisterMod("FatFetus", 1)
game = Game()
fatFetusID = Isaac.GetItemIdByName("Fat Fetus")
function evalCache(self, player, flags)
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(fatFetusID) then
            player.MaxFireDelay = player.MaxFireDelay * 10
        end
    end
end
FatFetus:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, evalCache)
function onFireTear(self, tear)
    local bomb
    if tear.SpawnerEntity == nil then
        return
    end
    local player = tear.SpawnerEntity:ToPlayer()
    if player == nil then
        return
    end
    if player:HasCollectible(fatFetusID) then
        local dmg = player.Damage * (300 / 3.5)
        bomb = Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 17, 0, tear.Position, tear.Velocity, player):ToBomb()
        tear:Remove()
        if bomb ~= nil then
            bomb.IsFetus = true
            bomb.ExplosionDamage = dmg
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                bomb:AddTearFlags(TearFlags.TEAR_BRIMSTONE_BOMB)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY) then
                bomb:AddTearFlags(TearFlags.TEAR_CROSS_BOMB)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_GHOST_BOMB)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_BLOOD_BOMB)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
            end
        end
    end
end
FatFetus:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, onFireTear)
end,
}
return require("main")
