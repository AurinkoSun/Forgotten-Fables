/**
 * Enum to keep track of new items' ID's
 */
export enum ModItemTypes {
  FAT_FETUS = Isaac.GetItemIdByName("Fat Fetus"),
  SUICIDE = Isaac.GetItemIdByName("Suicide"),
}
/**
 * Enum for new PlayerTypes
 */
export enum ModPlayerTypes {
  SARAH = Isaac.GetPlayerTypeByName("Sarah", false),
  TAINTED_SARAH = Isaac.GetPlayerTypeByName("Tainted Sarah", true),
}
/**
 * Enum for new modded costumes (hair and item costumes)
 */
export enum ModCostumes {
  SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2"),
  TAINTED_SARAH_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/SaraAlthair.anm2",
  ),
  LOST_SARAH_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/sarahLosthair.anm2",
  ),
}
export const game = Game();
