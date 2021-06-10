
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
            player.MaxFireDelay = player.MaxFireDelay * 15
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                player.Damage = player.Damage * 1.5
            end
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
        bomb = Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, player.Position, tear.Velocity, player):ToBomb()
        if bomb == nil then
            return
        end
        bomb:GetData().colupdated = false
        tear:Remove()
        bomb.ExplosionDamage = dmg
    end
end
FatFetus:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, onFireTear)
BombTypes = BombTypes or ({})
BombTypes.Normal = 0
BombTypes[BombTypes.Normal] = "Normal"
BombTypes.Brim = 1
BombTypes[BombTypes.Brim] = "Brim"
BombTypes.Sticky = 2
BombTypes[BombTypes.Sticky] = "Sticky"
BombTypes.Cross = 3
BombTypes[BombTypes.Cross] = "Cross"
BombTypes.Blood = 4
BombTypes[BombTypes.Blood] = "Blood"
BombTypes.Mega = 5
BombTypes[BombTypes.Mega] = "Mega"
BombTypes.Glitter = 6
BombTypes[BombTypes.Glitter] = "Glitter"
BombTypes.Random = 7
BombTypes[BombTypes.Random] = "Random"
BombTypes.Butt = 8
BombTypes[BombTypes.Butt] = "Butt"
BombTypes.Rock = 9
BombTypes[BombTypes.Rock] = "Rock"
BombTypes.Scatter = 10
BombTypes[BombTypes.Scatter] = "Scatter"
BombTypes.Ghost = 11
BombTypes[BombTypes.Ghost] = "Ghost"
BombTypes.Gold = 12
BombTypes[BombTypes.Gold] = "Gold"
BombTypes.Sad = 13
BombTypes[BombTypes.Sad] = "Sad"
BombTypes.Homing = 14
BombTypes[BombTypes.Homing] = "Homing"
BombTypes.Poison = 15
BombTypes[BombTypes.Poison] = "Poison"
BombTypes.Fire = 16
BombTypes[BombTypes.Fire] = "Fire"
function fetusGigaUpdate(self, bomb)
    bomb.CollisionDamage = 0
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            if bomb:GetData().colupdated == false then
                bomb:SetExplosionCountdown(100)
                if (player:HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) or player:HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART)) or player:HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD) then
                    bomb:AddTearFlags(TearFlags.TEAR_HOMING)
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) or player:HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK) then
                    bomb.SpriteScale:__div(2)
                    bomb:GetSprite():Reload()
                    bomb.RadiusMultiplier = 0.5
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                    bomb.SpriteScale:__mul(1.5)
                    bomb.RadiusMultiplier = bomb.RadiusMultiplier * 2
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                    bomb:GetData().colupdated = true
                    print("megabomb")
                    bomb:GetSprite():Play("megapulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                    bomb:GetData().colupdated = true
                    bomb:GetSprite():Play("brimpulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS) then
                    bomb:GetData().colupdated = true
                    bomb:AddTearFlags(TearFlags.TEAR_STICKY)
                    bomb:GetSprite():Play("stickypulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                    bomb:GetData().colupdated = true
                    bomb:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
                    bomb:GetSprite():Play("buttpulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                    bomb:GetData().colupdated = true
                    bomb:GetSprite():Play("bloodpulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) then
                    bomb:GetData().colupdated = true
                    bomb:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
                elseif player:HasCollectible(
                    CollectibleType.COLLECTIBLE_HOT_BOMBS or player:HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
                ) then
                    bomb:GetData().colupdated = true
                    bomb.CollisionDamage = 32
                    bomb:AddTearFlags(TearFlags.TEAR_BURN)
                    bomb:GetSprite():Play("flamepulse", true)
                elseif player:HasGoldenBomb() then
                    bomb:GetData().colupdated = true
                    bomb:GetSprite():Play("goldenpulse", true)
                elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                    bomb:GetData().colupdated = true
                    bomb:GetSprite():Play("poisonpulse", true)
                else
                    bomb:GetData().colupdated = true
                    bomb:GetSprite():Play("Pulse", true)
                end
            end
            if (((((((bomb:GetSprite():IsFinished("Pulse") or bomb:GetSprite():IsFinished("brimpulse")) or bomb:GetSprite():IsFinished("stickypulse")) or bomb:GetSprite():IsFinished("goldenpulse")) or bomb:GetSprite():IsFinished("flamepulse")) or bomb:GetSprite():IsFinished("bloodpulse")) or bomb:GetSprite():IsFinished("buttpulse")) or bomb:GetSprite():IsFinished("poisonpulse")) or bomb:GetSprite():IsFinished("megapulse") then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        0,
                        15,
                        Vector(0, 0),
                        bomb
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        90,
                        15,
                        Vector(0, 0),
                        bomb
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        180,
                        15,
                        Vector(0, 0),
                        bomb
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        270,
                        15,
                        Vector(0, 0),
                        bomb
                    )
                end
                local explody = Isaac.Spawn(
                    4,
                    17,
                    0,
                    bomb.Position,
                    Vector(0, 0),
                    player
                ):ToBomb()
                if explody == nil then
                    return
                end
                explody.Visible = false
                if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                    explody.RadiusMultiplier = explody.RadiusMultiplier * 2
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) or player:HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK) then
                    explody.RadiusMultiplier = explody.RadiusMultiplier * 0.5
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_STICKY)
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
                end
                explody.ExplosionDamage = player.Damage * (300 / 3.5)
                explody:SetExplosionCountdown(0)
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                    local creep = Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.PLAYER_CREEP_RED,
                        0,
                        bomb.Position,
                        Vector(0, 0),
                        player
                    ):ToEffect()
                    if creep == nil then
                        print("creep spawn failed")
                        return
                    end
                    creep:SetDamageSource(EntityType.ENTITY_PLAYER)
                    creep.Scale = creep.Scale * 10
                    creep.LifeSpan = creep.LifeSpan * 1000
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                    explody:AddTearFlags(TearFlags.TEAR_POISON)
                end
                bomb:GetSprite():Play("Explode", false)
            end
            if bomb:GetSprite():IsFinished("Explode") then
                bomb:Remove()
            end
        else
            if bomb:GetData().colupdated == false then
                bomb:SetExplosionCountdown(87)
                bomb.ExplosionDamage = 300
                bomb:GetData().colupdated = true
                bomb:GetData().syntype = BombTypes.Normal
                bomb:GetSprite():Play("Pulse", true)
            end
            if bomb:GetSprite():IsFinished("Pulse") then
                bomb:GetSprite():Play("Explode", false)
            end
        end
    end
end
FatFetus:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, fetusGigaUpdate, 21)
end,
}
return require("main")
