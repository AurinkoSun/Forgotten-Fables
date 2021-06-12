const talesOfGuppy = RegisterMod("Tales of Guppy", 1);
const game = Game();
const fatFetusID = Isaac.GetItemIdByName("Fat Fetus");
function evalCache(player:EntityPlayer, flags:CacheFlag){
  if(flags == CacheFlag.CACHE_FIREDELAY){
    if(player.HasCollectible(fatFetusID)){
      player.MaxFireDelay *= 15;
    }
  }
  if(flags == CacheFlag.CACHE_DAMAGE){
    if(player.HasCollectible(fatFetusID) && player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      player.Damage*=2;
  }
}
}
talesOfGuppy.AddCallback(ModCallbacks.MC_EVALUATE_CACHE,evalCache);
function fatFetusTears(tear:EntityTear){
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
    bomb=Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, player.Position, tear.Velocity, player).ToBomb();
    if(bomb==null){
      return;
    }
    tear.Remove();
    bomb.ExplosionDamage=dmg;
  }
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_FIRE_TEAR,fatFetusTears);
function gigaUpdate(bomb:EntityBomb){
  if(bomb.SpawnerEntity!=null){
    let player = bomb.SpawnerEntity.ToPlayer();
    if(player!=null){
      if(bomb.GetSprite().IsFinished("Pulse") || bomb.GetSprite().IsFinished("brimpulse") || bomb.GetSprite().IsFinished("stickypulse") || bomb.GetSprite().IsFinished("goldenpulse") || bomb.GetSprite().IsFinished("flamepulse") || bomb.GetSprite().IsFinished("bloodpulse") || bomb.GetSprite().IsFinished("buttpulse") || bomb.GetSprite().IsFinished("poisonpulse") || bomb.GetSprite().IsFinished("megapulse") || bomb.GetSprite().IsFinished("scatterpulse") || bomb.GetSprite().IsFinished("ghostpulse") || bomb.GetSprite().IsFinished("sadpulse") || bomb.GetSprite().IsFinished("homingpulse") || bomb.GetSprite().IsFinished("goldhomingpulse")){
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,0,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,90,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,180,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,270,15,Vector(0,0),player);
        }
        let explody=Isaac.Spawn(4, 17, 0, bomb.Position, Vector(0,0), player).ToBomb();
        if(explody===null){return;}
        explody.Visible=false;
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) || player.HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY)){
          explody.AddTearFlags(TearFlags.TEAR_CROSS_BOMB);
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) || player.HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)){
          explody.RadiusMultiplier*=0.5;
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)){
          explody.AddTearFlags(TearFlags.TEAR_STICKY);
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)){
          explody.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS)){
          explody.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
        }
        explody.ExplosionDamage=player.Damage*(300/3.5);
        explody.SetExplosionCountdown(0);
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)){
          let creep=Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, bomb.Position, Vector(0,0), player).ToEffect();
          if(creep==null){
            print("creep spawn failed");
            return;
          }
          creep.SetDamageSource(EntityType.ENTITY_PLAYER);
          creep.Scale*=10;
          creep.LifeSpan*=1000;
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) || player.HasCollectible(CollectibleType.COLLECTIBLE_IPECAC)){
          explody.AddTearFlags(TearFlags.TEAR_POISON);
          let cloud=Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.SMOKE_CLOUD, 0, bomb.Position, Vector(0,0), player).ToEffect();
          if(cloud==null){return;}
          cloud.Scale*=4;
        }
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS)){
          Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 0, bomb.Position, Vector(-3,0), player);
          Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 0, bomb.Position, Vector(0,-3), player);
          Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 0, bomb.Position, Vector(0,3), player);
          Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 0, bomb.Position, Vector(3,0), player);
        }
        bomb.GetSprite().Play("Explode", false);
      }
      if(bomb.GetSprite().IsFinished("Explode")){
        bomb.Remove();
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS)){
          let sad;
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(10,0), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(-10,0), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(0,10), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(0,-10), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector((10/math.sqrt(2)),(10/math.sqrt(2))), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(0-(10/math.sqrt(2)),(10/math.sqrt(2))), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector((10/math.sqrt(2)),0-(10/math.sqrt(2))), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
          sad=Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, bomb.Position, Vector(0-(10/math.sqrt(2)),0-(10/math.sqrt(2))), player).ToTear();
          if(sad!=null){sad.Scale*=2;sad.CollisionDamage=player.Damage*2;sad.GetData().sad=true;}
        }
      }
    }
  }
}
function gigaBombReplace(bomb:EntityBomb){
  if(bomb.SpawnerEntity!=null && bomb.SpawnerEntity.ToPlayer()!=null){
    Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, bomb.Position, bomb.Velocity, bomb.SpawnerEntity.ToPlayer());
    bomb.Remove();
  }
}
function gigaInit(bomb:EntityBomb){
  bomb.CollisionDamage=0;
  if(bomb.SpawnerEntity!=null){
    let player=bomb.SpawnerEntity.ToPlayer();
    if(player!=null){
      bomb.SetExplosionCountdown(100);
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) || player.HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART) || player.HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD)){
      bomb.AddTearFlags(TearFlags.TEAR_HOMING);
    }
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) || player.HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)){
      bomb.SpriteScale.__div(2);
      bomb.GetSprite().Reload();
      bomb.RadiusMultiplier=0.5;
    }
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      bomb.SpriteScale.__mul(1.5);
      bomb.RadiusMultiplier*=2;
    }
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      bomb.GetSprite().Play("megapulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
      bomb.GetSprite().Play("brimpulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)){
      bomb.AddTearFlags(TearFlags.TEAR_STICKY);
      bomb.GetSprite().Play("stickypulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS)){
      bomb.AddTearFlags(TearFlags.TEAR_BUTT_BOMB);
      bomb.GetSprite().Play("buttpulse",true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS)){
      bomb.GetSprite().Play("bloodpulse",true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS)){
      bomb.AddTearFlags(TearFlags.TEAR_SCATTER_BOMB);
      bomb.GetSprite().Play("scatterpulse",true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS)){
      bomb.AddTearFlags(TearFlags.TEAR_GHOST_BOMB);
      bomb.GetSprite().Play("ghostpulse",true);
    } else if (player.HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS)){
      bomb.GetSprite().Play("sadpulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS || player.HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND))){
      bomb.CollisionDamage=32;
      bomb.AddTearFlags(TearFlags.TEAR_BURN);
      bomb.GetSprite().Play("flamepulse",true);
    } else if(player.HasGoldenBomb()){
      bomb.GetSprite().Play("goldenpulse",true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) || player.HasCollectible(CollectibleType.COLLECTIBLE_IPECAC)){
      bomb.GetSprite().Play("poisonpulse",true);
    } else {
      bomb.GetSprite().Play("Pulse", true);
    }
    } else {
      bomb.SetExplosionCountdown(87);
        bomb.ExplosionDamage=300;
        bomb.GetSprite().Play("Pulse",true);
    }
  }
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE,gigaUpdate,21);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_INIT,gigaBombReplace,BombVariant.BOMB_GIGA);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_INIT,gigaInit,21);