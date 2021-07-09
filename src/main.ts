import * as json from "json";
import { evalCache } from "./callbacks/cache";
import { costumes } from "./callbacks/costumes";
import { newFloor } from "./callbacks/floorinit";
import { pocketItems } from "./callbacks/pocketItems";
import * as constants from "./constants";
import { alabasterHearts, bloodDrive } from "./items/blooddrive";
import {
  fatFetusTears,
  gigaBombReplace,
  gigaInit,
  gigaUpdate,
  glitterdrops,
  rocks,
} from "./items/fatfetus";
// import { razor } from "./callbacks/razors";
// import { sarahLostKill } from "./callbacks/sarahlostdamage";
import { ghostShot } from "./items/ghostshot";
// import { bodyAnim, revive, suicide } from "./items/suicide";
import { GetPlayerId, PlayerData } from "./playerdata";

const modPlayerData: { data: PlayerData[] } = {
  data: [
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
    new PlayerData(null, false, 0),
  ],
};
const forgottenFables = RegisterMod("Forgotten Fables", 1);
forgottenFables.AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, () => {
  forgottenFables.SaveData(json.encode(modPlayerData));
});
forgottenFables.AddCallback(
  ModCallbacks.MC_EVALUATE_CACHE,
  (player: EntityPlayer, flag: CacheFlag) => {
    evalCache(modPlayerData, player, flag);
  },
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, newFloor);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PLAYER_INIT,
  (player: EntityPlayer) => {
    costumes(modPlayerData);
    modPlayerData.data[GetPlayerId(player)].player = player;
    modPlayerData.data[GetPlayerId(player)].RegenerateID();
  },
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_ROOM, () => {
  costumes(modPlayerData);
  pocketItems(modPlayerData);
});
forgottenFables.AddCallback(ModCallbacks.MC_USE_ITEM, () => {
  costumes(modPlayerData);
});
forgottenFables.AddCallback(ModCallbacks.MC_USE_PILL, () => {
  costumes(modPlayerData);
});
forgottenFables.AddCallback(
  ModCallbacks.MC_USE_ITEM,
  (item: number, _rng: RNG, player: EntityPlayer) => {
    switch (item) {
      case constants.ModItemTypes.SUICIDE: {
        // suicide(modPlayerData, player);
        break;
      }
      case constants.ModItemTypes.REVIVE: {
        // revive(modPlayerData, player);
        break;
      }
      case constants.ModItemTypes.BLOODDRIVE: {
        bloodDrive(player);
        break;
      }
      default: {
        break;
      }
    }
    costumes(modPlayerData);
  },
);
/* forgottenFables.AddCallback(
  ModCallbacks.MC_POST_NPC_RENDER,
  bodyAnim,
  constants.ModEntityVariants.TSARAHBODY,
); */
forgottenFables.AddCallback(
  ModCallbacks.MC_ENTITY_TAKE_DMG,
  (entity: Entity, amt: number, flags: DamageFlag, src: EntityRef) => {
    if (entity.Type === EntityType.ENTITY_PLAYER) {
      // sarahLostKill(modPlayerData, entity, amt, flags);
    }
    glitterdrops(entity, amt, flags, src);
  },
);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PICKUP_UPDATE,
  (pickup: EntityPickup) => {
    // razor(modPlayerData, pickup);
    alabasterHearts(pickup);
  },
  10,
);

forgottenFables.AddCallback(
  ModCallbacks.MC_POST_FIRE_TEAR,
  (tear: EntityTear) => {
    fatFetusTears(tear);
    ghostShot(tear);
  },
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, gigaUpdate, 21);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_BOMB_INIT,
  gigaBombReplace,
  BombVariant.BOMB_GIGA,
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_BOMB_INIT, gigaInit, 21);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PROJECTILE_INIT,
  rocks,
  ProjectileVariant.PROJECTILE_ROCK,
);
forgottenFables.AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, glitterdrops);
