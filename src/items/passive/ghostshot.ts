import { ModItemTypes, ModTearVariants } from "../../constants";

export function ghostShot(tear: EntityTear): void {
  if (
    tear.SpawnerEntity !== null &&
    tear.SpawnerEntity.Type === EntityType.ENTITY_PLAYER
  ) {
    const player = tear.SpawnerEntity.ToPlayer();
    if (player !== null && player.HasCollectible(ModItemTypes.BBGHOST_SHOT)) {
      bbghostReplace(tear, player);
    } else if (
      player !== null &&
      player.HasCollectible(ModItemTypes.GHOST_SHOT)
    ) {
      ghostReplace(tear, player);
    }
  }
}
function bbghostReplace(tear: EntityTear, player: EntityPlayer): Entity {
  tear.Visible = false;
  const ghost = Isaac.Spawn(
    EntityType.ENTITY_EFFECT,
    EffectVariant.PURGATORY,
    1,
    tear.Position,
    tear.Velocity.div(0 - player.TearHeight)
      .mul(23.75)
      .div(1.5),
    player,
  );
  ghost.GetSprite().PlaybackSpeed *= 2;
  ghost.CollisionDamage = player.Damage;
  tear.Remove();
  return ghost;
}
function ghostReplace(tear: EntityTear, player: EntityPlayer): EntityTear {
  const newtear = Isaac.Spawn(
    EntityType.ENTITY_TEAR,
    ModTearVariants.GHOST,
    0,
    tear.Position,
    tear.Velocity,
    player,
  ).ToTear();
  if (newtear !== null) {
    newtear.TearFlags = tear.TearFlags;
    newtear.Rotation = tear.Rotation;
    newtear.AddTearFlags(TearFlags.TEAR_HOMING);
    newtear.AddTearFlags(TearFlags.TEAR_SPECTRAL);
    newtear.GetData().ghost = true;
    newtear.GetData().player = player;
    newtear.Scale = tear.Size / 7;
    tear.Remove();
    return newtear;
  }
  error("Ghost tear spawn failed", 2);
  return tear;
}
export function ghostUpdate(tear: EntityTear): void {
  // quick and dirty fix.
  // probably bad.
  if (
    tear.Velocity.GetAngleDegrees() >= 0 &&
    tear.Velocity.GetAngleDegrees() <= 30
  ) {
    tear.SpriteRotation = tear.Velocity.GetAngleDegrees();
  } else if (
    tear.Velocity.GetAngleDegrees() > 30 &&
    tear.Velocity.GetAngleDegrees() <= 150
  ) {
    tear.SpriteRotation = tear.Velocity.GetAngleDegrees() - 90;
  } else if (
    tear.Velocity.GetAngleDegrees() <= -30 &&
    tear.Velocity.GetAngleDegrees() >= -150
  ) {
    tear.SpriteRotation = tear.Velocity.GetAngleDegrees() + 90;
  } else if (
    tear.Velocity.GetAngleDegrees() < -90 ||
    tear.Velocity.GetAngleDegrees() > 90
  ) {
    tear.SpriteRotation += tear.Velocity.GetAngleDegrees() + 180;
  }
  // TODO: make sprite use scaled tears from spritesheet
}
export function ghostCollide(tear: EntityTear, collider: Entity): EntityTear {
  if (tear.GetData().ghost === true) {
    if (
      tear.GetData().player !== null &&
      collider.GetDropRNG().GetSeed() !== (tear.GetData().seed as number)
    ) {
      tear.GetData().seed = collider.GetDropRNG().GetSeed();
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      const explosionEffect = Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        EffectVariant.BOMB_EXPLOSION,
        0,
        tear.Position,
        Vector(0, 0),
        player,
      ).ToEffect();
      if (explosionEffect !== null) {
        explosionEffect.SetDamageSource(EntityType.ENTITY_PLAYER);
        explosionEffect.CollisionDamage = player.Damage * 0.8;
        const playeradjrange = (player.TearHeight * -1) / 23.75; // The player's range divided by the default
        explosionEffect.Scale *= playeradjrange;
      }
    }
  }
  return tear;
}
export function ghostShotStats(player: EntityPlayer, flags: CacheFlag): void {
  if (flags === CacheFlag.CACHE_DAMAGE) {
    if (
      player.HasCollectible(ModItemTypes.BBGHOST_SHOT) ||
      player.HasCollectible(ModItemTypes.GHOST_SHOT)
    ) {
      player.Damage *= 0.8;
    }
  }
}
