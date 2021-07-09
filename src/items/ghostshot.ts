import { ModItemTypes } from "../constants";

export function ghostShot(tear: EntityTear): void {
  if (
    tear.SpawnerEntity !== null &&
    tear.SpawnerEntity.Type === EntityType.ENTITY_PLAYER
  ) {
    const player = tear.SpawnerEntity.ToPlayer();
    if (player !== null && player.HasCollectible(ModItemTypes.GHOST_SHOT)) {
      ghostReplace(tear, player);
    }
  }
}
function ghostReplace(tear: EntityTear, player: EntityPlayer): Entity {
  tear.Visible = false;
  const ghost = Isaac.Spawn(
    EntityType.ENTITY_EFFECT,
    EffectVariant.HUNGRY_SOUL,
    0,
    tear.Position,
    tear.Velocity,
    player,
  );
  return ghost;
}
