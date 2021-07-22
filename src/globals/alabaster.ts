import { ModPlayerData, ModPlayerTypes, rng } from "../constants";
import { GetPlayerId } from "../playerdata";

export function alabasterStats(
  player: EntityPlayer,
  flags: CacheFlag,
  modPlayerData: ModPlayerData,
): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    if (flags === CacheFlag.CACHE_SHOTSPEED) {
      player.ShotSpeed -= 0.2;
      player.ShotSpeed += modPlayerData.data[GetPlayerId(player)].tStats[4];
    }
    if (flags === CacheFlag.CACHE_FLYING) {
      player.CanFly = true;
    }
    if (flags === CacheFlag.CACHE_DAMAGE) {
      player.Damage += modPlayerData.data[GetPlayerId(player)].tStats[0];
    }
    if (flags === CacheFlag.CACHE_SPEED) {
      player.MoveSpeed -= 0.1;
      player.MoveSpeed += modPlayerData.data[GetPlayerId(player)].tStats[3];
    }
    if (flags === CacheFlag.CACHE_FIREDELAY) {
      player.MaxFireDelay += 1;
      player.MaxFireDelay -= modPlayerData.data[GetPlayerId(player)].tStats[1];
    }
    if (flags === CacheFlag.CACHE_RANGE) {
      player.TearHeight -= modPlayerData.data[GetPlayerId(player)].tStats[2]; // currently broken in the api but this code should work once it gets fixed
    }
  }
}
export const stats = [0.15, 0.15, 0.15, 0.15, 0.15]; // temp values. change them. damage,tears,range,speed,shot speed.
const flags = [
  CacheFlag.CACHE_DAMAGE,
  CacheFlag.CACHE_FIREDELAY,
  CacheFlag.CACHE_RANGE,
  CacheFlag.CACHE_SPEED,
  CacheFlag.CACHE_SHOTSPEED,
];
export function birthright(
  player: EntityPlayer,
  modPlayerData: ModPlayerData,
): void {
  if (
    player.HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) &&
    player.GetPlayerType() === ModPlayerTypes.ALABASTER
  ) {
    const rand = rng.RandomInt(6);
    modPlayerData.data[GetPlayerId(player)].tStats[rand] += stats[rand];
    player.AddCacheFlags(flags[rand]);
    player.EvaluateItems();
  }
}
export function alabasterHealth(player: EntityPlayer): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    const playerHealth = player.GetMaxHearts();
    if (playerHealth > 0) {
      player.AddMaxHearts(0 - playerHealth, false);
      player.AddBlackHearts(playerHealth);
    }
    const redHealth = player.GetHearts();
    if (redHealth > 0) {
      player.AddHearts(0 - redHealth);
    }
  }
}
