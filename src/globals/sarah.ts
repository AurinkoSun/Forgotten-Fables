// import { ModPlayerTypes } from "../constants";
// import { GetPlayerId, PlayerData } from "../playerdata";
import { PlayerData } from "../playerdata";

export function sarahStats(
  _player: EntityPlayer,
  _modPlayerData: { data: PlayerData[] },
  _flags: CacheFlag,
): void {
  /* if (player.GetPlayerType() === ModPlayerTypes.TAINTED_SARAH) {
    if (flags === CacheFlag.CACHE_FIREDELAY) {
      if (modPlayerData.data[GetPlayerId(player)].lost) {
        player.MaxFireDelay -= 3; // tears are complicated...
      } else {
        player.MaxFireDelay -= 1; // ...sometimes
      }
    }
    if (flags === CacheFlag.CACHE_DAMAGE) {
      player.Damage += 0.5 * modPlayerData.data[GetPlayerId(player)].razors;
      player.Damage -= 1.5; // Tainted Sarah and her lost form have the same damage stat (basically none)
    }
    if (flags === CacheFlag.CACHE_LUCK) {
      if (modPlayerData.data[GetPlayerId(player)].lost) {
        player.Luck -= 2;
      }
    }
    if (flags === CacheFlag.CACHE_SPEED) {
      if (modPlayerData.data[GetPlayerId(player)].lost) {
        player.MoveSpeed -= 0.1;
      } else {
        player.MoveSpeed += 0.2;
      }
    }
    if (flags === CacheFlag.CACHE_FLYING) {
      if (modPlayerData.data[GetPlayerId(player)].lost) {
        player.CanFly = true;
      }
    }
    if (flags === CacheFlag.CACHE_RANGE) {
      player.TearHeight -= 1.5; // this should equal 8 base range once tearheight gets fixed
    }
  } else if (player.GetPlayerType() === ModPlayerTypes.SARAH) {
    // sarah's stats go here
  } */
}
