import { ModPlayerTypes } from "../constants";

export function alabasterStats(player: EntityPlayer, flags: CacheFlag): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    if (flags === CacheFlag.CACHE_SHOTSPEED) {
      player.ShotSpeed -= 0.15;
    }
    if (flags === CacheFlag.CACHE_FLYING) {
      player.CanFly = true;
    }
  }
}
