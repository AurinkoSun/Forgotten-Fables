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
  if(player.HasCollectible(CollectibleType.COLLECTIBLE_SATURNUS)){
  } else {
    if(player.HasCollectible(fatFetusID)){
      let dmg = player.Damage *(300/3.5);
      bomb=Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, player.Position, tear.Velocity, player).ToBomb();
      if(bomb==null){
        return;
      }
      bomb.GetData().colupdated=false;
      tear.Remove();
      bomb.ExplosionDamage=dmg;
    }
  }
}
FatFetus.AddCallback(ModCallbacks.MC_POST_FIRE_TEAR,onFireTear);
enum BombTypes{
  Normal,
  Brim,
  Sticky,
  Cross,
  Blood,
  Mega,
  Glitter,
  Random
}
function fetusGigaUpdate(bomb:EntityBomb){
  bomb.CollisionDamage=0;
  if(bomb.SpawnerEntity!=null){
    let player = bomb.SpawnerEntity.ToPlayer();
    if(player!=null){
      if(bomb.GetData().colupdated==false){
        bomb.SetExplosionCountdown(100);
        print("colupdated=false");
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Brim;
          bomb.GetSprite().Play("brimpulse", true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Sticky;
          bomb.AddTearFlags(TearFlags.TEAR_STICKY);
          bomb.GetSprite().Play("stickypulse", true);
        } else {
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Normal;
          bomb.GetSprite().Play("Pulse", true);
        }
      }
      if(bomb.GetSprite().IsFinished("Pulse") || bomb.GetSprite().IsFinished("brimpulse") || bomb.GetSprite().IsFinished("stickypulse")){
        if(bomb.GetData().syntype===BombTypes.Brim){
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,0,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,90,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,180,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,270,15,Vector(0,0),bomb);
        }
        let explody=Isaac.Spawn(4, 17, 0, bomb.Position, Vector(0,0), player).ToBomb();
        if(explody===null){print("broken af"); return;}
        explody.Visible=false;
        if(bomb.GetData().syntype===BombTypes.Sticky){
          explody.AddTearFlags(TearFlags.TEAR_STICKY);
        }
        explody.SetExplosionCountdown(0);
        bomb.GetSprite().Play("Explode", false);
      }
      if(bomb.GetSprite().IsFinished("Explode")){
        bomb.Remove();
      }
    } else {
      if(bomb.GetData().colupdated==false){
        bomb.SetExplosionCountdown(87);
        bomb.ExplosionDamage=300;
        bomb.GetData().colupdated=true;
        bomb.GetData().syntype=BombTypes.Normal;
        bomb.GetSprite().Play("Pulse",true);
      }
      if(bomb.GetSprite().IsFinished("Pulse")){
        bomb.GetSprite().Play("Explode",false);
      }
    }
  }
}
FatFetus.AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE,fetusGigaUpdate,21);