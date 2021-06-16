const talesOfGuppy = RegisterMod("Tales of Guppy", 1);
const game = Game();
const rng = RNG();
const fatFetusID = Isaac.GetItemIdByName("Fat Fetus");
const SarahPlayerType = Isaac.GetPlayerTypeByName("Sarah");
const TaintedSarahPlayerType = Isaac.GetPlayerTypeByName("Sarah",true);
const LostSarahPlayerType = Isaac.GetPlayerTypeByName("Lost Sarah",true);
const SarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2");
const TaintedSarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/SaraAlthair.anm2");
const LostSarahCostume = Isaac.GetCostumeIdByPath("gfx/characters/sarahLosthair.anm2");
const suicideID = Isaac.GetItemIdByName("Suicide");
let razors=[0,0,0,0];
let razorsfloor=[0,0,0,0];
function playerID(player:EntityPlayer){
  let val=-1;
  for(let i=0;i<game.GetNumPlayers();i++){
    let playeri=game.GetPlayer(i);
    if(playeri!=null){
      if(player.Index==playeri.Index){
        val=i;
      }
    }
  }
  return val;
}
function evalCache(player:EntityPlayer, flags:CacheFlag){
  if(flags == CacheFlag.CACHE_FIREDELAY){
    if(player.HasCollectible(fatFetusID)){
      if(player.HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)==false && player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)==false){
        player.MaxFireDelay *= 15;
      }
    }
  }
  if(flags == CacheFlag.CACHE_DAMAGE){
    if(player.GetPlayerType()==TaintedSarahPlayerType || player.GetPlayerType() == LostSarahPlayerType && playerID(player)!=-1){
      player.Damage+=0.5*razors[playerID(player)];
    }
    if(player.HasCollectible(fatFetusID) && player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      player.Damage*=2;
    }
  }
}
talesOfGuppy.AddCallback(ModCallbacks.MC_EVALUATE_CACHE,evalCache);
function playerInit(player:EntityPlayer){
  if(player.GetPlayerType()==TaintedSarahPlayerType){
    if(player.HasCollectible(suicideID)==false){
      print("tsarahinit");
      player.AddCollectible(suicideID,0,true,ActiveSlot.SLOT_POCKET);
    }
  }
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE,playerInit,0);
function costumes(){ //Hair costume
  for(let i=0;i<game.GetNumPlayers();i++) {
    let player = Isaac.GetPlayer(i);
    if(player!=null){
      player.GetData().id=i;
      if(player.GetPlayerType() == SarahPlayerType){
      player.TryRemoveNullCostume(SarahCostume);
      player.AddNullCostume(SarahCostume);
      player.GetData().costumeEquipped = true;
      }
      if (player.GetPlayerType() == TaintedSarahPlayerType) {
        player.TryRemoveNullCostume(TaintedSarahCostume)
        player.AddNullCostume(TaintedSarahCostume)
        player.GetData().costumeEquipped = true
      }
      if (player.GetPlayerType() == LostSarahPlayerType) {
        player.TryRemoveNullCostume(LostSarahCostume)
        player.AddNullCostume(LostSarahCostume)
        player.GetData().costumeEquipped = true
      }
    }
  }
}
function postItemCostumes(){ //Hair costume
  for(let i=0;i<game.GetNumPlayers();i++) {
    let player = Isaac.GetPlayer(i);
    if(player!=null){
      if(player.GetPlayerType() == SarahPlayerType){
      player.TryRemoveNullCostume(SarahCostume);
      player.AddNullCostume(SarahCostume);
      player.GetData().costumeEquipped = true;
      }
      if (player.GetPlayerType() == TaintedSarahPlayerType) {
        player.TryRemoveNullCostume(TaintedSarahCostume)
        player.AddNullCostume(TaintedSarahCostume)
        player.GetData().costumeEquipped = true
      }
      if (player.GetPlayerType() == LostSarahPlayerType) {
        player.TryRemoveNullCostume(LostSarahCostume)
        player.AddNullCostume(LostSarahCostume)
        player.GetData().costumeEquipped = true
      }
    }
  }
  return true;
}
function razorsReset(){
  razorsfloor=[0,0,0,0];
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_NEW_LEVEL,razorsReset);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, costumes);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_NEW_ROOM, costumes);
talesOfGuppy.AddCallback(ModCallbacks.MC_USE_ITEM,postItemCostumes);
talesOfGuppy.AddCallback(ModCallbacks.MC_USE_CARD,costumes);
talesOfGuppy.AddCallback(ModCallbacks.MC_USE_PILL,costumes);
function suicide(item:CollectibleType,rng:RNG,player:EntityPlayer){
  if(item!=suicideID){
    print("how the fuck did you break the game this much");
    print(rng.RandomInt(10));
  }
  if(player.GetPlayerType()==TaintedSarahPlayerType){
    player.AddBrokenHearts(1);
    player.ChangePlayerType(LostSarahPlayerType);
    player.AddCacheFlags(CacheFlag.CACHE_ALL);
    player.EvaluateItems();
    Isaac.Spawn(EntityType.ENTITY_EFFECT, 200, 0, player.Position, Vector(0,0), player);
  } else if(player.GetPlayerType()==LostSarahPlayerType){
    let body=false;
    Isaac.GetRoomEntities().forEach(function(entity:Entity){if(entity.Type==EntityType.ENTITY_EFFECT && entity.Variant==200){body=true;}});
    if(body){
      player.ChangePlayerType(TaintedSarahPlayerType);
      player.AddCacheFlags(CacheFlag.CACHE_ALL);
      player.EvaluateItems();
    }
  }
  return true;
}
talesOfGuppy.AddCallback(ModCallbacks.MC_USE_ITEM,suicide,suicideID);
function razor(pickup:EntityPickup){
  if(pickup.SubType==13){
    for(let i=0;i<game.GetNumPlayers();i++){
      let player=game.GetPlayer(i);
      if(player!=null && player.GetPlayerType()==TaintedSarahPlayerType){
        if(player.Position.Distance(pickup.Position)<15 && razorsfloor[i]<5){
          player.TakeDamage(1, DamageFlag.DAMAGE_RED_HEARTS, EntityRef(pickup), 0);
          pickup.Remove();
          razors[i]+=1;
          razorsfloor[i]+=1;
          player.AddCacheFlags(CacheFlag.CACHE_DAMAGE);
          player.EvaluateItems();
        }
      }
    }
  } else {
    for(let i=0;i<game.GetNumPlayers();i++){
      let player=game.GetPlayer(i);
      if(player!=null && player.GetPlayerType()==TaintedSarahPlayerType){
        if(player.Position.Distance(pickup.Position)<100){
          pickup.Morph(5, 10, 13);
        }
      }
    }
  }
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE,razor,10);
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
      if(bomb.GetSprite().IsFinished("Pulse") || bomb.GetSprite().IsFinished("brimpulse") || bomb.GetSprite().IsFinished("stickypulse") || bomb.GetSprite().IsFinished("goldenpulse") || bomb.GetSprite().IsFinished("flamepulse") || bomb.GetSprite().IsFinished("bloodpulse") || bomb.GetSprite().IsFinished("buttpulse") || bomb.GetSprite().IsFinished("poisonpulse") || bomb.GetSprite().IsFinished("megapulse") || bomb.GetSprite().IsFinished("scatterpulse") || bomb.GetSprite().IsFinished("ghostpulse") || bomb.GetSprite().IsFinished("sadpulse") || bomb.GetSprite().IsFinished("homingpulse") || bomb.GetSprite().IsFinished("goldhomingpulse") || bomb.GetSprite().IsFinished("crosspulse") || bomb.GetSprite().IsFinished("glitterpulse")){
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) || player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)){
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,0,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,90,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,180,15,Vector(0,0),player);
          EntityLaser.ShootAngle(LaserVariant.THICK_RED,bomb.Position,270,15,Vector(0,0),player);
        }
        let explody=Isaac.Spawn(4, 17, 0, bomb.Position, Vector(0,0), bomb).ToBomb();
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
        bomb.ExplosionDamage=player.Damage*(300/3.5);
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
      bomb.RadiusMultiplier=0.5;
    }
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      bomb.RadiusMultiplier*=2;
    }
    if(player.HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA)){
      bomb.GetSprite().Play("megapulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY)){
      bomb.GetSprite().Play("crosspulse", true);
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
    } else if (player.HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS)){
      bomb.GetSprite().Play("glitterpulse", true);
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS || player.HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND))){
      bomb.CollisionDamage=32;
      bomb.AddTearFlags(TearFlags.TEAR_BURN);
      bomb.GetSprite().Play("flamepulse",true);
    } else if(player.HasGoldenBomb()){
      if(bomb.HasTearFlags(TearFlags.TEAR_HOMING)){
        bomb.GetSprite().Play("goldhomingpulse", true);
      }else{
        bomb.GetSprite().Play("goldenpulse",true);
      }
    } else if(player.HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) || player.HasCollectible(CollectibleType.COLLECTIBLE_IPECAC)){
      bomb.GetSprite().Play("poisonpulse",true);
    } else {
      if(bomb.HasTearFlags(TearFlags.TEAR_HOMING)){
        bomb.GetSprite().Play("homingpulse", true);
      } else {
        bomb.GetSprite().Play("Pulse", true);
      }
    }
    } else {
      bomb.SetExplosionCountdown(87);
        bomb.ExplosionDamage=300;
        bomb.GetSprite().Play("Pulse",true);
    }
  }
}
function rocks(projectile:EntityProjectile){
  if(projectile.SpawnerEntity!=null){
    let bomb=projectile.SpawnerEntity.ToBomb();
    if(bomb!=null && bomb.SpawnerEntity!=null){
      let player=bomb.SpawnerEntity.ToPlayer();
      if(player!=null){
        projectile.AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER);
        projectile.AddProjectileFlags(ProjectileFlags.HIT_ENEMIES);
        projectile.Damage=player.Damage;
      }
    }
  }
}
function glitterdrops(entity:Entity,amount:number,flags:DamageFlag,source:EntityRef){
  if(amount>=entity.HitPoints && flags!=DamageFlag.DAMAGE_NOKILL){
    if(source.Entity != null && source.Entity.ToBomb()!=null && source.Entity.Type==EntityType.ENTITY_BOMBDROP && source.Entity.Variant==BombVariant.BOMB_GIGA && source.Entity.SpawnerEntity != null && source.Entity.SpawnerEntity.SpawnerEntity!=null){
      let player=source.Entity.SpawnerEntity.SpawnerEntity.ToPlayer();
      if(player != null){
        if(player.HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) && player.HasCollectible(fatFetusID)){
          if(math.random()<=0.1){
            let pickup=Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_NULL, 0, Isaac.GetFreeNearPosition(entity.Position, 1), entity.Velocity, null).ToPickup();
            if(pickup!=null && pickup.GetCoinValue()>5){
              Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, 0, pickup.Position, pickup.Velocity, null);
              pickup.Remove();
            }
          }
        }
      }
    }
  }
  return null;
}
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE,gigaUpdate,21);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_INIT,gigaBombReplace,BombVariant.BOMB_GIGA);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_BOMB_INIT,gigaInit,21);
talesOfGuppy.AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT,rocks,ProjectileVariant.PROJECTILE_ROCK);
talesOfGuppy.AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG,glitterdrops);