import { costumes } from "../globals/costumes";
import { PlayerData } from "../playerdata";

export function usePill(
  _pillEffect: number,
  _player: EntityPlayer,
  _useFlags: number,
  modPlayerData: { data: PlayerData[] },
): void {
  costumes(modPlayerData);
}
