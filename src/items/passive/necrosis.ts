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
export function necrosis(tear: EntityTear): void {
  const entity = tear.SpawnerEntity;
  if (entity === null) {
    return;
  }
  const player = entity.ToPlayer();
  if (player === null) {
    return;
  }
  if (
    player.HasCollectible(ModItemTypes.NECROSIS) &&
    !player.HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
  ) {
    // stuff
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
