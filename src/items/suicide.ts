import * as constants from "../constants";
import { modPlayerData, PlayerData, GetPlayerId, PlayerSeed } from "../playerdata";
export function suicide(_item:CollectibleType,_rng:RNG,player:EntityPlayer){
  let returner=false;
  if(player.GetPlayerType()==constants.ModPlayerTypes.TAINTED_SARAH && modPlayerData[PlayerSeed(player)].lost!=true){
    print("tsarah killed herself");
    player.AddBrokenHearts(1);
    modPlayerData[PlayerSeed(player)].lost=true;
    player.AddCacheFlags(CacheFlag.CACHE_ALL);
    player.EvaluateItems();
    let body=Isaac.Spawn(EntityType.ENTITY_EFFECT, 200, 0, player.Position, Vector(0,0), player);
    //animate death and change item sprite to "revive"
    print(body.Position.X,body.Position.Y);
    returner=true;
  } else if(player.GetPlayerType()==constants.ModPlayerTypes.TAINTED_SARAH && modPlayerData[PlayerSeed(player)].lost){
    let body=false;
    let entities=Isaac.GetRoomEntities();
    for(let entity of entities){
      if(entity.Type==EntityType.ENTITY_EFFECT && entity.Variant==200){
        body=true;
        player.Position=entity.Position;
        entity.Remove();
      }
    }
    if(body){
      //change item sprite to "suicide" and animate revive
      modPlayerData[PlayerSeed(player)].lost=false;
      player.AddCacheFlags(CacheFlag.CACHE_ALL);
      player.EvaluateItems();
      returner=true;
    }
  }
  return returner;
}