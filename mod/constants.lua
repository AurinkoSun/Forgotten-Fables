--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.ModItemTypes = ModItemTypes or ({})
____exports.ModItemTypes.FAT_FETUS = Isaac.GetItemIdByName("Fat Fetus")
____exports.ModItemTypes[____exports.ModItemTypes.FAT_FETUS] = "FAT_FETUS"
____exports.ModItemTypes.SUICIDE = Isaac.GetItemIdByName("Suicide")
____exports.ModItemTypes[____exports.ModItemTypes.SUICIDE] = "SUICIDE"
____exports.ModItemTypes.REVIVE = Isaac.GetItemIdByName("Revive")
____exports.ModItemTypes[____exports.ModItemTypes.REVIVE] = "REVIVE"
____exports.ModEffectVariants = ModEffectVariants or ({})
____exports.ModEffectVariants.TSARAHBODY = 200
____exports.ModEffectVariants[____exports.ModEffectVariants.TSARAHBODY] = "TSARAHBODY"
____exports.ModPlayerTypes = ModPlayerTypes or ({})
____exports.ModPlayerTypes.SARAH = Isaac.GetPlayerTypeByName("Sarah", false)
____exports.ModPlayerTypes[____exports.ModPlayerTypes.SARAH] = "SARAH"
____exports.ModPlayerTypes.TAINTED_SARAH = Isaac.GetPlayerTypeByName("Sarah", true)
____exports.ModPlayerTypes[____exports.ModPlayerTypes.TAINTED_SARAH] = "TAINTED_SARAH"
____exports.ModCostumes = ModCostumes or ({})
____exports.ModCostumes.SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/sarahhair.anm2")
____exports.ModCostumes[____exports.ModCostumes.SARAH_HAIR] = "SARAH_HAIR"
____exports.ModCostumes.TAINTED_SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/SaraAlthair.anm2")
____exports.ModCostumes[____exports.ModCostumes.TAINTED_SARAH_HAIR] = "TAINTED_SARAH_HAIR"
____exports.ModCostumes.LOST_SARAH_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/sarahLosthair.anm2")
____exports.ModCostumes[____exports.ModCostumes.LOST_SARAH_HAIR] = "LOST_SARAH_HAIR"
____exports.game = Game()
return ____exports
