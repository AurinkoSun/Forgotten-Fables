import {
  game,
  hud,
  ModPlayerTypes,
  ModSlotVariants,
  rng,
  sfxManager,
} from "../constants";

const rewards = [
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_COLLECTIBLE,
    CollectibleType.COLLECTIBLE_PACT,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_COLLECTIBLE,
    CollectibleType.COLLECTIBLE_MISSING_PAGE_2,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_COLLECTIBLE,
    CollectibleType.COLLECTIBLE_MR_DOLLY,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_TRINKET,
    TrinketType.TRINKET_MISSING_PAGE,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_TRINKET,
    TrinketType.TRINKET_MISSING_POSTER,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_TRINKET,
    TrinketType.TRINKET_KIDS_DRAWING,
  ],
  [
    EntityType.ENTITY_PICKUP,
    PickupVariant.PICKUP_COLLECTIBLE,
    CollectibleType.COLLECTIBLE_LEAD_PENCIL,
  ],
];
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
        const distance1 = player.Position.Distance(entity.Position);
        const distance2 = player.Size + entity.Size;
        if (distance1 <= distance2) {
          if (player.GetPlayerType() !== ModPlayerTypes.ALABASTER) {
            entity.GetData().bumped_player = player;
            sfxManager.Play(SoundEffect.SOUND_SCAMPER, 1, 0, false, 1);
            entity.GetSprite().Play("Thumbsup", true);
            hud.ShowFortuneText("Hi! I'm Sarah!");
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
        const reward = rewards[rng.RandomInt(rewards.length)];
        Isaac.Spawn(
          reward[0],
          reward[1],
          reward[2],
          entity.Position,
          Vector(0, 0),
          entity,
        );
        entity.GetSprite().Play("Die", true);
      }
    }
  });
}
