import { sfxManager } from "../../constants";

export function rRoulette(rng: RNG, player: EntityPlayer): boolean {
  if (Game().GetRoom().GetAliveEnemiesCount() !== 0) {
    if (Math.abs(rng.RandomInt(Math.round(Isaac.GetPlayer().Luck) + 6)) === 0) {
      player.TakeDamage(
        255,
        DamageFlag.DAMAGE_NO_MODIFIERS,
        EntityRef(player),
        0,
      );
      sfxManager.Play(SoundEffect.SOUND_EXPLOSION_WEAK);
    } else {
      for (const entity of Isaac.GetRoomEntities()) {
        if (entity.IsVulnerableEnemy()) {
          entity.Kill();
        }
      }
      sfxManager.Play(SoundEffect.SOUND_EXPLOSION_STRONG);
    }
    return true;
  }
  return false;
}
