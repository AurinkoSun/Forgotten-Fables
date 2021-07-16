import { game, ModPlayerTypes } from "../constants";

export function alabasterStats(player: EntityPlayer, flags: CacheFlag): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    if (flags === CacheFlag.CACHE_SHOTSPEED) {
      player.ShotSpeed -= 0.15;
    }
    if (flags === CacheFlag.CACHE_FLYING) {
      player.CanFly = true;
    }
    game.GetLevel().InitializeDevilAngelRoom(false, true);
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
