import * as constants from "../constants";
import { GetPlayerId, modPlayerData } from "../playerdata";

export function razor(pickup: EntityPickup): void {
  if (pickup.SubType === 13) {
    for (let i = 0; i < constants.game.GetNumPlayers(); i++) {
      const player = constants.game.GetPlayer(i);
      if (
        player !== null &&
        player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH
      ) {
        if (
          player.Position.Distance(pickup.Position) < 15 &&
          modPlayerData[GetPlayerId(player)].razors < 5
        ) {
          player.TakeDamage(
            1,
            DamageFlag.DAMAGE_RED_HEARTS,
            EntityRef(pickup),
            0,
          );
          pickup.Remove();
          modPlayerData[GetPlayerId(player)].razors += 1;
          player.AddCacheFlags(CacheFlag.CACHE_DAMAGE);
          player.EvaluateItems();
        }
      }
    }
  } else {
    for (let i = 0; i < constants.game.GetNumPlayers(); i++) {
      const player = constants.game.GetPlayer(i);
      if (
        player !== null &&
        player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH
      ) {
        if (player.Position.Distance(pickup.Position) < 100) {
          pickup.Morph(5, 10, 13);
        }
      }
    }
  }
}
