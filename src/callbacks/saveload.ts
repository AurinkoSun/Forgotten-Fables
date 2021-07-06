import * as json from "json";
import * as constants from "../constants";
import { modPlayerData, PlayerData, GetPlayerId, PlayerSeed } from "../playerdata";
export function loadData(mod:Mod,player:EntityPlayer|null=null){
  let olddata=json.decode(mod.LoadData()) as { [index:number] : PlayerData };
  let seeds:number[]=[0,0,0,0,0,0,0,0];
  for(let i=0;i<constants.game.GetNumPlayers();i++){
    let seed=PlayerSeed(constants.game.GetPlayer(i));
    if(seed!=-1){
      modPlayerData[seed].player=olddata[seed].player;
      modPlayerData[seed].lost=olddata[seed].lost;
      modPlayerData[seed].razors=olddata[seed].razors;
      modPlayerData[seed].RegenerateID();
    }
  }
  if(player!=null && modPlayerData[GetPlayerId(player)].player==null){
    modPlayerData[GetPlayerId(player)]=new PlayerData(player);
  }
}
export function saveData(mod:Mod){
  for(let i=0;i<constants.game.GetNumPlayers();i++){
    modPlayerData[PlayerSeed(constants.game.GetPlayer(i))]
  }
  mod.SaveData(json.encode(modPlayerData));
}