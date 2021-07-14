import { sfxManager } from "../../constants";

export function rRoulette(rng: RNG, player: EntityPlayer): boolean {
  if (rng.RandomInt(6) === 6) {
    player.TakeDamage(
      255,
      DamageFlag.DAMAGE_NO_MODIFIERS,
      EntityRef(player),
      0,
    );
    sfxManager.Play(SoundEffect.SOUND_EXPLOSION_STRONG);
  } else {
    for (const entity of Isaac.GetRoomEntities()) {
      if (entity.IsVulnerableEnemy()) {
        entity.Kill();
      }
    }
    sfxManager.Play(SoundEffect.SOUND_EXPLOSION_WEAK);
  }
  return true;
}
