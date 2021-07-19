import {
  game,
  hud,
  ModPlayerTypes,
  ModSlotVariants,
  sfxManager,
} from "../constants";

export function sarahUpdate(): void {
  Isaac.GetRoomEntities().forEach((entity: Entity) => {
    if (
      entity.Type === EntityType.ENTITY_SLOT &&
      entity.Variant === ModSlotVariants.SARAHNPC
    ) {
      const beggarFlags =
        EntityFlag.FLAG_NO_TARGET | EntityFlag.FLAG_NO_STATUS_EFFECTS;
      if (entity.GetEntityFlags() !== beggarFlags) {
        entity.ClearEntityFlags(entity.GetEntityFlags());
        entity.AddEntityFlags(beggarFlags);
        entity.EntityCollisionClass = EntityCollisionClass.ENTCOLL_PLAYERONLY;
      }
      if (entity.GetData().state === undefined) {
        entity.GetData().state = 0;
        entity.GetData().paycount = 0;
        entity.GetData().itemdrop = false;
      }
      const player = game.GetNearestPlayer(entity.Position);
      if (
        !entity.GetSprite().IsPlaying("Idle") &&
        !entity.GetSprite().IsPlaying("Thumbsup")
      ) {
        entity.GetSprite().Play("Idle", true);
      } else {
        print("hi");
        const distance1 = player.Position.Distance(entity.Position);
        const distance2 = player.Size + entity.Size;
        print(distance1, "  ", distance2);
        if (distance1 <= distance2) {
          if (player.GetPlayerType() !== ModPlayerTypes.ALABASTER) {
            entity.GetData().bumped_player = player;
            sfxManager.Play(SoundEffect.SOUND_SCAMPER, 1, 0, false, 1);
            entity.GetSprite().Play("Thumbsup", true);
            hud.ShowFortuneText("Hi! I'm Sarah!");
          }
        }
      }
    }
    if (entity.GetSprite().IsFinished("Thumbsup")) {
      entity.GetSprite().Play("Idle", true);
    }
    if (entity.GetSprite().IsFinished("Die")) {
      entity.Remove();
      game.GetLevel().SetStateFlag(LevelStateFlag.STATE_BUM_KILLED, true);
    }
    if (
      entity.GridCollisionClass === EntityGridCollisionClass.GRIDCOLL_GROUND
    ) {
      entity.GetSprite().Play("Die", true);
    }
  });
}
