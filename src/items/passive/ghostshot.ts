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
  const animName = tear.GetSprite().GetAnimation();
  tear.ChangeVariant(ModTearVariants.GHOST);
  tear.GetSprite().Load("gfx/Ghost_Tear.anm2", true);
  tear.GetSprite().Play(animName, true);
  tear.CollisionDamage = player.Damage;
  tear.AddTearFlags(TearFlags.TEAR_HOMING);
  tear.AddTearFlags(TearFlags.TEAR_SPECTRAL);
  tear.GetData().ghost = true;
  tear.GetData().player = player;
  return tear;
}
export function ghostCollide(tear: EntityTear, collider: Entity): EntityTear {
  if (tear.GetData().ghost === true) {
    if (
      tear.GetData().player !== null &&
      collider.GetDropRNG().GetSeed() !== (tear.GetData().seed as number)
    ) {
      tear.GetData().seed = collider.GetDropRNG().GetSeed();
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      for (let i = 0; i < 3; i++) {
        const explosionEffect = Isaac.Spawn(
          EntityType.ENTITY_EFFECT,
          EffectVariant.BLOOD_EXPLOSION,
          0,
          tear.Position,
          Vector(0, 0),
          player,
        ).ToEffect();
        if (explosionEffect !== null) {
          explosionEffect.SetDamageSource(EntityType.ENTITY_PLAYER);
          explosionEffect.CollisionDamage = player.Damage * 2;
          const playeradjrange = (player.TearHeight * -1) / 23.75; // The player's range divided by the default
          explosionEffect.Scale *= playeradjrange;
        }
      }
    }
  }
  return tear;
}
export function ghostShotStats(player: EntityPlayer, flags: CacheFlag): void {
  if (flags === CacheFlag.CACHE_DAMAGE) {
    if (player.HasCollectible(ModItemTypes.BBGHOST_SHOT)) {
      player.Damage *= 0.8;
    }
  }
}
