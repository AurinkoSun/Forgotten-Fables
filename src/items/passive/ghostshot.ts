import { ModItemTypes, ModPlayerTypes, ModTearVariants } from "../../constants";

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
  return tear;
}
const height = -5;
const multiplier = 0.5;
export function ghostUpdate(tear: EntityTear): void {
  if (tear.Variant === ModTearVariants.GHOST) {
    if (tear.GetData().player !== null && tear.Height > -5) {
      const player: EntityPlayer = tear.GetData().player as EntityPlayer;
      const ghostExplosion = Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        EffectVariant.ENEMY_GHOST,
        1,
        tear.Position,
        Vector(0, 0),
        player,
      ).ToEffect();
      if (ghostExplosion !== null) {
        print(ghostExplosion.Scale);
        ghostExplosion.Scale /= 10;
        ghostExplosion.GetSprite().Update();
        print(ghostExplosion.Scale);
        ghostExplosion.CollisionDamage = player.Damage * 1.2;
        tear.Remove();
      }
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
      const ghostExplosion = Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        EffectVariant.ENEMY_GHOST,
        1,
        tear.Position,
        Vector(0, 0),
        player,
      );
      if (ghostExplosion !== null) {
        print("hi");
        ghostExplosion.SpriteScale.div(10);
        ghostExplosion.GetSprite().Scale.div(10);
        ghostExplosion.CollisionDamage = player.Damage * 1.2;
        // lightEffect.Scale *= playeradjrange; //Uncomment once range gets fixed in the api
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

export function ghostShotStats(player: EntityPlayer, flags: CacheFlag): void {
  if (flags === CacheFlag.CACHE_DAMAGE) {
    if (player.HasCollectible(ModItemTypes.BBGHOST_SHOT)) {
      player.Damage *= 0.8;
    }
  }
}
