import { PlayerData } from "./playerdata";

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
  BOMBCONVERTER = Isaac.GetItemIdByName("Bomb Converter"),
  MEATBUCKET = Isaac.GetItemIdByName("Bucket of Meat"),
  BMERCURIUS = Isaac.GetItemIdByName("Mercurius?"),
  NECROSIS = Isaac.GetItemIdByName("Necrosis"),
}
export interface GlobalData {
  roomRespawned: boolean;
  debugEntitySpawn: boolean;
}
export class SaveData {
  playerData: ModPlayerData;
  globalData: GlobalData;
  constructor(playerData: ModPlayerData, globalData: GlobalData) {
    this.playerData = playerData;
    this.globalData = globalData;
  }
}
export interface ModPlayerData {
  data: PlayerData[];
}
export enum ModTearVariants {
  GHOST = Isaac.GetEntityVariantByName("Ghost Tear"),
  GHOST_HAEMO = Isaac.GetEntityVariantByName("Haemolacria Ghost Tear"),
}
/* export enum ModEntityTypes {
  TSARAHBODY = 799,
} */
/**
 * Enum for custom Entity variants
 */
export enum ModEntityVariants {
  // TSARAHBODY = 200,
  PEEL = Isaac.GetEntityVariantByName("Peel"),
  NECROSIS = Isaac.GetEntityVariantByName("Necrosis Laser"),
  NECROSIS2 = Isaac.GetEntityVariantByName("Necrosis Sky Laser"),
  NECROSIS_SPLASH = Isaac.GetEntityVariantByName("Necrosis Impact"),
  FETUSGIGA = Isaac.GetEntityVariantByName("Fetus Giga Bomb"),
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
  ALABASTERLIBRA = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster libra.anm2",
  ),
  ALABASTERBRIM = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster brimstone.anm2",
  ),
  ALABASTERBRIM2 = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster brimstone2.anm2",
  ),
  ALABASTERCHOCOLATEMILK = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster chocolate milk.anm2",
  ),
  ALABASTERGODSFLESH = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster godsflesh.anm2",
  ),
  ALABASTERITHURTS = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster ithurts.anm2",
  ),
  ALABASTERITHURTS2 = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster ithurts2.anm2",
  ),
  ALABASTERLACHRYPHAGY = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster lachryphagy.anm2",
  ),
  ALABASTERNECROSIS = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster necrosis.anm2",
  ),
  ALABASTERSOLARSYSTEM = Isaac.GetCostumeIdByPath(
    "gfx/characters/c_Alabaster solar system.anm2",
  ),
  NECROSIS = Isaac.GetCostumeIdByPath("gfx/characters/c_necrosis.anm2"),
  SOLARSYSTEM = Isaac.GetCostumeIdByPath("gfx/characters/c_solar system.anm2"),
}
export enum ModSlotVariants {
  // We'll most likely add quite a few more of these later
  SARAHNPC = Isaac.GetEntityVariantByName("Sarah (NPC)"),
}
export const game = Game();
export const sfxManager = SFXManager();
export const rng = RNG();
export const hud = game.GetHUD();
