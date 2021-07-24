import { game, ModEntityVariants, ModItemTypes } from "../../constants";

export function necrosisLudo(tear: EntityTear): void {
  if (tear.SpawnerEntity !== null) {
    const player = tear.SpawnerEntity.ToPlayer();
    if (
      player !== null &&
      player.HasCollectible(ModItemTypes.NECROSIS) &&
      player.HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
    ) {
      let laser = player.GetData().laser as EntityEffect | null;
      if (laser === null) {
        laser = Isaac.Spawn(
          EntityType.ENTITY_EFFECT,
          ModEntityVariants.NECROSIS2,
          0,
          tear.Position,
          Vector(0, 0),
          player,
        ).ToEffect();
        player.GetData().laser = laser;
      }
      if (laser === null) {
        return;
      }
      laser.Size = tear.Size;
      laser.SizeMulti = tear.SizeMulti;
      laser.SpriteScale = tear.SpriteScale;
      laser.EntityCollisionClass = EntityCollisionClass.ENTCOLL_ENEMIES;
      laser.DamageSource = EntityType.ENTITY_PLAYER;
      laser.AddEntityFlags(EntityFlag.FLAG_FRIENDLY);
      laser.CollisionDamage = player.Damage;
      laser.Position = tear.Position;
      tear.Visible = false;
    }
  }
}
export function necrosisUpdate(player: EntityPlayer): void {
  if (
    player.HasCollectible(ModItemTypes.NECROSIS) &&
    !player.HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
  ) {
    player.FireDelay = player.MaxFireDelay;
    if (player.GetData().ChargeFrame === null) {
      player.GetData().ChargeFrame = 0;
    }
    if (player.GetData().CoolFrame === null) {
      player.GetData().CoolFrame = 0;
    }
    if (player.GetFireDirection() !== -1 && player.GetData().CoolFrame === 0) {
      player.GetData().ChargeFrame = math.min(
        player.MaxFireDelay * 2,
        (player.GetData().ChargeFrame as number) + 1,
      );
      // change player sprite
    } else if (
      game.GetRoom().GetFrameCount() > 1 &&
      (player.GetData().ChargeFrame as number) === player.MaxFireDelay * 2
    ) {
      const laser = player.FireBrimstone(player.GetAimDirection(), player);
      laser.AddTearFlags(player.TearFlags);
      laser.CollisionDamage = player.Damage;
      laser.AddTearFlags(TearFlags.TEAR_SPECTRAL);
      const sprite = laser.GetSprite();
      sprite.Load("gfx/necrosisLaser.anm2", true);
      sprite.Play("Loop", true);
      player.GetData().ChargeFrame = 0;
    }
  }
}
export function necroLudoNewRoom(): void {
  for (let i = 0; i < game.GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (
      player !== null &&
      player.HasCollectible(ModItemTypes.NECROSIS) &&
      player.HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
    ) {
      const laser = Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        ModEntityVariants.NECROSIS2,
        0,
        player.Position,
        Vector(0, 0),
        player,
      ).ToEffect();
      player.GetData().laser = laser;
      if (laser === null) {
        return;
      }
      laser.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE;
    }
  }
}
