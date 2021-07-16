--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ModTearVariants = ____constants.ModTearVariants
local bbghostReplace, ghostReplace
function bbghostReplace(self, tear, player)
    tear.Visible = false
    local ghost = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PURGATORY, 1, tear.Position, ((tear.Velocity / (0 - player.TearHeight)) * 23.75) / 1.5, player)
    local ____obj, ____index = ghost:GetSprite(), "PlaybackSpeed"
    ____obj[____index] = ____obj[____index] * 2
    ghost.CollisionDamage = player.Damage
    tear:Remove()
    return ghost
end
function ghostReplace(self, tear, player)
    tear:ChangeVariant(ModTearVariants.GHOST)
    tear:GetSprite():Load("gfx/002.051_ghost_tear.anm2", true)
    tear:GetSprite():Play("Idle", true)
    print(
        tear:GetSprite():GetAnimation()
    )
    tear.CollisionDamage = player.Damage
    tear:ResetSpriteScale()
    tear:AddTearFlags(TearFlags.TEAR_HOMING)
    tear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
    tear:GetData().ghost = true
    tear:GetData().player = player
    tear:Remove()
    return tear
end
function ____exports.ghostShot(self, tear)
    if (tear.SpawnerEntity ~= nil) and (tear.SpawnerEntity.Type == EntityType.ENTITY_PLAYER) then
        local player = tear.SpawnerEntity:ToPlayer()
        if (player ~= nil) and player:HasCollectible(ModItemTypes.BBGHOST_SHOT) then
            bbghostReplace(nil, tear, player)
        elseif (player ~= nil) and player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            ghostReplace(nil, tear, player)
        end
    end
end
function ____exports.ghostUpdate(self, tear)
    if (tear.Velocity:GetAngleDegrees() >= 0) and (tear.Velocity:GetAngleDegrees() <= 30) then
        tear.SpriteRotation = tear.Velocity:GetAngleDegrees()
    elseif (tear.Velocity:GetAngleDegrees() > 30) and (tear.Velocity:GetAngleDegrees() <= 150) then
        tear.SpriteRotation = tear.Velocity:GetAngleDegrees() - 90
    elseif (tear.Velocity:GetAngleDegrees() <= -30) and (tear.Velocity:GetAngleDegrees() >= -150) then
        tear.SpriteRotation = tear.Velocity:GetAngleDegrees() + 90
    elseif (tear.Velocity:GetAngleDegrees() < -90) or (tear.Velocity:GetAngleDegrees() > 90) then
        tear.SpriteRotation = tear.SpriteRotation + (tear.Velocity:GetAngleDegrees() + 180)
    end
end
function ____exports.ghostCollide(self, tear, collider)
    if tear:GetData().ghost == true then
        if (tear:GetData().player ~= nil) and (collider:GetDropRNG():GetSeed() ~= tear:GetData().seed) then
            tear:GetData().seed = collider:GetDropRNG():GetSeed()
            local player = tear:GetData().player
            local explosionEffect = Isaac.Spawn(
                EntityType.ENTITY_EFFECT,
                EffectVariant.BOMB_EXPLOSION,
                0,
                tear.Position,
                Vector(0, 0),
                player
            ):ToEffect()
            if explosionEffect ~= nil then
                explosionEffect:SetDamageSource(EntityType.ENTITY_PLAYER)
                explosionEffect.CollisionDamage = player.Damage * 0.8
                local playeradjrange = (player.TearHeight * -1) / 23.75
                explosionEffect.Scale = explosionEffect.Scale * playeradjrange
            end
        end
    end
    return tear
end
function ____exports.ghostShotStats(self, player, flags)
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(ModItemTypes.BBGHOST_SHOT) or player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            player.Damage = player.Damage * 0.8
        end
    end
end
return ____exports
