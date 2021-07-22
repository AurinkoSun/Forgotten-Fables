import { GlobalData, ModPlayerData } from "../constants";
import { init } from "../globals/hud";
import { pocketItems } from "../globals/pocketItems";
import { loadData } from "../globals/saveload";

export function gameStart(
  mod: Mod,
  modPlayerData: ModPlayerData,
  globalData: GlobalData,
  continued: boolean,
): void {
  loadData(continued, mod, modPlayerData, globalData);
  init();
  pocketItems(modPlayerData);
}
