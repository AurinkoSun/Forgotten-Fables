import { ModItemTypes, ModPlayerTypes, ModTearVariants } from "../../constants";

export function ghostShot(tear: EntityTear): void {
  if (
    tear.SpawnerEntity !== null &&
    tear.SpawnerEntity.Type === EntityType.ENTITY_PLAYER
  ) {
    const player = tear.SpawnerEntity.ToPlayer();
    if (
      player !== null &&
      (player.HasCollectible(ModItemTypes.GHOST_SHOT) ||
        player.GetPlayerType() === ModPlayerTypes.ALABASTER)
    ) {
      if (player.HasWeaponType(WeaponType.WEAPON_TEARS)) {
        ghostReplace(tear, player);
      } else {
        tear.AddTearFlags(TearFlags.TEAR_HOMING);
        tear.AddTearFlags(TearFlags.TEAR_SPECTRAL);
        tear.AddTearFlags(TearFlags.TEAR_EXPLOSIVE);
      }
    }
  }
}
export function gsLaser(laser: EntityLaser): void {
  if (laser.SpawnerEntity !== null) {
    const player = laser.SpawnerEntity.ToPlayer();
    if (player !== null) {
      if (player.HasCollectible(ModItemTypes.GHOST_SHOT)) {
        laser.AddTearFlags(TearFlags.TEAR_HOMING);
        laser.AddTearFlags(TearFlags.TEAR_SPECTRAL);
        laser.AddTearFlags(TearFlags.TEAR_EXPLOSIVE);
      }
    }
  }
}
export function gsKnife(knife: EntityKnife): void {
  if (knife.SpawnerEntity !== null) {
    const player = knife.SpawnerEntity.ToPlayer();
    if (player !== null) {
      if (player.HasCollectible(ModItemTypes.GHOST_SHOT)) {
        knife.AddTearFlags(TearFlags.TEAR_HOMING);
        knife.AddTearFlags(TearFlags.TEAR_SPECTRAL);
        knife.AddTearFlags(TearFlags.TEAR_EXPLOSIVE);
      }
    }
  }
}
export function gsBomb(bomb: EntityBomb): void {
  if (bomb.IsFetus) {
    if (bomb.SpawnerEntity !== null) {
      const player = bomb.SpawnerEntity.ToPlayer();
      if (player !== null) {
        if (player.HasCollectible(ModItemTypes.GHOST_SHOT)) {
          bomb.AddTearFlags(TearFlags.TEAR_HOMING);
          bomb.AddTearFlags(TearFlags.TEAR_SPECTRAL);
          bomb.AddTearFlags(TearFlags.TEAR_EXPLOSIVE);
        }
      }
    }
  }
}
function ghostReplace(tear: EntityTear, player: EntityPlayer): EntityTear {
  if (player.HasCollectible(CollectibleType.COLLECTIBLE_HAEMOLACRIA)) {
    const animName = tear.GetSprite().GetAnimation();
    tear.ChangeVariant(ModTearVariants.GHOST_HAEMO);
    tear.GetSprite().Load("gfx/Ghost_Tear.anm2", true);
    tear.GetSprite().Play(animName, true);
    tear.CollisionDamage = player.Damage;
    tear.AddTearFlags(TearFlags.TEAR_HOMING);
    tear.AddTearFlags(TearFlags.TEAR_SPECTRAL);
    tear.GetData().ghost = true;
    tear.GetData().haemo = true;
    tear.GetData().player = player;
  } else {
    const animName = tear.GetSprite().GetAnimation();
    tear.ChangeVariant(ModTearVariants.GHOST);
    tear.GetSprite().Load("gfx/Ghost_Tear.anm2", true);
    tear.GetSprite().Play(animName, true);
    tear.CollisionDamage = player.Damage;
    tear.AddTearFlags(TearFlags.TEAR_HOMING);
    tear.AddTearFlags(TearFlags.TEAR_SPECTRAL);
    tear.GetData().ghost = true;
    tear.GetData().player = player;
  }
  tear.EntityCollisionClass = EntityCollisionClass.ENTCOLL_ENEMIES;
  tear.HomingFriction -= 0.05;
  return tear;
}
const height = -5;
const multiplier = 0.5;
export function ghostUpdate(tear: EntityTear): void {
  if (tear.Variant === ModTearVariants.GHOST) {
    if (tear.GetData().player !== null && tear.Height > -5) {
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      for (let i = 0; i < 3; i++) {
        const ghostExplosion = Isaac.Spawn(
          EntityType.ENTITY_EFFECT,
          EffectVariant.ENEMY_GHOST,
          1,
          tear.Position,
          Vector(0, 0),
          player,
        ).ToEffect();
        if (ghostExplosion !== null) {
          ghostExplosion.SpriteScale = ghostExplosion.SpriteScale.div(2).mul(
            math.sqrt(player.Damage) / math.sqrt(3.5),
          );
          ghostExplosion.SizeMulti = ghostExplosion.SizeMulti.div(2).mul(
            math.sqrt(player.Damage) / math.sqrt(3.5),
          );
          ghostExplosion.CollisionDamage = player.Damage / 3;
          ghostExplosion.EntityCollisionClass = EntityCollisionClass.ENTCOLL_ENEMIES;
        }
      }
      tear.Remove();
    } else if (
      tear.Variant === ModTearVariants.GHOST_HAEMO &&
      tear.Height > height
    ) {
      if (tear.GetData().player !== null) {
        const player: EntityPlayer = tear.GetData().player as EntityPlayer;
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(45))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(90))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(135))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(180))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(225))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(270))
          .ChangeVariant(ModTearVariants.GHOST);
        player
          .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(315))
          .ChangeVariant(ModTearVariants.GHOST);
      }
      tear.Remove();
    }
  }
}
export function ghostCollide(tear: EntityTear, collider: Entity): void {
  if (tear.Variant === ModTearVariants.GHOST) {
    if (
      tear.GetData().player !== null &&
      collider.GetDropRNG().GetSeed() !== (tear.GetData().seed as number)
    ) {
      tear.GetData().seed = collider.GetDropRNG().GetSeed();
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      for (let i = 0; i < 3; i++) {
        const ghostExplosion = Isaac.Spawn(
          EntityType.ENTITY_EFFECT,
          EffectVariant.ENEMY_GHOST,
          1,
          tear.Position,
          Vector(0, 0),
          player,
        ).ToEffect();
        if (ghostExplosion !== null) {
          ghostExplosion.SpriteScale = ghostExplosion.SpriteScale.div(2).mul(
            math.sqrt(player.Damage) / math.sqrt(3.5),
          );
          ghostExplosion.SizeMulti = ghostExplosion.SizeMulti.div(2).mul(
            math.sqrt(player.Damage) / math.sqrt(3.5),
          );
          ghostExplosion.CollisionDamage = player.Damage / 3;
        }
      }
    }
  } else if (tear.Variant === ModTearVariants.GHOST_HAEMO) {
    if (
      tear.GetData().player !== null &&
      collider.GetDropRNG().GetSeed() !== (tear.GetData().seed as number)
    ) {
      tear.GetData().seed = collider.GetDropRNG().GetSeed();
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(45))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(90))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(135))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(180))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(225))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(270))
        .ChangeVariant(ModTearVariants.GHOST);
      player
        .FireTear(tear.Position, tear.Velocity.mul(multiplier).Rotated(315))
        .ChangeVariant(ModTearVariants.GHOST);
    }
  }
}
