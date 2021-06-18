
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
rng = RNG()
fatFetusID = Isaac.GetItemIdByName("Fat Fetus")
SarahPlayerType = Isaac.GetPlayerTypeByName("Sarah")
TaintedSarahPlayerType = Isaac.GetPlayerTypeByName("Tainted Sarah", true)
SarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2")
TaintedSarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/SaraAlthair.anm2")
LostSarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/sarahLosthair.anm2")
suicideID = Isaac.GetItemIdByName("Suicide")
razors = {0, 0, 0, 0, 0, 0, 0, 0}
lost = {false, false, false, false, false, false, false, false}
function startGame(self)
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, startGame)
function playerID(self, player)
    local val = -1
    do
        local i = 0
        while i < game:GetNumPlayers() do
            local playeri = game:GetPlayer(i)
            if playeri ~= nil then
                if player.Index == playeri.Index then
                    val = i
                end
            end
            i = i + 1
        end
    end
    return val
end
function evalCache(self, player, flags)
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(fatFetusID) then
            if (player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false) and (player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) == false) then
                player.MaxFireDelay = player.MaxFireDelay * 15
            end
        end
        if player:GetPlayerType() == TaintedSarahPlayerType then
            if lost[playerID(nil, player) + 1] then
                player.MaxFireDelay = player.MaxFireDelay - 3
            else
                player.MaxFireDelay = player.MaxFireDelay - 1
            end
        end
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:GetPlayerType() == TaintedSarahPlayerType then
            player.Damage = player.Damage + (0.5 * razors[playerID(nil, player) + 1])
        end
        if player:HasCollectible(fatFetusID) and player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
            player.Damage = player.Damage * 2
        end
        if player:GetPlayerType() == TaintedSarahPlayerType then
            player.Damage = player.Damage - 1.5
        end
    end
    if flags == CacheFlag.CACHE_LUCK then
        if (player:GetPlayerType() == TaintedSarahPlayerType) and (lost[playerID(nil, player) + 1] == true) then
            player.Luck = player.Luck - 2
        end
    end
    if flags == CacheFlag.CACHE_SPEED then
        if player:GetPlayerType() == TaintedSarahPlayerType then
            if lost[playerID(nil, player) + 1] then
                player.MoveSpeed = player.MoveSpeed - 0.1
            else
                player.MoveSpeed = player.MoveSpeed + 0.2
            end
        end
    end
    if flags == CacheFlag.CACHE_FLYING then
        if (player:GetPlayerType() == TaintedSarahPlayerType) and lost[playerID(nil, player) + 1] then
            player.CanFly = true
        end
    end
    if flags == CacheFlag.CACHE_RANGE then
        if player:GetPlayerType() == TaintedSarahPlayerType then
            player.TearHeight = player.TearHeight - 1.5
        end
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, evalCache)
function playerInit(self, player)
    if player:GetPlayerType() == TaintedSarahPlayerType then
        player:SetPocketActiveItem(suicideID, ActiveSlot.SLOT_POCKET)
        player:AddCollectible(CollectibleType.COLLECTIBLE_HEARTBREAK)
        player:AddBrokenHearts(-2)
        lost[playerID(nil, player) + 1] = false
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, playerInit, 0)
function costumes(self)
    do
        local i = 0
        while i < game:GetNumPlayers() do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                if player:GetPlayerType() == SarahPlayerType then
                    player:TryRemoveNullCostume(SarahCostume)
                    player:AddNullCostume(SarahCostume)
                    player:GetData().costumeEquipped = true
                end
                if player:GetPlayerType() == TaintedSarahPlayerType then
                    if lost[playerID(nil, player) + 1] == true then
                        player:TryRemoveNullCostume(LostSarahCostume)
                        player:AddNullCostume(LostSarahCostume)
                    else
                        player:TryRemoveNullCostume(TaintedSarahCostume)
                        player:AddNullCostume(TaintedSarahCostume)
                    end
                    player:GetData().costumeEquipped = true
                end
            end
            i = i + 1
        end
    end
end
function postItemCostumes(self)
    do
        local i = 0
        while i < game:GetNumPlayers() do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                if player:GetPlayerType() == SarahPlayerType then
                    player:TryRemoveNullCostume(SarahCostume)
                    player:AddNullCostume(SarahCostume)
                    player:GetData().costumeEquipped = true
                end
                if player:GetPlayerType() == TaintedSarahPlayerType then
                    if lost[playerID(nil, player) + 1] == true then
                        player:TryRemoveNullCostume(LostSarahCostume)
                        player:AddNullCostume(LostSarahCostume)
                    else
                        player:TryRemoveNullCostume(TaintedSarahCostume)
                        player:AddNullCostume(TaintedSarahCostume)
                    end
                    player:GetData().costumeEquipped = true
                end
            end
            i = i + 1
        end
    end
    return true
