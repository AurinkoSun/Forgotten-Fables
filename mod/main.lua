
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
talesOfGuppy = RegisterMod("Tales of Guppy", 1)
game = Game()
fatFetusID = Isaac.GetItemIdByName("Fat Fetus")
function evalCache(self, player, flags)
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(fatFetusID) then
            if (player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false) and (player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) == false) then
                player.MaxFireDelay = player.MaxFireDelay * 15
            end
        end
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(fatFetusID) and player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
            player.Damage = player.Damage * 2
        end
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, evalCache)
function fatFetusTears(self, tear)
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
        tear:Remove()
        bomb.ExplosionDamage = dmg
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, fatFetusTears)
function gigaUpdate(self, bomb)
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            if ((((((((((((bomb:GetSprite():IsFinished("Pulse") or bomb:GetSprite():IsFinished("brimpulse")) or bomb:GetSprite():IsFinished("stickypulse")) or bomb:GetSprite():IsFinished("goldenpulse")) or bomb:GetSprite():IsFinished("flamepulse")) or bomb:GetSprite():IsFinished("bloodpulse")) or bomb:GetSprite():IsFinished("buttpulse")) or bomb:GetSprite():IsFinished("poisonpulse")) or bomb:GetSprite():IsFinished("megapulse")) or bomb:GetSprite():IsFinished("scatterpulse")) or bomb:GetSprite():IsFinished("ghostpulse")) or bomb:GetSprite():IsFinished("sadpulse")) or bomb:GetSprite():IsFinished("homingpulse")) or bomb:GetSprite():IsFinished("goldhomingpulse") then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        0,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        90,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        180,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        270,
                        15,
                        Vector(0, 0),
                        player
                    )
                end
                local explody = Isaac.Spawn(
                    4,
                    17,
                    0,
                    bomb.Position,
                    Vector(0, 0),
                    bomb
                ):ToBomb()
                if explody == nil then
                    return
                end
                explody.Visible = false
                if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) or player:HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY) then
                    explody:AddTearFlags(TearFlags.TEAR_CROSS_BOMB)
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
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
                end
                explody.ExplosionDamage = player.Damage * (300 / 3.5)
                explody:GetData().explody = 3
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
                    local cloud = Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.SMOKE_CLOUD,
                        0,
                        bomb.Position,
                        Vector(0, 0),
                        player
                    ):ToEffect()
                    if cloud == nil then
                        return
                    end
                    cloud.Scale = cloud.Scale * 4
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) then
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(-3, 0),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(0, -3),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(0, 3),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(3, 0),
                        player
                    )
                end
                bomb:GetSprite():Play("Explode", false)
            end
            if bomb:GetSprite():IsFinished("Explode") then
                bomb:Remove()
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS) then
                    local sad
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(10, 0),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(-10, 0),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(0, 10),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(0, -10),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            10 / math.sqrt(2),
                            10 / math.sqrt(2)
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            0 - (10 / math.sqrt(2)),
                            10 / math.sqrt(2)
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            10 / math.sqrt(2),
                            0 - (10 / math.sqrt(2))
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            0 - (10 / math.sqrt(2)),
                            0 - (10 / math.sqrt(2))
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                end
            end
        end
    end
end
function gigaBombReplace(self, bomb)
    if (bomb.SpawnerEntity ~= nil) and (bomb.SpawnerEntity:ToPlayer() ~= nil) then
        Isaac.Spawn(
            EntityType.ENTITY_BOMBDROP,
            21,
            0,
            bomb.Position,
            bomb.Velocity,
            bomb.SpawnerEntity:ToPlayer()
        )
        bomb:Remove()
    end
end
function gigaInit(self, bomb)
    bomb.CollisionDamage = 0
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
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
                bomb:GetSprite():Play("megapulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                bomb:GetSprite():Play("brimpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_STICKY)
                bomb:GetSprite():Play("stickypulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
                bomb:GetSprite():Play("buttpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                bomb:GetSprite():Play("bloodpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
                bomb:GetSprite():Play("scatterpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_GHOST_BOMB)
                bomb:GetSprite():Play("ghostpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS) then
                bomb:GetSprite():Play("sadpulse", true)
            elseif player:HasCollectible(
                CollectibleType.COLLECTIBLE_HOT_BOMBS or player:HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
            ) then
                bomb.CollisionDamage = 32
                bomb:AddTearFlags(TearFlags.TEAR_BURN)
                bomb:GetSprite():Play("flamepulse", true)
            elseif player:HasGoldenBomb() then
                bomb:GetSprite():Play("goldenpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                bomb:GetSprite():Play("poisonpulse", true)
            else
                bomb:GetSprite():Play("Pulse", true)
            end
        else
            bomb:SetExplosionCountdown(87)
            bomb.ExplosionDamage = 300
            bomb:GetSprite():Play("Pulse", true)
        end
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaBombReplace, BombVariant.BOMB_GIGA)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21)
end,
}
return require("main")
