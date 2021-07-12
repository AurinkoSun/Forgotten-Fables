--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____blooddrive = require("items.active.blooddrive")
local alabasterHearts = ____blooddrive.alabasterHearts
function ____exports.postPickupUpdate(self, pickup, _modPlayerData)
    if pickup.Variant == PickupVariant.PICKUP_HEART then
        alabasterHearts(nil, pickup)
    end
end
return ____exports
