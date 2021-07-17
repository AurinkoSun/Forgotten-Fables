import { game, ModPlayerTypes, sfxManager } from "../../constants";
import { GetPlayerId, PlayerData } from "../../playerdata";

export function bloodDrive(
  player: EntityPlayer,
  modPlayerData: { data: PlayerData[] },
  rng: RNG,
): boolean | null {
  if (
    player.GetPlayerType() === ModPlayerTypes.ALABASTER &&
    (game.GetRoom().GetType() === RoomType.ROOM_ANGEL ||
      game.GetRoom().GetType() === RoomType.ROOM_DEVIL)
  ) {
    /* 27% chance for a half soul heart, (black hearts if in devil deal)
       15% for a bomb,
       15% for a key,
       15% for 3 coins
       10% for card or pill
       8% for a trinket
       5% for Rune or soul stone
       4% for a  random chest (red, gold, grey, old, wooden)
       1% chance for a random item
    */
    if (modPlayerData.data[GetPlayerId(player)].bdcharge > 0) {
      modPlayerData.data[GetPlayerId(player)].bdcharge -= 2;
      let spawned = true;
      const rand = rng.RandomInt(100);
      const pos = game.GetRoom().FindFreePickupSpawnPosition(player.Position);
      const runes = [
        Card.RUNE_ALGIZ,
        Card.RUNE_ANSUZ,
        Card.RUNE_BERKANO,
        Card.RUNE_BLACK,
        Card.RUNE_BLANK,
        Card.RUNE_DAGAZ,
        Card.RUNE_EHWAZ,
        Card.RUNE_HAGALAZ,
        Card.RUNE_JERA,
        Card.RUNE_PERTHRO,
        Card.CARD_SOUL_APOLLYON,
        Card.CARD_SOUL_AZAZEL,
        Card.CARD_SOUL_BETHANY,
        Card.CARD_SOUL_BLUEBABY,
        Card.CARD_SOUL_CAIN,
        Card.CARD_SOUL_EDEN,
        Card.CARD_SOUL_EVE,
        Card.CARD_SOUL_FORGOTTEN,
        Card.CARD_SOUL_ISAAC,
        Card.CARD_SOUL_JACOB,
        Card.CARD_SOUL_JUDAS,
        Card.CARD_SOUL_KEEPER,
        Card.CARD_SOUL_LAZARUS,
        Card.CARD_SOUL_LILITH,
        Card.CARD_SOUL_LOST,
        Card.CARD_SOUL_MAGDALENE,
        Card.CARD_SOUL_SAMSON,
      ];
      const chests = [
        PickupVariant.PICKUP_OLDCHEST,
        PickupVariant.PICKUP_LOCKEDCHEST,
        PickupVariant.PICKUP_REDCHEST,
        PickupVariant.PICKUP_CHEST,
        PickupVariant.PICKUP_WOODENCHEST,
      ];
      const cards = [
        Card.CARD_ACE_OF_CLUBS,
        Card.CARD_ACE_OF_DIAMONDS,
        Card.CARD_ACE_OF_HEARTS,
        Card.CARD_ACE_OF_SPADES,
        Card.CARD_ANCIENT_RECALL,
        Card.CARD_CHAOS,
        Card.CARD_CHARIOT,
        Card.CARD_CLUBS_2,
        Card.CARD_CREDIT,
        Card.CARD_DEATH,
        Card.CARD_DEVIL,
        Card.CARD_DIAMONDS_2,
        Card.CARD_DICE_SHARD,
        Card.CARD_EMERGENCY_CONTACT,
        Card.CARD_EMPEROR,
        Card.CARD_EMPRESS,
        Card.CARD_ERA_WALK,
        Card.CARD_FOOL,
        Card.CARD_GET_OUT_OF_JAIL,
        Card.CARD_HANGED_MAN,
        Card.CARD_HEARTS_2,
        Card.CARD_HERMIT,
        Card.CARD_HIEROPHANT,
        Card.CARD_HIGH_PRIESTESS,
        Card.CARD_HOLY,
        Card.CARD_HUGE_GROWTH,
        Card.CARD_HUMANITY,
        Card.CARD_JOKER,
        Card.CARD_JUDGEMENT,
        Card.CARD_JUSTICE,
        Card.CARD_LOVERS,
        Card.CARD_MAGICIAN,
        Card.CARD_MOON,
        Card.CARD_QUEEN_OF_HEARTS,
        Card.CARD_QUESTIONMARK,
        Card.CARD_REVERSE_CHARIOT,
        Card.CARD_REVERSE_DEATH,
        Card.CARD_REVERSE_DEVIL,
        Card.CARD_REVERSE_EMPEROR,
        Card.CARD_REVERSE_EMPRESS,
        Card.CARD_REVERSE_FOOL,
        Card.CARD_REVERSE_HANGED_MAN,
        Card.CARD_REVERSE_HERMIT,
        Card.CARD_REVERSE_HIEROPHANT,
        Card.CARD_REVERSE_HIGH_PRIESTESS,
        Card.CARD_REVERSE_JUDGEMENT,
        Card.CARD_REVERSE_JUSTICE,
        Card.CARD_REVERSE_LOVERS,
        Card.CARD_REVERSE_MAGICIAN,
        Card.CARD_REVERSE_MOON,
        Card.CARD_REVERSE_STARS,
        Card.CARD_REVERSE_STRENGTH,
        Card.CARD_REVERSE_SUN,
        Card.CARD_REVERSE_TEMPERANCE,
        Card.CARD_REVERSE_TOWER,
        Card.CARD_REVERSE_WHEEL_OF_FORTUNE,
        Card.CARD_REVERSE_WORLD,
        Card.CARD_RULES,
      ];
      if (rand === 100) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_COLLECTIBLE,
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 95) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          chests[rng.RandomInt(chests.length - 1)],
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 90) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_TAROTCARD,
          runes[rng.RandomInt(runes.length - 1)],
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 87) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_TRINKET,
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 82) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_PILL,
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 77) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_TAROTCARD,
          cards[rng.RandomInt(cards.length - 1)],
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 62) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_COIN,
          0,
          pos,
          Vector(0, 0),
          null,
        );
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_COIN,
          0,
          game.GetRoom().FindFreePickupSpawnPosition(player.Position),
          Vector(0, 0),
          null,
        );
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_COIN,
          0,
          game.GetRoom().FindFreePickupSpawnPosition(player.Position),
          Vector(0, 0),
          null,
        );
      } else if (rand > 47) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_BOMB,
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 32) {
        Isaac.Spawn(
          EntityType.ENTITY_PICKUP,
          PickupVariant.PICKUP_KEY,
          0,
          pos,
          Vector(0, 0),
          null,
        );
      } else if (rand > 5) {
        if (game.GetRoom().GetType() === RoomType.ROOM_ANGEL) {
          Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_HEART,
            HeartSubType.HEART_SOUL,
            pos,
            Vector(0, 0),
            null,
          );
        } else {
          Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_HEART,
            HeartSubType.HEART_BLACK,
            pos,
            Vector(0, 0),
            null,
          );
        }
      } else {
        spawned = false;
      }
      if (spawned) {
        player.AnimateHappy();
        sfxManager.Play(SoundEffect.SOUND_THUMBSUP);
      } else {
        player.AnimateSad();
        sfxManager.Play(SoundEffect.SOUND_THUMBS_DOWN);
      }
    }
    return true;
  }
  return null;
}
export function alabasterHearts(
  pickup: EntityPickup,
  modPlayerData: { data: PlayerData[] },
): void {
  if (
    pickup.Variant === PickupVariant.PICKUP_HEART &&
    (pickup.SubType === HeartSubType.HEART_FULL ||
      pickup.SubType === HeartSubType.HEART_HALF ||
      pickup.SubType === HeartSubType.HEART_DOUBLEPACK)
  ) {
    for (let i = 0; i < game.GetNumPlayers(); i++) {
      const player = game.GetPlayer(i);
      if (
        player !== null &&
        player.GetPlayerType() === ModPlayerTypes.ALABASTER
      ) {
        if (
          player.Position.Distance(pickup.Position) <
          player.Size + pickup.Size
        ) {
          pickup.Remove();
          switch (pickup.SubType) {
            case HeartSubType.HEART_DOUBLEPACK:
              modPlayerData.data[i].bdcharge += 4;
              break;
            case HeartSubType.HEART_FULL: {
              modPlayerData.data[i].bdcharge += 2;
              break;
            }
            default: {
              modPlayerData.data[i].bdcharge += 1;
              break;
            }
          }
          print(modPlayerData.data[i].bdcharge);
        }
      }
    }
  }
}
