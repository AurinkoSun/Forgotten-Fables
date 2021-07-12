import { encode } from "json";
import { PlayerData } from "../playerdata";

export function preGameExit(
  forgottenFables: Mod,
  modPlayerData: { data: PlayerData[] },
): void {
  forgottenFables.SaveData(encode(modPlayerData));
}
