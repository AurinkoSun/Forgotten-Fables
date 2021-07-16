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
    local animName = tear:GetSprite():GetAnimation()
    tear:ChangeVariant(ModTearVariants.GHOST)
    tear:GetSprite():Load("gfx/Ghost_Tear.anm2", true)
    tear:GetSprite():Play(animName, true)
    tear.CollisionDamage = player.Damage
    tear:AddTearFlags(TearFlags.TEAR_HOMING)
    tear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
    tear:GetData().ghost = true
    tear:GetData().player = player
    return tear
end
function ____exports.ghostShot(self, tear)
    if (tear.SpawnerEntity ~= nil) and (tear.SpawnerEntity.Type == EntityType.ENTITY_PLAYER) then
        local player = tear.SpawnerEntity:ToPlayer()
        if (player ~= nil) and player:HasCollectible(ModItemTypes.BBGHOST_SHOT) then
            bbghostReplace(nil, tear, player)
        elseif (player ~= nil) and player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            if player:HasWeaponType(WeaponType.WEAPON_TEARS) then
                ghostReplace(nil, tear, player)
            else
                tear:AddTearFlags(TearFlags.TEAR_HOMING)
                tear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
                tear:AddTearFlags(TearFlags.TEAR_EXPLOSIVE)
            end
        end
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
