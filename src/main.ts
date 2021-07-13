import * as callbacks from "./callbacks/callbacks";
import { tearUpdate } from "./callbacks/MC_POST_TEAR_UPDATE";
import { PlayerData } from "./playerdata";

const modPlayerData: { data: PlayerData[] } = {
  data: [
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
    new PlayerData(null, 0, false, 0),
  ],
};
const forgottenFables = RegisterMod("Forgotten Fables", 1);
forgottenFables.AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, () => {
  callbacks.preGameExit(forgottenFables, modPlayerData);
});
forgottenFables.AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, tearUpdate);
forgottenFables.AddCallback(
  ModCallbacks.MC_EVALUATE_CACHE,
  (player: EntityPlayer, flag: CacheFlag) => {
    callbacks.evalCache(modPlayerData, player, flag);
  },
);
forgottenFables.AddCallback(
  ModCallbacks.MC_PRE_TEAR_COLLISION,
  callbacks.preTearCollision,
);
// forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, callbacks.newFloor);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PLAYER_INIT,
  (player: EntityPlayer) => {
    callbacks.postPlayerInit(player, modPlayerData);
  },
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_ROOM, () => {
  callbacks.postNewRoom(modPlayerData);
});

forgottenFables.AddCallback(
  ModCallbacks.MC_USE_PILL,
  (pillEffect: number, player: EntityPlayer, flags: number) => {
    callbacks.usePill(pillEffect, player, flags, modPlayerData);
  },
);

forgottenFables.AddCallback(
  ModCallbacks.MC_POST_NPC_RENDER,
  callbacks.npcRender,
);
forgottenFables.AddCallback(
  ModCallbacks.MC_ENTITY_TAKE_DMG,
  (entity: Entity, amt: number, flags: DamageFlag, src: EntityRef) => {
    callbacks.entityTakeDamage(entity, amt, flags, src, modPlayerData);
  },
);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PICKUP_UPDATE,
  (pickup: EntityPickup) => {
    callbacks.postPickupUpdate(pickup, modPlayerData);
  },
);

forgottenFables.AddCallback(
  ModCallbacks.MC_POST_FIRE_TEAR,
  callbacks.postFireTear,
);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_BOMB_UPDATE,
  callbacks.bombUpdate,
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_BOMB_INIT, callbacks.bombInit);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_PROJECTILE_INIT,
  callbacks.projectileInit,
);
