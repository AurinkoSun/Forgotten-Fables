import * as constants from "../constants";
import { modPlayerData, PlayerSeed } from "../playerdata";
export function razor(pickup:EntityPickup){
  if(pickup.SubType==13){
    for(let i=0;i<constants.game.GetNumPlayers();i++){
      let player=constants.game.GetPlayer(i);
      if(player!=null && player.GetPlayerType()==constants.ModPlayerTypes.TAINTED_SARAH){
        if(player.Position.Distance(pickup.Position)<15 && modPlayerData[PlayerSeed(player)].razors<5){
          player.TakeDamage(1, DamageFlag.DAMAGE_RED_HEARTS, EntityRef(pickup), 0);
          pickup.Remove();
          modPlayerData[PlayerSeed(player)].razors+=1;
          player.AddCacheFlags(CacheFlag.CACHE_DAMAGE);
          player.EvaluateItems();
        }
      }
    }
  } else {
    for(let i=0;i<constants.game.GetNumPlayers();i++){
      let player=constants.game.GetPlayer(i);
      if(player!=null && player.GetPlayerType()==constants.ModPlayerTypes.TAINTED_SARAH){
        if(player.Position.Distance(pickup.Position)<100){
          pickup.Morph(5, 10, 13);
        }
      }
    }
  }
}