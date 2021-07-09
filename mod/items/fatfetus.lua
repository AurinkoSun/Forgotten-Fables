--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.fatFetusTears(self, tear)
    local bomb
    if tear.SpawnerEntity == nil then
        return
    end
    local player = tear.SpawnerEntity:ToPlayer()
    if player == nil then
        return
    end
    if player:HasCollectible(constants.ModItemTypes.FAT_FETUS) then
        local dmg = player.Damage * (300 / 3.5)
        bomb = Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, player.Position, tear.Velocity, player):ToBomb()
        if bomb == nil then
            return
        end
        tear:Remove()
        bomb.ExplosionDamage = dmg
    end
end
function ____exports.gigaUpdate(self, bomb)
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            if ((((((((((((((bomb:GetSprite():IsFinished("Pulse") or bomb:GetSprite():IsFinished("brimpulse")) or bomb:GetSprite():IsFinished("stickypulse")) or bomb:GetSprite():IsFinished("goldenpulse")) or bomb:GetSprite():IsFinished("flamepulse")) or bomb:GetSprite():IsFinished("bloodpulse")) or bomb:GetSprite():IsFinished("buttpulse")) or bomb:GetSprite():IsFinished("poisonpulse")) or bomb:GetSprite():IsFinished("megapulse")) or bomb:GetSprite():IsFinished("scatterpulse")) or bomb:GetSprite():IsFinished("ghostpulse")) or bomb:GetSprite():IsFinished("sadpulse")) or bomb:GetSprite():IsFinished("homingpulse")) or bomb:GetSprite():IsFinished("goldhomingpulse")) or bomb:GetSprite():IsFinished("crosspulse")) or bomb:GetSprite():IsFinished("glitterpulse") then
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
                bomb.ExplosionDamage = player.Damage * (300 / 3.5)
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
function ____exports.gigaBombReplace(self, bomb)
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
function ____exports.gigaInit(self, bomb)
    bomb.CollisionDamage = 0
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            bomb:SetExplosionCountdown(100)
            if (player:HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) or player:HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART)) or player:HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD) then
                bomb:AddTearFlags(TearFlags.TEAR_HOMING)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) or player:HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK) then
                bomb.RadiusMultiplier = 0.5
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                bomb.RadiusMultiplier = bomb.RadiusMultiplier * 2
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                bomb:GetSprite():Play("megapulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY) then
                bomb:GetSprite():Play("crosspulse", true)
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
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) then
                bomb:GetSprite():Play("glitterpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND) then
                bomb.CollisionDamage = 32
                bomb:AddTearFlags(TearFlags.TEAR_BURN)
                bomb:GetSprite():Play("flamepulse", true)
            elseif player:HasGoldenBomb() then
                if bomb:HasTearFlags(TearFlags.TEAR_HOMING) then
                    bomb:GetSprite():Play("goldhomingpulse", true)
                else
                    bomb:GetSprite():Play("goldenpulse", true)
                end
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                bomb:GetSprite():Play("poisonpulse", true)
            elseif bomb:HasTearFlags(TearFlags.TEAR_HOMING) then
                bomb:GetSprite():Play("homingpulse", true)
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
function ____exports.rocks(self, projectile)
    if projectile.SpawnerEntity ~= nil then
        local bomb = projectile.SpawnerEntity:ToBomb()
        if (bomb ~= nil) and (bomb.SpawnerEntity ~= nil) then
            local player = bomb.SpawnerEntity:ToPlayer()
            if player ~= nil then
                projectile:AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER)
                projectile:AddProjectileFlags(ProjectileFlags.HIT_ENEMIES)
                projectile.Damage = player.Damage
            end
        end
    end
end
function ____exports.glitterdrops(self, entity, amount, flags, source)
    if (amount >= entity.HitPoints) and (flags ~= DamageFlag.DAMAGE_NOKILL) then
        if (((((source.Entity ~= nil) and (source.Entity:ToBomb() ~= nil)) and (source.Entity.Type == EntityType.ENTITY_BOMBDROP)) and (source.Entity.Variant == BombVariant.BOMB_GIGA)) and (source.Entity.SpawnerEntity ~= nil)) and (source.Entity.SpawnerEntity.SpawnerEntity ~= nil) then
            local player = source.Entity.SpawnerEntity.SpawnerEntity:ToPlayer()
            if player ~= nil then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) and player:HasCollectible(constants.ModItemTypes.FAT_FETUS) then
                    if math.random() <= 0.1 then
                        local pickup = Isaac.Spawn(
                            EntityType.ENTITY_PICKUP,
                            PickupVariant.PICKUP_NULL,
                            0,
                            Isaac.GetFreeNearPosition(entity.Position, 1),
                            entity.Velocity,
                            nil
                        ):ToPickup()
                        if (pickup ~= nil) and (pickup:GetCoinValue() > 5) then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, 0, pickup.Position, pickup.Velocity, nil)
                            pickup:Remove()
                        end
                    end
                end
            end
        end
    end
end
return ____exports
