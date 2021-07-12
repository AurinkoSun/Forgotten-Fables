import { alabasterStats } from "../globals/alabaster";
// import { sarahStats } from "../globals/sarah";
import { ffstats } from "../items/passive/fatfetus";
import { ghostShotStats } from "../items/passive/ghostshot";
import { PlayerData } from "../playerdata";

export function evalCache(
  _modPlayerData: { data: PlayerData[] },
  player: EntityPlayer,
  flags: CacheFlag,
): void {
  alabasterStats(player, flags);
  ffstats(player, flags);
  ghostShotStats(player, flags);
  // sarahStats(player, modPlayerData, flags);
}
