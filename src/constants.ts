/**
 * Enum to keep track of new items' ID's
 */
export enum ModItemTypes {
  FAT_FETUS = Isaac.GetItemIdByName("Fat Fetus"),
  // SUICIDE = Isaac.GetItemIdByName("Suicide"),
  // REVIVE = Isaac.GetItemIdByName("Revive"),
  BLOODDRIVE = Isaac.GetItemIdByName("Blood Drive"),
  GHOST_SHOT = Isaac.GetItemIdByName("Ghost Shot"),
  BBGHOST_SHOT = Isaac.GetItemIdByName("Big Boy Ghost Shot"),
  BLUE_HEART = Isaac.GetItemIdByName("Blue Heart"),
  RUSSIANROULETTE = Isaac.GetItemIdByName("Russian Roulette"),
  STONE_D6 = Isaac.GetItemIdByName("Stone D6"),
}
export enum ModTearVariants {
  GHOST = Isaac.GetEntityVariantByName("Ghost Tear"),
}
/* export enum ModEntityTypes {
  TSARAHBODY = 799,
} */
/**
 * Enum for custom Entity variants
 */
export enum ModEntityVariants {
  // TSARAHBODY = 200,
  GHOST_TEAR = 50,
}
/**
 * Enum for new PlayerTypes
 */
export enum ModPlayerTypes {
  // SARAH = Isaac.GetPlayerTypeByName("Sarah", false),
  // TAINTED_SARAH = Isaac.GetPlayerTypeByName("Sarah", true),
  ALABASTER = Isaac.GetPlayerTypeByName("Alabaster"),
  // TAINTED_ALABASTER = Isaac.GetPlayerTypeByName("Alabaster", true),
}
/**
 * Enum for new modded costumes (hair and item costumes)
 */
export enum ModCostumes {
  /* SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2"),
  TAINTED_SARAH_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/SaraAlthair.anm2",
  ),
  LOST_SARAH_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/sarahLosthair.anm2",
  ), */
  ALABASTER_HAIR = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster_Hair.anm2",
  ),
}
export const game = Game();
export const sfxManager = SFXManager();
