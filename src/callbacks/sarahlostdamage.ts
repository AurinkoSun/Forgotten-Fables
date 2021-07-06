import * as constants from "../constants";
import { modPlayerData, PlayerSeed } from "../playerdata";
export function sarahLostKill(tookDamage:Entity,amount:number,flags:DamageFlag){
  let player=tookDamage.ToPlayer();
  if(player!=null&&player.GetPlayerType()==constants.ModPlayerTypes.TAINTED_SARAH&&modPlayerData[PlayerSeed(player)]&&amount!=0&&flags!=DamageFlag.DAMAGE_NOKILL){
    player.Kill();
    return false;
  }else{
    return true;
  }
}