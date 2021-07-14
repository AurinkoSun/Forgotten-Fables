--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ____costumes = require("globals.costumes")
local costumes = ____costumes.costumes
local ____blooddrive = require("items.active.blooddrive")
local bloodDrive = ____blooddrive.bloodDrive
local ____d50 = require("items.active.d50")
local d50 = ____d50.d50
function ____exports.useItem(self, item, rng, player, slot, modPlayerData)
    local returnVal = nil
    local ____switch3 = item
    if ____switch3 == ModItemTypes.BLOODDRIVE then
        goto ____switch3_case_0
    elseif ____switch3 == ModItemTypes.D50 then
        goto ____switch3_case_1
    end
    goto ____switch3_case_default
    ::____switch3_case_0::
    do
        do
            returnVal = bloodDrive(nil, player, modPlayerData)
            goto ____switch3_end
        end
    end
    ::____switch3_case_1::
    do
        do
            returnVal = d50(nil, item, rng, player, slot, modPlayerData)
            goto ____switch3_end
        end
    end
    ::____switch3_case_default::
    do
        goto ____switch3_end
    end
    ::____switch3_end::
    costumes(nil, modPlayerData)
    return returnVal
end
return ____exports
