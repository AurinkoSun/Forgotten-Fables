	local mod = RegisterMod("{Peel", 1)
local sound = SFXManager()
local game = Game()
    
    
    local Level2GaperVariant ={
	 Peel = Isaac.GetEntityVariantByName("Peel")
	 }
    
    
    Level2GaperState = {
		WalkHORI = 0, 
		WALKVERT = 1, 
		HEAD = 2,
		HEAD2 = 3
	}


	function mod:onNpc(npc)
		if npc.Variant == Level2GaperVariant.Peel then
			if npc.HitPoints <= 15 then
		npc.Velocity = npc.Velocity * 1.1
		local pos = npc.Position
		Isaac.Spawn(1000,22,0,pos,Vector(0,0),npc)
		end
	end
end
	
	mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.onNpc,  EntityType.ENTITY_GAPER_L2)
	
function mod:TookDamage(npc, damageAmount)

	if npc.Type == 850 and npc.Variant == 4 and (npc.HitPoints-damageAmount) <= (npc.MaxHitPoints/2) then
		local sprite = npc:GetSprite()
		 sprite:ReplaceSpritesheet(0, "gfx/monsters/custom/Peel2.png")
		 sprite:LoadGraphics()
		 
		 for i=0, sprite:GetLayerCount() - 1 do
			sprite:ReplaceSpritesheet(i, "gfx/monsters/custom/Peel2.png")
		 end
		sprite:LoadGraphics()
	end	
end


mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG , mod.TookDamage, EntityType.ENTITY_GAPER_L2)