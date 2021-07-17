import * as hud from "../globals/hud";
import { PlayerData } from "../playerdata";

export function render(modPlayerData: { data: PlayerData[] }): void {
  hud.render(modPlayerData);
}
