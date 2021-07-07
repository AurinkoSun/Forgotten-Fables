import * as constants from "../constants";
import { modPlayerData, PlayerSeed } from "../playerdata";

export function suicide(
  _item: CollectibleType,
  _rng: RNG,
  player: EntityPlayer,
): void {
  if (
    player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH &&
    !modPlayerData[PlayerSeed(player)].lost
  ) {
    print("tsarah killed herself");
    player.AddBrokenHearts(1);
    modPlayerData[PlayerSeed(player)].lost = true;
    player.AddCacheFlags(CacheFlag.CACHE_ALL);
    player.EvaluateItems();
    const body = Isaac.Spawn(
      EntityType.ENTITY_EFFECT,
      200,
      0,
      player.Position,
      Vector(0, 0),
      player,
    );
    // animate death and change item sprite to "revive"
    body.GetSprite().Play("SarahDeath", true);
    player.SetPocketActiveItem(
      constants.ModItemTypes.REVIVE as unknown as CollectibleType,
    );
    print(body.Position.X, body.Position.Y);
  } else if (
    player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH &&
    modPlayerData[PlayerSeed(player)].lost
  ) {
    let body = false;
    const entities = Isaac.GetRoomEntities();
    for (const entity of entities) {
      if (entity.Type === EntityType.ENTITY_EFFECT && entity.Variant === 200) {
        body = true;
        player.Position = entity.Position;
        player.Visible = false;
        entity.GetSprite().Play("Revive", true);
        entity.GetData().player = player;
      }
    }
    if (body) {
      // change item sprite to "suicide" and animate revive
      player.SetPocketActiveItem(
        constants.ModItemTypes.SUICIDE as unknown as CollectibleType,
      );
      modPlayerData[PlayerSeed(player)].lost = false;
      player.AddCacheFlags(CacheFlag.CACHE_ALL);
      player.EvaluateItems();
    }
  }
}
export function bodyAnim(effect: EntityEffect): void {
  if (effect.GetSprite().IsFinished("Revive")) {
    const player = effect.GetData().player as EntityPlayer;
    player.Visible = true;
    effect.Remove();
  }
}
