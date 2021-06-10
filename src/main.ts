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
  Random,
  Butt,
  Rock,
  Scatter,
  Ghost,
  Gold,
  Sad,
  Homing,
  Poison,
  Fire
}
function fetusGigaUpdate(bomb:EntityBomb){
  bomb.CollisionDamage=0;
  if(bomb.SpawnerEntity!=null){
    let player = bomb.SpawnerEntity.ToPlayer();
    if(player!=null){
      if(bomb.GetData().colupdated==false){
        bomb.SetExplosionCountdown(100);
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) || player.HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART) || player.HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD)){
          bomb.AddTearFlags(TearFlags.TEAR_HOMING);
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) || player.HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)){
          bomb.SpriteScale.__div(2);
          bomb.GetSprite().Reload();
          bomb.RadiusMultiplier=0.5;
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Brim;
          bomb.GetSprite().Play("brimpulse", true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Sticky;
          bomb.AddTearFlags(TearFlags.TEAR_STICKY);
          bomb.GetSprite().Play("stickypulse", true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Butt;
          bomb.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
          bomb.GetSprite().Play("buttpulse",true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Blood;
          bomb.GetSprite().Play("bloodpulse",true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS)){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Scatter;
          bomb.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
          //bomb.GetSprite().Play("scatterpulse",true);
        } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS || player.HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND))){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Fire;
          bomb.CollisionDamage=32;
          bomb.AddTearFlags(TearFlags.TEAR_BURN);
          bomb.GetSprite().Play("flamepulse",true);
        } else if(player.HasGoldenBomb()){
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Gold;
          bomb.GetSprite().Play("goldenpulse",true);
        } else {
          bomb.GetData().colupdated=true;
          bomb.GetData().syntype=BombTypes.Normal;
          bomb.GetSprite().Play("Pulse", true);
        }
      }
      if(bomb.GetSprite().IsFinished("Pulse") || bomb.GetSprite().IsFinished("brimpulse") || bomb.GetSprite().IsFinished("stickypulse") || bomb.GetSprite().IsFinished("goldenpulse") || bomb.GetSprite().IsFinished("flamepulse") || bomb.GetSprite().IsFinished("bloodpulse") || bomb.GetSprite().IsFinished("buttpulse")){
        if(bomb.GetData().syntype===BombTypes.Brim){
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,0,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,90,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,180,15,Vector(0,0),bomb);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,270,15,Vector(0,0),bomb);
        }
        let explody=Isaac.Spawn(4, 17, 0, bomb.Position, Vector(0,0), player).ToBomb();
        if(explody===null){return;}
        explody.Visible=false;
        if(bomb.GetData().syntype===BombTypes.Sticky){
          explody.AddTearFlags(TearFlags.TEAR_STICKY);
        }
        if(bomb.GetData().syntype==BombTypes.Butt){
          explody.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
        }
        explody.SetExplosionCountdown(0);
        if(bomb.GetData().syntype==BombTypes.Blood){
          let creep=Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, bomb.Position, Vector(0,0), player).ToEffect();
          if(creep==null){
            print("creep spawn failed");
            return;
          }
          creep.SetDamageSource(EntityType.ENTITY_PLAYER);
          creep.Scale*=10;
          creep.LifeSpan*=1000;
        }
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