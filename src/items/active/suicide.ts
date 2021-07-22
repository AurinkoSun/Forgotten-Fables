// import * as constants from "../../constants";
// import { GetPlayerId, PlayerData } from "../../playerdata";
import { ModPlayerData } from "../../constants";

export function suicide(
  _modPlayerData: ModPlayerData,
  _player: EntityPlayer,
): boolean {
  /* if (
    player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH &&
    !modPlayerData.data[GetPlayerId(player)].lost
  ) {
    print("tsarah killed herself");
    player.AddBrokenHearts(1);
    modPlayerData.data[GetPlayerId(player)].lost = true;
    player.AddCacheFlags(CacheFlag.CACHE_ALL);
    player.EvaluateItems();
    const body = Isaac.Spawn(
      constants.ModEntityTypes.TSARAHBODY,
      constants.ModEntityVariants.TSARAHBODY,
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
    return true;
  } */
  return false;
}
export function revive(
  _modPlayerData: ModPlayerData,
  _player: EntityPlayer,
): boolean {
  /* if (
    player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH &&
    modPlayerData.data[GetPlayerId(player)].lost
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
      modPlayerData.data[GetPlayerId(player)].lost = false;
      player.AddCacheFlags(CacheFlag.CACHE_ALL);
      player.EvaluateItems();
      return true;
    }
    return false;
  } */
  return false;
}
export function bodyAnim(_entity: EntityNPC): void {
  /* if (entity.GetSprite().IsFinished("Revive")) {
    const player = entity.GetData().player as EntityPlayer;
    player.Visible = true;
    entity.Remove();
  } */
}
