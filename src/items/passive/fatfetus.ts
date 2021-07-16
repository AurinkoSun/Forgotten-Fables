import * as constants from "../../constants";

export function fatFetusTears(tear: EntityTear): void {
  let bomb: EntityBomb | null;
  if (tear.SpawnerEntity === null) {
    return;
  }
  const player = tear.SpawnerEntity.ToPlayer();
  if (player === null) {
    return;
  }
  if (player.HasCollectible(constants.ModItemTypes.FAT_FETUS)) {
    const dmg = player.Damage * (300 / 3.5);
    bomb = Isaac.Spawn(
      EntityType.ENTITY_BOMBDROP,
      21,
      0,
      player.Position,
      tear.Velocity,
      player,
    ).ToBomb();
    if (bomb === null) {
      return;
    }
    tear.Remove();
    bomb.ExplosionDamage = dmg;
  }
}
export function gigaUpdate(bomb: EntityBomb): void {
  if (bomb.SpawnerEntity !== null) {
    const player = bomb.SpawnerEntity.ToPlayer();
    if (player !== null) {
      if (
        bomb.GetSprite().IsFinished("Pulse") ||
        bomb.GetSprite().IsFinished("brimpulse") ||
        bomb.GetSprite().IsFinished("stickypulse") ||
        bomb.GetSprite().IsFinished("goldenpulse") ||
        bomb.GetSprite().IsFinished("flamepulse") ||
        bomb.GetSprite().IsFinished("bloodpulse") ||
        bomb.GetSprite().IsFinished("buttpulse") ||
        bomb.GetSprite().IsFinished("poisonpulse") ||
        bomb.GetSprite().IsFinished("megapulse") ||
        bomb.GetSprite().IsFinished("scatterpulse") ||
        bomb.GetSprite().IsFinished("ghostpulse") ||
        bomb.GetSprite().IsFinished("sadpulse") ||
        bomb.GetSprite().IsFinished("homingpulse") ||
        bomb.GetSprite().IsFinished("goldhomingpulse") ||
        bomb.GetSprite().IsFinished("crosspulse") ||
        bomb.GetSprite().IsFinished("glitterpulse")
      ) {
        if (
          player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) ||
          player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)
        ) {
          EntityLaser.ShootAngle(
            LaserVariant.THICK_RED,
            bomb.Position,
            0,
            15,
            Vector(0, 0),
            player,
          );
          EntityLaser.ShootAngle(
            LaserVariant.THICK_RED,
            bomb.Position,
            90,
            15,
            Vector(0, 0),
            player,
          );
          EntityLaser.ShootAngle(
            LaserVariant.THICK_RED,
            bomb.Position,
            180,
            15,
            Vector(0, 0),
            player,
          );
          EntityLaser.ShootAngle(
            LaserVariant.THICK_RED,
            bomb.Position,
            270,
            15,
            Vector(0, 0),
            player,
          );
        }
        const explody = Isaac.Spawn(
          4,
          17,
          0,
          bomb.Position,
          Vector(0, 0),
          bomb,
        ).ToBomb();
        if (explody === null) {
          return;
        }
        explody.Visible = false;
        if (
          player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) ||
          player.HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY)
        ) {
          explody.AddTearFlags(TearFlags.TEAR_CROSS_BOMB);
        }
        if (
          player.HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) ||
          player.HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)
        ) {
          explody.RadiusMultiplier *= 0.5;
        }
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)) {
          explody.AddTearFlags(TearFlags.TEAR_STICKY);
        }
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)) {
          explody.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
        }
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS)) {
          explody.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
        }
        bomb.ExplosionDamage = player.Damage * (300 / 3.5);
        explody.ExplosionDamage = player.Damage * (300 / 3.5);
        explody.SetExplosionCountdown(0);
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)) {
          const creep = Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.PLAYER_CREEP_RED,
            0,
            bomb.Position,
            Vector(0, 0),
            player,
          ).ToEffect();
          if (creep === null) {
            print("creep spawn failed");
            return;
          }
          creep.SetDamageSource(EntityType.ENTITY_PLAYER);
          creep.Scale *= 10;
          creep.LifeSpan *= 1000;
        }
        if (
          player.HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) ||
          player.HasCollectible(CollectibleType.COLLECTIBLE_IPECAC)
        ) {
          explody.AddTearFlags(TearFlags.TEAR_POISON);
          const cloud = Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.SMOKE_CLOUD,
            0,
            bomb.Position,
            Vector(0, 0),
            player,
          ).ToEffect();
          if (cloud === null) {
            return;
          }
          cloud.Scale *= 4;
        }
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS)) {
          Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.HUNGRY_SOUL,
            0,
            bomb.Position,
            Vector(-3, 0),
            player,
          );
          Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.HUNGRY_SOUL,
            0,
            bomb.Position,
            Vector(0, -3),
            player,
          );
          Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.HUNGRY_SOUL,
            0,
            bomb.Position,
            Vector(0, 3),
            player,
          );
          Isaac.Spawn(
            EntityType.ENTITY_EFFECT,
            EffectVariant.HUNGRY_SOUL,
            0,
            bomb.Position,
            Vector(3, 0),
            player,
          );
        }
        bomb.GetSprite().Play("Explode", false);
      }
      if (bomb.GetSprite().IsFinished("Explode")) {
        bomb.Remove();
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS)) {
          let sad;
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(10, 0),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(-10, 0),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(0, 10),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(0, -10),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(10 / math.sqrt(2), 10 / math.sqrt(2)),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(0 - 10 / math.sqrt(2), 10 / math.sqrt(2)),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(10 / math.sqrt(2), 0 - 10 / math.sqrt(2)),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
          sad = Isaac.Spawn(
            EntityType.ENTITY_TEAR,
            0,
            0,
            bomb.Position,
            Vector(0 - 10 / math.sqrt(2), 0 - 10 / math.sqrt(2)),
            player,
          ).ToTear();
          if (sad !== null) {
            sad.Scale *= 2;
            sad.CollisionDamage = player.Damage * 2;
            sad.GetData().sad = true;
          }
        }
      }
    }
  }
}
export function gigaBombReplace(bomb: EntityBomb): void {
  if (bomb.SpawnerEntity !== null && bomb.SpawnerEntity.ToPlayer() !== null) {
    Isaac.Spawn(
      EntityType.ENTITY_BOMBDROP,
      21,
      0,
      bomb.Position,
      bomb.Velocity,
      bomb.SpawnerEntity.ToPlayer(),
    );
    bomb.Remove();
  }
}
export function gigaInit(bomb: EntityBomb): void {
  bomb.CollisionDamage = 0;
  if (bomb.SpawnerEntity !== null) {
    const player = bomb.SpawnerEntity.ToPlayer();
    if (player !== null) {
      bomb.SetExplosionCountdown(100);
      if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD) ||
        player.HasCollectible(constants.ModItemTypes.GHOST_SHOT)
      ) {
        bomb.AddTearFlags(TearFlags.TEAR_HOMING);
      }
      if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)
      ) {
        bomb.RadiusMultiplier = 0.5;
      }
      if (player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)) {
        bomb.RadiusMultiplier *= 2;
      }
      if (player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)) {
        bomb.GetSprite().Play("megapulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY)
      ) {
        bomb.GetSprite().Play("crosspulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)
      ) {
        bomb.GetSprite().Play("brimpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)
      ) {
        bomb.AddTearFlags(TearFlags.TEAR_STICKY);
        bomb.GetSprite().Play("stickypulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)
      ) {
        bomb.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
        bomb.GetSprite().Play("buttpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)
      ) {
        bomb.GetSprite().Play("bloodpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS)
      ) {
        bomb.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
        bomb.GetSprite().Play("scatterpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) ||
        player.HasCollectible(constants.ModItemTypes.GHOST_SHOT)
      ) {
        bomb.AddTearFlags(TearFlags.TEAR_GHOST_BOMB);
        bomb.GetSprite().Play("ghostpulse", true);
      } else if (player.HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS)) {
        bomb.GetSprite().Play("sadpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS)
      ) {
        bomb.GetSprite().Play("glitterpulse", true);
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
      ) {
        bomb.CollisionDamage = 32;
        bomb.AddTearFlags(TearFlags.TEAR_BURN);
        bomb.GetSprite().Play("flamepulse", true);
      } else if (player.HasGoldenBomb()) {
        if (bomb.HasTearFlags(TearFlags.TEAR_HOMING)) {
          bomb.GetSprite().Play("goldhomingpulse", true);
        } else {
          bomb.GetSprite().Play("goldenpulse", true);
        }
      } else if (
        player.HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) ||
        player.HasCollectible(CollectibleType.COLLECTIBLE_IPECAC)
      ) {
        bomb.GetSprite().Play("poisonpulse", true);
      } else if (bomb.HasTearFlags(TearFlags.TEAR_HOMING)) {
        bomb.GetSprite().Play("homingpulse", true);
      } else {
        bomb.GetSprite().Play("Pulse", true);
      }
    } else {
      bomb.SetExplosionCountdown(87);
      bomb.ExplosionDamage = 300;
      bomb.GetSprite().Play("Pulse", true);
    }
  }
}
export function rocks(projectile: EntityProjectile): void {
  if (projectile.SpawnerEntity !== null) {
    const bomb = projectile.SpawnerEntity.ToBomb();
    if (bomb !== null && bomb.SpawnerEntity !== null) {
      const player = bomb.SpawnerEntity.ToPlayer();
      if (player !== null) {
        projectile.AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER);
        projectile.AddProjectileFlags(ProjectileFlags.HIT_ENEMIES);
        projectile.Damage = player.Damage;
      }
    }
  }
}
export function glitterdrops(
  entity: Entity,
  amount: number,
  flags: DamageFlag,
  source: EntityRef,
): void {
  if (amount >= entity.HitPoints && flags !== DamageFlag.DAMAGE_NOKILL) {
    if (
      source.Entity !== null &&
      source.Entity.ToBomb() !== null &&
      source.Entity.Type === EntityType.ENTITY_BOMBDROP &&
      source.Entity.Variant === BombVariant.BOMB_GIGA &&
      source.Entity.SpawnerEntity !== null &&
      source.Entity.SpawnerEntity.SpawnerEntity !== null
    ) {
      const player = source.Entity.SpawnerEntity.SpawnerEntity.ToPlayer();
      if (player !== null) {
        if (
          player.HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) &&
          player.HasCollectible(constants.ModItemTypes.FAT_FETUS)
        ) {
          if (math.random() <= 0.1) {
            const pickup = Isaac.Spawn(
              EntityType.ENTITY_PICKUP,
              PickupVariant.PICKUP_NULL,
              0,
              Isaac.GetFreeNearPosition(entity.Position, 1),
              entity.Velocity,
              null,
            ).ToPickup();
            if (pickup !== null && pickup.GetCoinValue() > 5) {
              Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COIN,
                0,
                pickup.Position,
                pickup.Velocity,
                null,
              );
              pickup.Remove();
            }
          }
        }
      }
    }
  }
}
export function ffstats(player: EntityPlayer, flags: CacheFlag): void {
  if (flags === CacheFlag.CACHE_FIREDELAY) {
    if (player.HasCollectible(constants.ModItemTypes.FAT_FETUS)) {
      if (
        !player.HasCollectible(
          CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE,
        ) &&
        !player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)
      ) {
        player.MaxFireDelay *= 15;
      }
    }
  }
  if (flags === CacheFlag.CACHE_DAMAGE) {
    if (
      player.HasCollectible(constants.ModItemTypes.FAT_FETUS) &&
      player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)
    ) {
      player.Damage *= 2;
    }
  }
}
