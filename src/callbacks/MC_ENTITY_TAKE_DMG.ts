// import { sarahLostKill } from "../globals/sarahlostdamage";
import { glitterdrops } from "../items/passive/fatfetus";
import { PlayerData } from "../playerdata";

export function entityTakeDamage(
  entity: Entity,
  amt: number,
  flags: DamageFlag,
  src: EntityRef,
  _modPlayerData: { data: PlayerData[] },
): boolean | void {
  if (entity.Type === EntityType.ENTITY_PLAYER) {
    // sarahLostKill(modPlayerData, entity, amt, flags);
  }
  glitterdrops(entity, amt, flags, src);
}
