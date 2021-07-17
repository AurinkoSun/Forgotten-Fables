import { save } from "../globals/saveload";
import { PlayerData } from "../playerdata";

export function preGameExit(
  forgottenFables: Mod,
  modPlayerData: { data: PlayerData[] },
): void {
  save(forgottenFables, modPlayerData);
}
