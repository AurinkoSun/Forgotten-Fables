// import * as constants from "../constants";
// import { GetPlayerId, PlayerData } from "../playerdata";
import { ModPlayerData } from "../constants";

export function sarahLostKill(
  _modPlayerData: ModPlayerData,
  _tookDamage: Entity,
  _amount: number,
  _flags: DamageFlag,
): boolean {
  /* const player = tookDamage.ToPlayer();
  if (
    player !== null &&
    player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH &&
    modPlayerData.data[GetPlayerId(player)].lost &&
    amount !== 0 &&
    flags !== DamageFlag.DAMAGE_NOKILL
  ) {
    player.Kill();
    return false;
  } */
  return true;
}
