import { evalCache } from "./callbacks/cache";
import { costumes } from "./callbacks/costumes";
import { newFloor } from "./callbacks/floorinit";
import { razor } from "./callbacks/razors";
import { sarahLostKill } from "./callbacks/sarahlostdamage";
import * as constants from "./constants";
import {
  fatFetusTears,
  gigaBombReplace,
  gigaInit,
  gigaUpdate,
  glitterdrops,
  rocks,
} from "./items/fatfetus";
import { bodyAnim, revive, suicide } from "./items/suicide";

const forgottenFables = RegisterMod("Forgotten Fables", 1);
forgottenFables.AddCallback(ModCallbacks.MC_EVALUATE_CACHE, evalCache);
forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, newFloor);
forgottenFables.AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, costumes);
forgottenFables.AddCallback(ModCallbacks.MC_POST_NEW_ROOM, costumes);
forgottenFables.AddCallback(ModCallbacks.MC_USE_ITEM, costumes);
forgottenFables.AddCallback(ModCallbacks.MC_USE_CARD, costumes);
forgottenFables.AddCallback(ModCallbacks.MC_USE_PILL, costumes);
forgottenFables.AddCallback(
  ModCallbacks.MC_USE_ITEM,
  suicide,
  constants.ModItemTypes.SUICIDE,
);
forgottenFables.AddCallback(
  ModCallbacks.MC_USE_ITEM,
  revive,
  constants.ModItemTypes.REVIVE,
);
forgottenFables.AddCallback(
  ModCallbacks.MC_POST_EFFECT_RENDER,
  bodyAnim,
  constants.ModEffectVariants.TSARAHBODY,
);
forgottenFables.AddCallback(
  ModCallbacks.MC_ENTITY_TAKE_DMG,
  sarahLostKill,
  EntityType.ENTITY_PLAYER,
);
forgottenFables.AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, razor, 10);

forgottenFables.AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, fatFetusTears);
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
