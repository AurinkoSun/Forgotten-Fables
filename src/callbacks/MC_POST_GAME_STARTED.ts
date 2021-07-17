import { init } from "../globals/hud";
import { pocketItems } from "../globals/pocketItems";
import { loadData } from "../globals/saveload";
import { PlayerData } from "../playerdata";

export function gameStart(
  mod: Mod,
  modPlayerData: { data: PlayerData[] },
  continued: boolean,
): void {
  loadData(continued, mod, modPlayerData);
  init();
  pocketItems(modPlayerData);
}