end
evenstage = false
function newFloor(self)
    if evenstage then
        do
            local i = 0
            while i < game:GetNumPlayers() do
                local player = game:GetPlayer(i)
                if (player ~= nil) and (player:GetPlayerType() == TaintedSarahPlayerType) then
                    player:AddBrokenHearts(-1)
                end
                i = i + 1
            end
        end
    else
        evenstage = true
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, newFloor)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, costumes)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, costumes)
talesOfGuppy:AddCallback(ModCallbacks.MC_USE_ITEM, postItemCostumes)
talesOfGuppy:AddCallback(ModCallbacks.MC_USE_CARD, costumes)
talesOfGuppy:AddCallback(ModCallbacks.MC_USE_PILL, costumes)
function suicide(self, item, rng, player)
    local returner = false
    if item ~= suicideID then
        print("how the fuck did you break the game this much")
        print(
            rng:RandomInt(10)
        )
    end
    if (player:GetPlayerType() == TaintedSarahPlayerType) and (lost[playerID(nil, player) + 1] == false) then
        player:AddBrokenHearts(1)
        lost[playerID(nil, player) + 1] = true
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
        body:GetSprite():Play("sarahdeath", true)
        returner = true
    elseif (player:GetPlayerType() == TaintedSarahPlayerType) and (lost[playerID(nil, player) + 1] == true) then
        local body = false
        local entities = Isaac.GetRoomEntities()
        for ____, entity in ipairs(entities) do
            if (entity.Type == EntityType.ENTITY_EFFECT) and (entity.Variant == 200) then
                body = true
                entity:Remove()
            end
        end
        if body then
            lost[playerID(nil, player) + 1] = false
            player:AddCacheFlags(CacheFlag.CACHE_ALL)
            player:EvaluateItems()
            returner = true
        end
    end
    return returner
end
talesOfGuppy:AddCallback(ModCallbacks.MC_USE_ITEM, suicide, suicideID)
function sarahLostKill(self, tookDamage, amount, flags)
    local player = tookDamage:ToPlayer()
    if ((((player ~= nil) and (player:GetPlayerType() == TaintedSarahPlayerType)) and lost[playerID(nil, player) + 1]) and (amount ~= 0)) and (flags ~= DamageFlag.DAMAGE_NOKILL) then
        player:Kill()
        return false
    else
        return true
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, sarahLostKill, EntityType.ENTITY_PLAYER)
function razor(self, pickup)
    if pickup.SubType == 13 then
        do
            local i = 0
            while i < game:GetNumPlayers() do
                local player = game:GetPlayer(i)
                if (player ~= nil) and (player:GetPlayerType() == TaintedSarahPlayerType) then
                    if (player.Position:Distance(pickup.Position) < 15) and (razors[i + 1] < 5) then
                        player:TakeDamage(
                            1,
                            DamageFlag.DAMAGE_RED_HEARTS,
                            EntityRef(pickup),
                            0
                        )
                        pickup:Remove()
                        razors[i + 1] = razors[i + 1] + 1
                        player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
                        player:EvaluateItems()
                    end
                end
                i = i + 1
            end
        end
    else
        do
            local i = 0
            while i < game:GetNumPlayers() do
                local player = game:GetPlayer(i)
                if (player ~= nil) and (player:GetPlayerType() == TaintedSarahPlayerType) then
                    if player.Position:Distance(pickup.Position) < 100 then
                        pickup:Morph(5, 10, 13)
                    end
                end
                i = i + 1
            end
        end
    end
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, razor, 10)
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
            elseif player:HasCollectible(
                CollectibleType.COLLECTIBLE_HOT_BOMBS or player:HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
            ) then
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
            else
                if bomb:HasTearFlags(TearFlags.TEAR_HOMING) then
                    bomb:GetSprite():Play("homingpulse", true)
                else
                    bomb:GetSprite():Play("Pulse", true)
                end
            end
        else
            bomb:SetExplosionCountdown(87)
            bomb.ExplosionDamage = 300
            bomb:GetSprite():Play("Pulse", true)
        end
    end
end
function rocks(self, projectile)
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
function glitterdrops(self, entity, amount, flags, source)
    if (amount >= entity.HitPoints) and (flags ~= DamageFlag.DAMAGE_NOKILL) then
        if (((((source.Entity ~= nil) and (source.Entity:ToBomb() ~= nil)) and (source.Entity.Type == EntityType.ENTITY_BOMBDROP)) and (source.Entity.Variant == BombVariant.BOMB_GIGA)) and (source.Entity.SpawnerEntity ~= nil)) and (source.Entity.SpawnerEntity.SpawnerEntity ~= nil) then
            local player = source.Entity.SpawnerEntity.SpawnerEntity:ToPlayer()
            if player ~= nil then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) and player:HasCollectible(fatFetusID) then
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
    return nil
end
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaBombReplace, BombVariant.BOMB_GIGA)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21)
talesOfGuppy:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, rocks, ProjectileVariant.PROJECTILE_ROCK)
talesOfGuppy:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, glitterdrops)
end,
}
return require("main")
