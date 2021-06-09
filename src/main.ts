const FatFetus = RegisterMod("FatFetus", 1);
const game = Game();
const fatFetusID = Isaac.GetItemIdByName("Fat Fetus");

function evalCache(player:EntityPlayer, flags:CacheFlag){
  if(flags == CacheFlag.CACHE_FIREDELAY){
    if(player.HasCollectible(fatFetusID)){
      player.MaxFireDelay *= 10;
    }
  }
}
FatFetus.AddCallback(ModCallbacks.MC_EVALUATE_CACHE,evalCache);
function onFireTear(tear:EntityTear){
  let bomb:EntityBomb|null;
  if(tear.SpawnerEntity===null){
    return;
  }
  let player = tear.SpawnerEntity.ToPlayer();
  if(player === null){
    return;
  }
  if(player.HasCollectible(fatFetusID)){
  let dmg = player.Damage *(300/3.5);
  bomb=Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 17, 0, tear.Position, tear.Velocity, player).ToBomb();
  tear.Remove();
    if(bomb!=null){
      bomb.IsFetus=true;
      bomb.ExplosionDamage=dmg;
      if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
        bomb.AddTearFlags(TearFlags.TEAR_BRIMSTONE_BOMB);
      }
      if(player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)){
        bomb.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
      }
      if (player.HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY)){
        bomb.AddTearFlags(TearFlags.TEAR_CROSS_BOMB);
      }
      if (player.HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS)){
        bomb.AddTearFlags(TearFlags.TEAR_GHOST_BOMB);
      }
      if(player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)){
        bomb.AddTearFlags(TearFlags.TEAR_BLOOD_BOMB);
      }
      if(player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS)){
        bomb.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
      }
    }
  }
}
FatFetus.AddCallback(ModCallbacks.MC_POST_FIRE_TEAR,onFireTear);