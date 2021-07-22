import { ModEntityVariants } from "../constants";

export function peelUpdate(npc: EntityNPC): void {
  if (npc.Variant === ModEntityVariants.PEEL) {
    if (npc.HitPoints <= npc.MaxHitPoints / 2) {
      npc.Velocity.X *= 1.1;
      npc.Velocity.Y *= 1.1;

      Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        EffectVariant.CREEP_RED,
        0,
        npc.Position,
        Vector(0, 0),
        npc,
      );
    }
  }
}

export function peelDmg(npc: Entity, damage: number): void {
  if (npc.HitPoints <= (npc.MaxHitPoints - damage) / 2) {
    npc
      .GetSprite()
      .ReplaceSpritesheet(0, "../resources/gfx/monsters/Peel2.png");
    npc.GetSprite().LoadGraphics();
  }
}
