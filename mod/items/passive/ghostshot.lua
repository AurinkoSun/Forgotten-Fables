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
    local newtear = Isaac.Spawn(EntityType.ENTITY_TEAR, ModTearVariants.GHOST, 0, tear.Position, tear.Velocity, player):ToTear()
    if newtear ~= nil then
        newtear.TearFlags = tear.TearFlags
        newtear.Rotation = tear.Rotation
        newtear:AddTearFlags(TearFlags.TEAR_HOMING)
        newtear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
        newtear:AddTearFlags(TearFlags.TEAR_PIERCING)
        newtear:GetData().ghost = true
        newtear:GetData().player = player
        tear:Remove()
        return newtear
    end
    error("Ghost tear spawn failed", 2)
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
    if tear.Velocity:GetAngleDegrees() < 180 then
        tear.SpriteRotation = tear.Velocity:GetAngleDegrees() + 180
    else
        tear.SpriteRotation = tear.Velocity:GetAngleDegrees() - 180
    end
end
function ____exports.ghostCollide(self, tear, _collider)
    if tear:GetData().ghost == true then
        if tear:GetData().player ~= nil then
            local player = tear:GetData().player
            local explosionEffect = Isaac.Spawn(
                EntityType.ENTITY_EFFECT,
                EffectVariant.BLOOD_EXPLOSION,
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
        else
            print("no player associated with tear")
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
