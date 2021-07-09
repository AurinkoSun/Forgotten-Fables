/**
 * Enum to keep track of new items' ID's
 */
export enum ModItemTypes {
  FAT_FETUS = Isaac.GetItemIdByName("Fat Fetus"),
  // SUICIDE = Isaac.GetItemIdByName("Suicide"),
  // REVIVE = Isaac.GetItemIdByName("Revive"),
  BLOODDRIVE = Isaac.GetItemIdByName("Blood Drive"),
  GHOST_SHOT = Isaac.GetItemIdByName("Ghost Shot"),
}
export enum ModEntityTypes {}
// TSARAHBODY = 799,
/**
 * Enum for custom Entity variants
 */
export enum ModEntityVariants {}
// TSARAHBODY = 200,
/**
 * Enum for new PlayerTypes
 */
export enum ModPlayerTypes {
  // SARAH = Isaac.GetPlayerTypeByName("Sarah", false),
  // TAINTED_SARAH = Isaac.GetPlayerTypeByName("Sarah", true),
  ALABASTER = Isaac.GetPlayerTypeByName("Alabaster", false),
  //  TAINTED_ALABASTER = Isaac.GetPlayerTypeByName("Alabaster", true),
}
/**
 * Enum for new modded costumes (hair and item costumes)
 */
export enum ModCostumes {
  // SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2"),
  // TAINTED_SARAH_HAIR = Isaac.GetCostumeIdByPath(
  //   "gfx/characters/SaraAlthair.anm2",
  // ),
  // LOST_SARAH_HAIR = Isaac.GetCostumeIdByPath(
  //   "gfx/characters/sarahLosthair.anm2",
  // ),
  ALABASTER_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/Character_Alabaster_Hair.anm2",
  ),
}
export const game = Game();
