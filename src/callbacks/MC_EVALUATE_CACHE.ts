import { ModPlayerData } from "../constants";
import { alabasterStats } from "../globals/alabaster";
// import { sarahStats } from "../globals/sarah";
import { ffstats } from "../items/passive/fatfetus";

export function evalCache(
  modPlayerData: ModPlayerData,
  player: EntityPlayer,
  flags: CacheFlag,
): void {
  alabasterStats(player, flags, modPlayerData);
  ffstats(player, flags);
  // sarahStats(player, modPlayerData, flags);
}
