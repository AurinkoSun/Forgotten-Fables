// import { sarahLostKill } from "../globals/sarahlostdamage";
import { ModEntityVariants, ModItemTypes, ModPlayerData } from "../constants";
import { peelDmg } from "../entities/peel";
import { glitterdrops } from "../items/passive/fatfetus";

export function entityTakeDamage(
  entity: Entity,
  amt: number,
  flags: DamageFlag,
  src: EntityRef,
  _modPlayerData: ModPlayerData,
): boolean | void {
  if (entity.Type === EntityType.ENTITY_PLAYER) {
    // sarahLostKill(modPlayerData, entity, amt, flags);
  }
  if (Isaac.GetPlayer().HasCollectible(ModItemTypes.FAT_FETUS))
    glitterdrops(entity, amt, flags, src);
  if (entity.Type === ModEntityVariants.PEEL) peelDmg(entity, amt);
}
