import { ModPlayerData } from "../constants";
import * as hud from "../globals/hud";

export function render(modPlayerData: ModPlayerData): void {
  hud.render(modPlayerData);
}
