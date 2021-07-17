--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file)
    if ____moduleCache[file] then
        return ____moduleCache[file]
    end
    if ____modules[file] then
        ____moduleCache[file] = ____modules[file]()
        return ____moduleCache[file]
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function() function __TS__ArrayIsArray(value)
    return (type(value) == "table") and ((value[1] ~= nil) or (next(value, nil) == nil))
end

function __TS__ArrayConcat(arr1, ...)
    local args = {...}
    local out = {}
    for ____, val in ipairs(arr1) do
        out[#out + 1] = val
    end
    for ____, arg in ipairs(args) do
        if __TS__ArrayIsArray(arg) then
            local argAsArray = arg
            for ____, val in ipairs(argAsArray) do
                out[#out + 1] = val
            end
        else
            out[#out + 1] = arg
        end
    end
    return out
end

function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

function __TS__ArrayEvery(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if not callbackfn(_G, arr[i + 1], i, arr) then
                return false
            end
            i = i + 1
        end
    end
    return true
end

function __TS__ArrayFilter(arr, callbackfn)
    local result = {}
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                result[#result + 1] = arr[i + 1]
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

function __TS__ArrayFind(arr, predicate)
    local len = #arr
    local k = 0
    while k < len do
        local elem = arr[k + 1]
        if predicate(_G, elem, k, arr) then
            return elem
        end
        k = k + 1
    end
    return nil
end

function __TS__ArrayFindIndex(arr, callbackFn)
    do
        local i = 0
        local len = #arr
        while i < len do
            if callbackFn(_G, arr[i + 1], i, arr) then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k, len do
        if self[i + 1] == searchElement then
            return true
        end
    end
    return false
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local result = ""
    for index, value in ipairs(self) do
        if index > 1 then
            result = tostring(result) .. tostring(separator)
        end
        result = tostring(result) .. tostring(
            tostring(value)
        )
    end
    return result
end

function __TS__ArrayMap(arr, callbackfn)
    local newArray = {}
    do
        local i = 0
        while i < #arr do
            newArray[i + 1] = callbackfn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
    return newArray
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayReduce(arr, callbackFn, ...)
    local len = #arr
    local k = 0
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, len - 1 do
        accumulator = callbackFn(_G, accumulator, arr[i + 1], i, arr)
    end
    return accumulator
end

function __TS__ArrayReduceRight(arr, callbackFn, ...)
    local len = #arr
    local k = len - 1
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, 0, -1 do
        accumulator = callbackFn(_G, accumulator, arr[i + 1], i, arr)
    end
    return accumulator
end

function __TS__ArrayReverse(arr)
    local i = 0
    local j = #arr - 1
    while i < j do
        local temp = arr[j + 1]
        arr[j + 1] = arr[i + 1]
        arr[i + 1] = temp
        i = i + 1
        j = j - 1
    end
    return arr
end

function __TS__ArrayShift(arr)
    return table.remove(arr, 1)
end

function __TS__ArrayUnshift(arr, ...)
    local items = {...}
    do
        local i = #items - 1
        while i >= 0 do
            table.insert(arr, 1, items[i + 1])
            i = i - 1
        end
    end
    return #arr
end

function __TS__ArraySort(arr, compareFn)
    if compareFn ~= nil then
        table.sort(
            arr,
            function(a, b) return compareFn(_G, a, b) < 0 end
        )
    else
        table.sort(arr)
    end
    return arr
end

function __TS__ArraySlice(list, first, last)
    local len = #list
    local relativeStart = first or 0
    local k
    if relativeStart < 0 then
        k = math.max(len + relativeStart, 0)
    else
        k = math.min(relativeStart, len)
    end
    local relativeEnd = last
    if last == nil then
        relativeEnd = len
    end
    local final
    if relativeEnd < 0 then
        final = math.max(len + relativeEnd, 0)
    else
        final = math.min(relativeEnd, len)
    end
    local out = {}
    local n = 0
    while k < final do
        out[n + 1] = list[k + 1]
        k = k + 1
        n = n + 1
    end
    return out
end

function __TS__ArraySome(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                return true
            end
            i = i + 1
        end
    end
    return false
end

function __TS__ArraySplice(list, ...)
    local len = #list
    local actualArgumentCount = select("#", ...)
    local start = select(1, ...)
    local deleteCount = select(2, ...)
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = math.max(actualArgumentCount - 2, 0)
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(
            math.max(deleteCount or 0, 0),
            len - actualStart
        )
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < (len - actualDeleteCount) do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > ((len - actualDeleteCount) + itemCount) do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = (k + actualDeleteCount) - 1
                local to = (k + itemCount) - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for i = 3, actualArgumentCount do
        list[j + 1] = select(i, ...)
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= ((len - actualDeleteCount) + itemCount) do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__ArrayToObject(array)
    local object = {}
    do
        local i = 0
        while i < #array do
            object[i] = array[i + 1]
            i = i + 1
        end
    end
    return object
end

function __TS__ArrayFlat(array, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    for ____, value in ipairs(array) do
        if (depth > 0) and __TS__ArrayIsArray(value) then
            result = __TS__ArrayConcat(
                result,
                __TS__ArrayFlat(value, depth - 1)
            )
        else
            result[#result + 1] = value
        end
    end
    return result
end

function __TS__ArrayFlatMap(array, callback)
    local result = {}
    do
        local i = 0
        while i < #array do
            local value = callback(_G, array[i + 1], i, array)
            if (type(value) == "table") and __TS__ArrayIsArray(value) then
                result = __TS__ArrayConcat(result, value)
            else
                result[#result + 1] = value
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArraySetLength(arr, length)
    if (((length < 0) or (length ~= length)) or (length == math.huge)) or (math.floor(length) ~= length) then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    do
        local i = #arr - 1
        while i >= length do
            arr[i + 1] = nil
            i = i - 1
        end
    end
    return length
end

function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

function __TS__CloneDescriptor(____bindingPattern0)
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    local configurable
    configurable = ____bindingPattern0.configurable
    local get
    get = ____bindingPattern0.get
    local set
    set = ____bindingPattern0.set
    local writable
    writable = ____bindingPattern0.writable
    local value
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = (get ~= nil) or (set ~= nil)
    local hasValueOrWritableAttribute = (writable ~= nil) or (value ~= nil)
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(_G, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(_G, target, key, descriptor) or descriptor
                    local isSimpleValue = (((desc.configurable == true) and (desc.writable == true)) and (not desc.get)) and (not desc.set)
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(_G, target, key, desc)
                else
                    result = decorator(_G, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(_G, target, key, paramIndex) end
end

function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. ".",
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    if target[key] ~= nil then
        target[key] = nil
        return true
    end
    return false
end

function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(
                __TS__StringAccess(iterable, index)
            )
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

function __TS__GetErrorStack(self, constructor)
    local level = 1
    while true do
        local info = debug.getinfo(level, "f")
        level = level + 1
        if not info then
            level = 1
            break
        elseif info.func == constructor then
            break
        end
    end
    return debug.traceback(nil, level)
end
function __TS__WrapErrorToString(self, getDescription)
    return function(self)
        local description = getDescription(self)
        local caller = debug.getinfo(3, "f")
        if (_VERSION == "Lua 5.1") or (caller and (caller.func ~= error)) then
            return description
        else
            return (tostring(description) .. "\n") .. self.stack
        end
    end
end
function __TS__InitErrorClass(self, Type, name)
    Type.name = name
    return setmetatable(
        Type,
        {
            __call = function(____, _self, message) return __TS__New(Type, message) end
        }
    )
end
Error = __TS__InitErrorClass(
    _G,
    (function()
        local ____ = __TS__Class()
        ____.name = ""
        function ____.prototype.____constructor(self, message)
            if message == nil then
                message = ""
            end
            self.message = message
            self.name = "Error"
            self.stack = __TS__GetErrorStack(_G, self.constructor.new)
            local metatable = getmetatable(self)
            if not metatable.__errorToStringPatched then
                metatable.__errorToStringPatched = true
                metatable.__tostring = __TS__WrapErrorToString(_G, metatable.__tostring)
            end
        end
        function ____.prototype.__tostring(self)
            return (((self.message ~= "") and (function() return (self.name .. ": ") .. self.message end)) or (function() return self.name end))()
        end
        return ____
    end)(),
    "Error"
)
for ____, errorName in ipairs({"RangeError", "ReferenceError", "SyntaxError", "TypeError", "URIError"}) do
    _G[errorName] = __TS__InitErrorClass(
        _G,
        (function()
            local ____ = __TS__Class()
            ____.name = ____.name
            __TS__ClassExtends(____, Error)
            function ____.prototype.____constructor(self, ...)
                Error.prototype.____constructor(self, ...)
                self.name = errorName
            end
            return ____
        end)(),
        errorName
    )
end

__TS__Unpack = table.unpack or unpack

function __TS__FunctionBind(fn, thisArg, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        do
            local i = 0
            while i < #boundArgs do
                table.insert(args, i + 1, boundArgs[i + 1])
                i = i + 1
            end
        end
        return fn(
            thisArg,
            __TS__Unpack(args)
        )
    end
end

____symbolMetatable = {
    __tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end
}
function __TS__Symbol(description)
    return setmetatable({description = description}, ____symbolMetatable)
end
Symbol = {
    iterator = __TS__Symbol("Symbol.iterator"),
    hasInstance = __TS__Symbol("Symbol.hasInstance"),
    species = __TS__Symbol("Symbol.species"),
    toStringTag = __TS__Symbol("Symbol.toStringTag")
}

function __TS__GeneratorIterator(self)
    return self
end
function __TS__GeneratorNext(self, ...)
    local co = self.____coroutine
    if coroutine.status(co) == "dead" then
        return {done = true}
    end
    local status, value = coroutine.resume(co, ...)
    if not status then
        error(value, 0)
    end
    return {
        value = value,
        done = coroutine.status(co) == "dead"
    }
end
function __TS__Generator(fn)
    return function(...)
        local args = {...}
        local argsLength = select("#", ...)
        return {
            ____coroutine = coroutine.create(
                function() return fn(
                    (unpack or table.unpack)(args, 1, argsLength)
                ) end
            ),
            [Symbol.iterator] = __TS__GeneratorIterator,
            next = __TS__GeneratorNext
        }
    end
end

function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not (not classTbl[Symbol.hasInstance](classTbl, obj))
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return (valueType == "table") or (valueType == "function")
end

function __TS__IteratorGeneratorStep(self)
    local co = self.____coroutine
    local status, value = coroutine.resume(co)
    if not status then
        error(value, 0)
    end
    if coroutine.status(co) == "dead" then
        return
    end
    return true, value
end
function __TS__IteratorIteratorStep(self)
    local result = self:next()
    if result.done then
        return
    end
    return true, result.value
end
function __TS__IteratorStringStep(self, index)
    index = index + 1
    if index > #self then
        return
    end
    return index, string.sub(self, index, index)
end
function __TS__Iterator(iterable)
    if type(iterable) == "string" then
        return __TS__IteratorStringStep, iterable, 0
    elseif iterable.____coroutine ~= nil then
        return __TS__IteratorGeneratorStep, iterable
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        return __TS__IteratorIteratorStep, iterator
    else
        return __TS__Unpack(
            {
                ipairs(iterable)
            }
        )
    end
end

Map = (function()
    local Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(
            self:keys()
        ) do
            callback(_G, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return (self.nextKey[key] ~= nil) or (self.lastKey == key)
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local ____ = self
        local items = ____.items
        local nextKey = ____.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local ____ = self
        local items = ____.items
        local nextKey = ____.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
    return Map
end)()

__TS__MathAtan2 = math.atan2 or math.atan

function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return (value and 1) or 0
    else
        return 0 / 0
    end
end

function __TS__NumberIsFinite(value)
    return (((type(value) == "number") and (value == value)) and (value ~= math.huge)) and (value ~= -math.huge)
end

function __TS__NumberIsNaN(value)
    return value ~= value
end

____radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
function __TS__NumberToString(self, radix)
    if ((((radix == nil) or (radix == 10)) or (self == math.huge)) or (self == -math.huge)) or (self ~= self) then
        return tostring(self)
    end
    radix = math.floor(radix)
    if (radix < 2) or (radix > 36) then
        error("toString() radix argument must be between 2 and 36", 0)
    end
    local integer, fraction = math.modf(
        math.abs(self)
    )
    local result = ""
    if radix == 8 then
        result = string.format("%o", integer)
    elseif radix == 16 then
        result = string.format("%x", integer)
    else
        repeat
            do
                result = tostring(
                    __TS__StringAccess(____radixChars, integer % radix)
                ) .. tostring(result)
                integer = math.floor(integer / radix)
            end
        until not (integer ~= 0)
    end
    if fraction ~= 0 then
        result = tostring(result) .. "."
        local delta = 1e-16
        repeat
            do
                fraction = fraction * radix
                delta = delta * radix
                local digit = math.floor(fraction)
                result = tostring(result) .. tostring(
                    __TS__StringAccess(____radixChars, digit)
                )
                fraction = fraction - digit
            end
        until not (fraction >= delta)
    end
    if self < 0 then
        result = "-" .. tostring(result)
    end
    return result
end

function __TS__ObjectAssign(to, ...)
    local sources = {...}
    if to == nil then
        return to
    end
    for ____, source in ipairs(sources) do
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
end

function ____descriptorIndex(self, key)
    local value = rawget(self, key)
    if value ~= nil then
        return value
    end
    local metatable = getmetatable(self)
    while metatable do
        local rawResult = rawget(metatable, key)
        if rawResult ~= nil then
            return rawResult
        end
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.get then
                    return descriptor.get(self)
                end
                return descriptor.value
            end
        end
        metatable = getmetatable(metatable)
    end
end
function ____descriptorNewindex(self, key, value)
    local metatable = getmetatable(self)
    while metatable do
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.set then
                    descriptor.set(self, value)
                else
                    if descriptor.writable == false then
                        error(
                            ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                            0
                        )
                    end
                    descriptor.value = value
                end
                return
            end
        end
        metatable = getmetatable(metatable)
    end
    rawset(self, key, value)
end
function __TS__SetDescriptor(target, key, desc, isPrototype)
    if isPrototype == nil then
        isPrototype = false
    end
    local metatable = ((isPrototype and (function() return target end)) or (function() return getmetatable(target) end))()
    if not metatable then
        metatable = {}
        setmetatable(target, metatable)
    end
    local value = rawget(target, key)
    if value ~= nil then
        rawset(target, key, nil)
    end
    if not rawget(metatable, "_descriptors") then
        metatable._descriptors = {}
    end
    local descriptor = __TS__CloneDescriptor(desc)
    metatable._descriptors[key] = descriptor
    metatable.__index = ____descriptorIndex
    metatable.__newindex = ____descriptorNewindex
end

function __TS__ObjectDefineProperty(target, key, desc)
    local luaKey = (((type(key) == "number") and (function() return key + 1 end)) or (function() return key end))()
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = (desc.get ~= nil) or (desc.set ~= nil)
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        descriptor = {
            set = desc.set,
            get = desc.get,
            configurable = (((desc.configurable ~= nil) and (function() return desc.configurable end)) or (function() return valueExists end))(),
            enumerable = (((desc.enumerable ~= nil) and (function() return desc.enumerable end)) or (function() return valueExists end))(),
            writable = (((desc.writable ~= nil) and (function() return desc.writable end)) or (function() return valueExists end))(),
            value = (((desc.value ~= nil) and (function() return desc.value end)) or (function() return value end))()
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

function __TS__ObjectEntries(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = {key, obj[key]}
    end
    return result
end

function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

function __TS__ObjectKeys(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = key
    end
    return result
end

function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

function __TS__ObjectValues(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = obj[key]
    end
    return result
end

function __TS__OptionalChainAccess(____table, key)
    if ____table then
        return ____table[key]
    end
    return nil
end

function __TS__OptionalFunctionCall(f, ...)
    if f then
        return f(...)
    end
    return nil
end

function __TS__OptionalMethodCall(____table, methodName, ...)
    local args = {...}
    if ____table then
        local method = ____table[methodName]
        if method then
            return method(
                ____table,
                __TS__Unpack(args)
            )
        end
    end
    return nil
end

function __TS__ParseFloat(numberString)
    local infinityMatch = string.match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        return (((__TS__StringAccess(infinityMatch, 0) == "-") and (function() return -math.huge end)) or (function() return math.huge end))()
    end
    local number = tonumber(
        string.match(numberString, "^%s*(-?%d+%.?%d*)")
    )
    return number or (0 / 0)
end

__TS__parseInt_base_pattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
function __TS__ParseInt(numberString, base)
    if base == nil then
        base = 10
        local hexMatch = string.match(numberString, "^%s*-?0[xX]")
        if hexMatch then
            base = 16
            numberString = ((string.match(hexMatch, "-") and (function() return "-" .. tostring(
                __TS__StringSubstr(numberString, #hexMatch)
            ) end)) or (function() return __TS__StringSubstr(numberString, #hexMatch) end))()
        end
    end
    if (base < 2) or (base > 36) then
        return 0 / 0
    end
    local allowedDigits = (((base <= 10) and (function() return __TS__StringSubstring(__TS__parseInt_base_pattern, 0, base) end)) or (function() return __TS__StringSubstr(__TS__parseInt_base_pattern, 0, 10 + (2 * (base - 10))) end))()
    local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
    local number = tonumber(
        string.match(numberString, pattern),
        base
    )
    if number == nil then
        return 0 / 0
    end
    if number >= 0 then
        return math.floor(number)
    else
        return math.ceil(number)
    end
end

Set = (function()
    local Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(
            self:keys()
        ) do
            callback(_G, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return (self.nextKey[value] ~= nil) or (self.lastKey == value)
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    Set[Symbol.species] = Set
    return Set
end)()

WeakMap = (function()
    local WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
    return WeakMap
end)()

WeakSet = (function()
    local WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
    return WeakSet
end)()

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace
            if ((thread == nil) and (message == nil)) and (level == nil) then
                trace = _G.__TS__originalTraceback()
            else
                trace = _G.__TS__originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local result = string.gsub(
                trace,
                "(%S+).lua:(%d+)",
                function(file, line)
                    local fileSourceMap = _G.__TS__sourcemap[tostring(file) .. ".lua"]
                    if fileSourceMap and fileSourceMap[line] then
                        return (file .. ".ts:") .. tostring(fileSourceMap[line])
                    end
                    return (file .. ".lua:") .. line
                end
            )
            return result
        end
    end
end

function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        do
            local i = 0
            while i < #iterable do
                arr[#arr + 1] = __TS__StringAccess(iterable, i)
                i = i + 1
            end
        end
    else
        for ____, item in __TS__Iterator(iterable) do
            arr[#arr + 1] = item
        end
    end
    return __TS__Unpack(arr)
end

function __TS__StringAccess(self, index)
    if (index >= 0) and (index < #self) then
        return string.sub(self, index + 1, index + 1)
    end
end

function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or (0 / 0)
end

function __TS__StringConcat(str1, ...)
    local args = {...}
    local out = str1
    for ____, arg in ipairs(args) do
        out = tostring(out) .. tostring(arg)
    end
    return out
end

function __TS__StringEndsWith(self, searchString, endPosition)
    if (endPosition == nil) or (endPosition > #self) then
        endPosition = #self
    end
    return string.sub(self, (endPosition - #searchString) + 1, endPosition) == searchString
end

function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if (maxLength == -math.huge) or (maxLength == math.huge) then
        error("Invalid string length", 0)
    end
    if (#self >= maxLength) or (#fillString == 0) then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = tostring(fillString) .. tostring(
            string.rep(
                fillString,
                math.floor(maxLength / #fillString)
            )
        )
    end
    return tostring(self) .. tostring(
        string.sub(
            fillString,
            1,
            math.floor(maxLength)
        )
    )
end

function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if (maxLength == -math.huge) or (maxLength == math.huge) then
        error("Invalid string length", 0)
    end
    if (#self >= maxLength) or (#fillString == 0) then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = tostring(fillString) .. tostring(
            string.rep(
                fillString,
                math.floor(maxLength / #fillString)
            )
        )
    end
    return tostring(
        string.sub(
            fillString,
            1,
            math.floor(maxLength)
        )
    ) .. tostring(self)
end

function __TS__StringReplace(source, searchValue, replaceValue)
    searchValue = string.gsub(searchValue, "[%%%(%)%.%+%-%*%?%[%^%$]", "%%%1")
    if type(replaceValue) == "string" then
        replaceValue = string.gsub(replaceValue, "%%", "%%%%")
        local result = string.gsub(source, searchValue, replaceValue, 1)
        return result
    else
        local result = string.gsub(
            source,
            searchValue,
            function(match) return replaceValue(_G, match) end,
            1
        )
        return result
    end
end

function __TS__StringSlice(self, start, ____end)
    if (start == nil) or (start ~= start) then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if (____end ~= nil) and (____end < 0) then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if (____end ~= nil) and (start > ____end) then
        start, ____end = __TS__Unpack({____end, start})
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if (____end ~= nil) and (____end < 0) then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if (separator == nil) or (separator == "") then
        while (index < (#source - 1)) and (count < limit) do
            out[count + 1] = __TS__StringAccess(source, index)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = (string.find(source, separator, nil, true) or 0) - 1
        while (nextIndex >= 0) and (count < limit) do
            out[count + 1] = __TS__StringSubstring(source, index, nextIndex)
            count = count + 1
            index = nextIndex + separatorLength
            nextIndex = (string.find(
                source,
                separator,
                math.max(index + 1, 1),
                true
            ) or 0) - 1
        end
    end
    if count < limit then
        out[count + 1] = __TS__StringSubstring(source, index)
    end
    return out
end

function __TS__StringStartsWith(self, searchString, position)
    if (position == nil) or (position < 0) then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if (length ~= length) or (length <= 0) then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

____symbolRegistry = {}
function __TS__SymbolRegistryFor(key)
    if not ____symbolRegistry[key] then
        ____symbolRegistry[key] = __TS__Symbol(key)
    end
    return ____symbolRegistry[key]
end
function __TS__SymbolRegistryKeyFor(sym)
    for key in pairs(____symbolRegistry) do
        if ____symbolRegistry[key] == sym then
            return key
        end
    end
end

function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

 end,
["constants"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.ModItemTypes = ModItemTypes or ({})
____exports.ModItemTypes.FAT_FETUS = Isaac.GetItemIdByName("Fat Fetus")
____exports.ModItemTypes[____exports.ModItemTypes.FAT_FETUS] = "FAT_FETUS"
____exports.ModItemTypes.BLOODDRIVE = Isaac.GetItemIdByName("Blood Drive")
____exports.ModItemTypes[____exports.ModItemTypes.BLOODDRIVE] = "BLOODDRIVE"
____exports.ModItemTypes.GHOST_SHOT = Isaac.GetItemIdByName("Ghost Shot")
____exports.ModItemTypes[____exports.ModItemTypes.GHOST_SHOT] = "GHOST_SHOT"
____exports.ModItemTypes.BBGHOST_SHOT = Isaac.GetItemIdByName("Big Boy Ghost Shot")
____exports.ModItemTypes[____exports.ModItemTypes.BBGHOST_SHOT] = "BBGHOST_SHOT"
____exports.ModItemTypes.BLUE_HEART = Isaac.GetItemIdByName("Blue Heart")
____exports.ModItemTypes[____exports.ModItemTypes.BLUE_HEART] = "BLUE_HEART"
____exports.ModItemTypes.RUSSIANROULETTE = Isaac.GetItemIdByName("Russian Roulette")
____exports.ModItemTypes[____exports.ModItemTypes.RUSSIANROULETTE] = "RUSSIANROULETTE"
____exports.ModItemTypes.STONE_D6 = Isaac.GetItemIdByName("Stone D6")
____exports.ModItemTypes[____exports.ModItemTypes.STONE_D6] = "STONE_D6"
____exports.ModTearVariants = ModTearVariants or ({})
____exports.ModTearVariants.GHOST = Isaac.GetEntityVariantByName("Ghost Tear")
____exports.ModTearVariants[____exports.ModTearVariants.GHOST] = "GHOST"
____exports.ModEntityVariants = ModEntityVariants or ({})
____exports.ModEntityVariants.GHOST_TEAR = 50
____exports.ModEntityVariants[____exports.ModEntityVariants.GHOST_TEAR] = "GHOST_TEAR"
____exports.ModEntityVariants.PEEL = Isaac.GetEntityVariantByName("Peel")
____exports.ModEntityVariants[____exports.ModEntityVariants.PEEL] = "PEEL"
____exports.ModPlayerTypes = ModPlayerTypes or ({})
____exports.ModPlayerTypes.ALABASTER = Isaac.GetPlayerTypeByName("Alabaster")
____exports.ModPlayerTypes[____exports.ModPlayerTypes.ALABASTER] = "ALABASTER"
____exports.ModCostumes = ModCostumes or ({})
____exports.ModCostumes.ALABASTER_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/c_Alabaster_Hair.anm2")
____exports.ModCostumes[____exports.ModCostumes.ALABASTER_HAIR] = "ALABASTER_HAIR"
____exports.game = Game()
____exports.sfxManager = SFXManager()
return ____exports
 end,
["globals.peel"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModEntityVariants = ____constants.ModEntityVariants
function ____exports.peelUpdate(self, npc)
    if npc.Variant == ModEntityVariants.PEEL then
        if npc.HitPoints <= (npc.MaxHitPoints / 2) then
            local ____obj, ____index = npc.Velocity, "X"
            ____obj[____index] = ____obj[____index] * 1.1
            local ____obj, ____index = npc.Velocity, "Y"
            ____obj[____index] = ____obj[____index] * 1.1
            Isaac.Spawn(
                EntityType.ENTITY_EFFECT,
                EffectVariant.CREEP_RED,
                0,
                npc.Position,
                Vector(0, 0),
                npc
            )
        end
    end
end
function ____exports.peelDmg(self, npc, damage)
    if npc.HitPoints <= ((npc.MaxHitPoints - damage) / 2) then
        npc:GetSprite():ReplaceSpritesheet(0, "../resources/gfx/monsters/Peel2.png")
        npc:GetSprite():LoadGraphics()
    end
end
return ____exports
 end,
["items.passive.fatfetus"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.fatFetusTears(self, tear)
    local bomb
    if tear.SpawnerEntity == nil then
        return
    end
    local player = tear.SpawnerEntity:ToPlayer()
    if player == nil then
        return
    end
    if player:HasCollectible(constants.ModItemTypes.FAT_FETUS) then
        local dmg = player.Damage * (300 / 3.5)
        bomb = Isaac.Spawn(EntityType.ENTITY_BOMBDROP, 21, 0, player.Position, tear.Velocity, player):ToBomb()
        if bomb == nil then
            return
        end
        tear:Remove()
        bomb.ExplosionDamage = dmg
    end
end
function ____exports.gigaUpdate(self, bomb)
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            if ((((((((((((((bomb:GetSprite():IsFinished("Pulse") or bomb:GetSprite():IsFinished("brimpulse")) or bomb:GetSprite():IsFinished("stickypulse")) or bomb:GetSprite():IsFinished("goldenpulse")) or bomb:GetSprite():IsFinished("flamepulse")) or bomb:GetSprite():IsFinished("bloodpulse")) or bomb:GetSprite():IsFinished("buttpulse")) or bomb:GetSprite():IsFinished("poisonpulse")) or bomb:GetSprite():IsFinished("megapulse")) or bomb:GetSprite():IsFinished("scatterpulse")) or bomb:GetSprite():IsFinished("ghostpulse")) or bomb:GetSprite():IsFinished("sadpulse")) or bomb:GetSprite():IsFinished("homingpulse")) or bomb:GetSprite():IsFinished("goldhomingpulse")) or bomb:GetSprite():IsFinished("crosspulse")) or bomb:GetSprite():IsFinished("glitterpulse") then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        0,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        90,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        180,
                        15,
                        Vector(0, 0),
                        player
                    )
                    EntityLaser.ShootAngle(
                        1,
                        bomb.Position,
                        270,
                        15,
                        Vector(0, 0),
                        player
                    )
                end
                local explody = Isaac.Spawn(
                    4,
                    17,
                    0,
                    bomb.Position,
                    Vector(0, 0),
                    bomb
                ):ToBomb()
                if explody == nil then
                    return
                end
                explody.Visible = false
                if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) or player:HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY) then
                    explody:AddTearFlags(TearFlags.TEAR_CROSS_BOMB)
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) or player:HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK) then
                    explody.RadiusMultiplier = explody.RadiusMultiplier * 0.5
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_STICKY)
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) then
                    explody:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
                end
                bomb.ExplosionDamage = player.Damage * (300 / 3.5)
                explody.ExplosionDamage = player.Damage * (300 / 3.5)
                explody:SetExplosionCountdown(0)
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                    local creep = Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.PLAYER_CREEP_RED,
                        0,
                        bomb.Position,
                        Vector(0, 0),
                        player
                    ):ToEffect()
                    if creep == nil then
                        print("creep spawn failed")
                        return
                    end
                    creep:SetDamageSource(EntityType.ENTITY_PLAYER)
                    creep.Scale = creep.Scale * 10
                    creep.LifeSpan = creep.LifeSpan * 1000
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                    explody:AddTearFlags(TearFlags.TEAR_POISON)
                    local cloud = Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.SMOKE_CLOUD,
                        0,
                        bomb.Position,
                        Vector(0, 0),
                        player
                    ):ToEffect()
                    if cloud == nil then
                        return
                    end
                    cloud.Scale = cloud.Scale * 4
                end
                if player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) then
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(-3, 0),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(0, -3),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(0, 3),
                        player
                    )
                    Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.HUNGRY_SOUL,
                        0,
                        bomb.Position,
                        Vector(3, 0),
                        player
                    )
                end
                bomb:GetSprite():Play("Explode", false)
            end
            if bomb:GetSprite():IsFinished("Explode") then
                bomb:Remove()
                if player:HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS) then
                    local sad
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(10, 0),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(-10, 0),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(0, 10),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(0, -10),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            10 / math.sqrt(2),
                            10 / math.sqrt(2)
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            0 - (10 / math.sqrt(2)),
                            10 / math.sqrt(2)
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            10 / math.sqrt(2),
                            0 - (10 / math.sqrt(2))
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                    sad = Isaac.Spawn(
                        EntityType.ENTITY_TEAR,
                        0,
                        0,
                        bomb.Position,
                        Vector(
                            0 - (10 / math.sqrt(2)),
                            0 - (10 / math.sqrt(2))
                        ),
                        player
                    ):ToTear()
                    if sad ~= nil then
                        sad.Scale = sad.Scale * 2
                        sad.CollisionDamage = player.Damage * 2
                        sad:GetData().sad = true
                    end
                end
            end
        end
    end
end
function ____exports.gigaBombReplace(self, bomb)
    if (bomb.SpawnerEntity ~= nil) and (bomb.SpawnerEntity:ToPlayer() ~= nil) then
        Isaac.Spawn(
            EntityType.ENTITY_BOMBDROP,
            21,
            0,
            bomb.Position,
            bomb.Velocity,
            bomb.SpawnerEntity:ToPlayer()
        )
        bomb:Remove()
    end
end
function ____exports.gigaInit(self, bomb)
    bomb.CollisionDamage = 0
    if bomb.SpawnerEntity ~= nil then
        local player = bomb.SpawnerEntity:ToPlayer()
        if player ~= nil then
            bomb:SetExplosionCountdown(100)
            if ((player:HasCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER) or player:HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART)) or player:HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD)) or player:HasCollectible(constants.ModItemTypes.GHOST_SHOT) then
                bomb:AddTearFlags(TearFlags.TEAR_HOMING)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_SOY_MILK) or player:HasCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK) then
                bomb.RadiusMultiplier = 0.5
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                bomb.RadiusMultiplier = bomb.RadiusMultiplier * 2
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
                bomb:GetSprite():Play("megapulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOMBER_BOY) then
                bomb:GetSprite():Play("crosspulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                bomb:GetSprite():Play("brimpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_STICKY)
                bomb:GetSprite():Play("stickypulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_BUTT_BOMB)
                bomb:GetSprite():Play("buttpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_BOMBS) then
                bomb:GetSprite():Play("bloodpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_SCATTER_BOMBS) then
                bomb:AddTearFlags(TearFlags.TEAR_SCATTER_BOMB)
                bomb:GetSprite():Play("scatterpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BOMBS) or player:HasCollectible(constants.ModItemTypes.GHOST_SHOT) then
                bomb:AddTearFlags(TearFlags.TEAR_GHOST_BOMB)
                bomb:GetSprite():Play("ghostpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_SAD_BOMBS) then
                bomb:GetSprite():Play("sadpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) then
                bomb:GetSprite():Play("glitterpulse", true)
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_HOT_BOMBS) or player:HasCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND) then
                bomb.CollisionDamage = 32
                bomb:AddTearFlags(TearFlags.TEAR_BURN)
                bomb:GetSprite():Play("flamepulse", true)
            elseif player:HasGoldenBomb() then
                if bomb:HasTearFlags(TearFlags.TEAR_HOMING) then
                    bomb:GetSprite():Play("goldhomingpulse", true)
                else
                    bomb:GetSprite():Play("goldenpulse", true)
                end
            elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                bomb:GetSprite():Play("poisonpulse", true)
            elseif bomb:HasTearFlags(TearFlags.TEAR_HOMING) then
                bomb:GetSprite():Play("homingpulse", true)
            else
                bomb:GetSprite():Play("Pulse", true)
            end
        else
            bomb:SetExplosionCountdown(87)
            bomb.ExplosionDamage = 300
            bomb:GetSprite():Play("Pulse", true)
        end
    end
end
function ____exports.rocks(self, projectile)
    if projectile.SpawnerEntity ~= nil then
        local bomb = projectile.SpawnerEntity:ToBomb()
        if (bomb ~= nil) and (bomb.SpawnerEntity ~= nil) then
            local player = bomb.SpawnerEntity:ToPlayer()
            if player ~= nil then
                projectile:AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER)
                projectile:AddProjectileFlags(ProjectileFlags.HIT_ENEMIES)
                projectile.Damage = player.Damage
            end
        end
    end
end
function ____exports.glitterdrops(self, entity, amount, flags, source)
    if (amount >= entity.HitPoints) and (flags ~= DamageFlag.DAMAGE_NOKILL) then
        if (((((source.Entity ~= nil) and (source.Entity:ToBomb() ~= nil)) and (source.Entity.Type == EntityType.ENTITY_BOMBDROP)) and (source.Entity.Variant == BombVariant.BOMB_GIGA)) and (source.Entity.SpawnerEntity ~= nil)) and (source.Entity.SpawnerEntity.SpawnerEntity ~= nil) then
            local player = source.Entity.SpawnerEntity.SpawnerEntity:ToPlayer()
            if player ~= nil then
                if player:HasCollectible(CollectibleType.COLLECTIBLE_GLITTER_BOMBS) and player:HasCollectible(constants.ModItemTypes.FAT_FETUS) then
                    if math.random() <= 0.1 then
                        local pickup = Isaac.Spawn(
                            EntityType.ENTITY_PICKUP,
                            PickupVariant.PICKUP_NULL,
                            0,
                            Isaac.GetFreeNearPosition(entity.Position, 1),
                            entity.Velocity,
                            nil
                        ):ToPickup()
                        if (pickup ~= nil) and (pickup:GetCoinValue() > 5) then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, 0, pickup.Position, pickup.Velocity, nil)
                            pickup:Remove()
                        end
                    end
                end
            end
        end
    end
end
function ____exports.ffstats(self, player, flags)
    if flags == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(constants.ModItemTypes.FAT_FETUS) then
            if (not player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)) and (not player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)) then
                player.MaxFireDelay = player.MaxFireDelay * 15
            end
        end
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(constants.ModItemTypes.FAT_FETUS) and player:HasCollectible(CollectibleType.COLLECTIBLE_MR_MEGA) then
            player.Damage = player.Damage * 2
        end
    end
end
return ____exports
 end,
["playerdata"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local constants = require("constants")
function ____exports.GetPlayerId(self, player)
    local returner = 0
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local playeri = constants.game:GetPlayer(i)
            if ((playeri ~= nil) and (player ~= nil)) and (playeri:GetCollectibleRNG(1):GetSeed() == player:GetCollectibleRNG(1):GetSeed()) then
                returner = i
            end
            i = i + 1
        end
    end
    return returner
end
____exports.PlayerData = __TS__Class()
local PlayerData = ____exports.PlayerData
PlayerData.name = "PlayerData"
function PlayerData.prototype.____constructor(self, player, bdcharge, lost, razors)
    if player == nil then
        player = nil
    end
    if bdcharge == nil then
        bdcharge = 0
    end
    if lost == nil then
        lost = false
    end
    if razors == nil then
        razors = 0
    end
    self.player = nil
    self.player = player
    self.lost = lost
    self.razors = razors
    self.bdcharge = bdcharge
    self.id = ((player ~= nil) and ____exports.GetPlayerId(nil, player)) or -1
end
function PlayerData.prototype.RegenerateID(self)
    self.id = ____exports.GetPlayerId(nil, self.player)
end
function ____exports.PlayerSeed(self, player, CollID)
    if CollID == nil then
        CollID = 1
    end
    return ((player ~= nil) and player:GetCollectibleRNG(CollID):GetSeed()) or -1
end
return ____exports
 end,
["callbacks.MC_ENTITY_TAKE_DMG"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModEntityVariants = ____constants.ModEntityVariants
local ModItemTypes = ____constants.ModItemTypes
local ____peel = require("globals.peel")
local peelDmg = ____peel.peelDmg
local ____fatfetus = require("items.passive.fatfetus")
local glitterdrops = ____fatfetus.glitterdrops
function ____exports.entityTakeDamage(self, entity, amt, flags, src, _modPlayerData)
    if entity.Type == EntityType.ENTITY_PLAYER then
    end
    if Isaac.GetPlayer():HasCollectible(ModItemTypes.FAT_FETUS) then
        glitterdrops(nil, entity, amt, flags, src)
    end
    if entity.Type == ModEntityVariants.PEEL then
        peelDmg(nil, entity, amt)
    end
end
return ____exports
 end,
["globals.alabaster"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.alabasterStats(self, player, flags)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        if flags == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed - 0.15
        end
        if flags == CacheFlag.CACHE_FLYING then
            player.CanFly = true
        end
    end
end
function ____exports.alabasterHealth(self, player)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        local playerHealth = player:GetMaxHearts()
        if playerHealth > 0 then
            player:AddMaxHearts(0 - playerHealth, false)
            player:AddBlackHearts(playerHealth)
        end
        local redHealth = player:GetHearts()
        if redHealth > 0 then
            player:AddHearts(0 - redHealth)
        end
    end
end
return ____exports
 end,
["items.passive.ghostshot"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ModTearVariants = ____constants.ModTearVariants
local bbghostReplace, ghostReplace
function bbghostReplace(self, tear, player)
    tear.Visible = false
    local ghost = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PURGATORY, 1, tear.Position, ((tear.Velocity / (0 - player.TearHeight)) * 23.75) / 1.5, player)
    local ____obj, ____index = ghost:GetSprite(), "PlaybackSpeed"
    ____obj[____index] = ____obj[____index] * 2
    ghost.CollisionDamage = player.Damage
    tear:Remove()
    return ghost
end
function ghostReplace(self, tear, player)
    local animName = tear:GetSprite():GetAnimation()
    tear:ChangeVariant(ModTearVariants.GHOST)
    tear:GetSprite():Load("gfx/Ghost_Tear.anm2", true)
    tear:GetSprite():Play(animName, true)
    tear.CollisionDamage = player.Damage
    tear:AddTearFlags(TearFlags.TEAR_HOMING)
    tear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
    tear:GetData().ghost = true
    tear:GetData().player = player
    return tear
end
function ____exports.ghostShot(self, tear)
    if (tear.SpawnerEntity ~= nil) and (tear.SpawnerEntity.Type == EntityType.ENTITY_PLAYER) then
        local player = tear.SpawnerEntity:ToPlayer()
        if (player ~= nil) and player:HasCollectible(ModItemTypes.BBGHOST_SHOT) then
            bbghostReplace(nil, tear, player)
        elseif (player ~= nil) and player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            if player:HasWeaponType(WeaponType.WEAPON_TEARS) then
                ghostReplace(nil, tear, player)
            else
                tear:AddTearFlags(TearFlags.TEAR_HOMING)
                tear:AddTearFlags(TearFlags.TEAR_SPECTRAL)
                tear:AddTearFlags(TearFlags.TEAR_EXPLOSIVE)
            end
        end
    end
end
function ____exports.ghostCollide(self, tear, collider)
    if tear:GetData().ghost == true then
        if (tear:GetData().player ~= nil) and (collider:GetDropRNG():GetSeed() ~= tear:GetData().seed) then
            tear:GetData().seed = collider:GetDropRNG():GetSeed()
            local player = tear:GetData().player
            do
                local i = 0
                while i < 3 do
                    local explosionEffect = Isaac.Spawn(
                        EntityType.ENTITY_EFFECT,
                        EffectVariant.BLOOD_EXPLOSION,
                        0,
                        tear.Position,
                        Vector(0, 0),
                        player
                    ):ToEffect()
                    if explosionEffect ~= nil then
                        explosionEffect:SetDamageSource(EntityType.ENTITY_PLAYER)
                        explosionEffect.CollisionDamage = player.Damage * 2
                        local playeradjrange = (player.TearHeight * -1) / 23.75
                        explosionEffect.Scale = explosionEffect.Scale * playeradjrange
                    end
                    i = i + 1
                end
            end
        end
    end
    return tear
end
function ____exports.ghostShotStats(self, player, flags)
    if flags == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(ModItemTypes.BBGHOST_SHOT) then
            player.Damage = player.Damage * 0.8
        end
    end
end
return ____exports
 end,
["callbacks.MC_EVALUATE_CACHE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____alabaster = require("globals.alabaster")
local alabasterStats = ____alabaster.alabasterStats
local ____fatfetus = require("items.passive.fatfetus")
local ffstats = ____fatfetus.ffstats
local ____ghostshot = require("items.passive.ghostshot")
local ghostShotStats = ____ghostshot.ghostShotStats
function ____exports.evalCache(self, _modPlayerData, player, flags)
    alabasterStats(nil, player, flags)
    ffstats(nil, player, flags)
    ghostShotStats(nil, player, flags)
end
return ____exports
 end,
["callbacks.MC_NPC_UPDATE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____peel = require("globals.peel")
local peelUpdate = ____peel.peelUpdate
function ____exports.npcUpdate(self, entity)
    peelUpdate(nil, entity)
end
return ____exports
 end,
["callbacks.MC_POST_BOMB_INIT"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local gigaBombReplace = ____fatfetus.gigaBombReplace
local gigaInit = ____fatfetus.gigaInit
function ____exports.bombInit(self, bomb)
    if (bomb.Variant == BombVariant.BOMB_GIGA) or (bomb.Variant == BombVariant.BOMB_ROCKET_GIGA) then
        gigaBombReplace(nil, bomb)
    end
    if bomb.Variant == 21 then
        gigaInit(nil, bomb)
    end
end
return ____exports
 end,
["callbacks.MC_POST_BOMB_UPDATE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local gigaUpdate = ____fatfetus.gigaUpdate
function ____exports.bombUpdate(self, bomb)
    if bomb.Variant == 21 then
        gigaUpdate(nil, bomb)
    end
end
return ____exports
 end,
["callbacks.MC_POST_FIRE_TEAR"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local fatFetusTears = ____fatfetus.fatFetusTears
local ____ghostshot = require("items.passive.ghostshot")
local ghostShot = ____ghostshot.ghostShot
function ____exports.postFireTear(self, tear)
    fatFetusTears(nil, tear)
    ghostShot(nil, tear)
end
return ____exports
 end,
["globals.hud"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModPlayerTypes = ____constants.ModPlayerTypes
local hudOffset = 0
local OFFSET = Vector(2, 1.2)
local LISTYOFFSET = Vector(0, 13)
local HEARTPATH = "gfx/hudheart.anm2"
local data = {
    firstAlaIndex = -1,
    initialized = false,
    heartSprite = Sprite(),
    vec = Vector(45, 43),
    num2 = -10,
    font = Font()
}
local alabasters = 0
function ____exports.init(self)
    do
        local i = 0
        while i < game:GetNumPlayers() do
            local player = game:GetPlayer(i)
            if (player ~= nil) and (player:GetPlayerType() == ModPlayerTypes.ALABASTER) then
                if data.firstAlaIndex == -1 then
                    data.firstAlaIndex = i
                end
                alabasters = alabasters + 1
            end
            i = i + 1
        end
    end
    if alabasters == 0 then
        return
    end
    data.initialized = true
    data.heartSprite = Sprite()
    data.font = Font()
    data.heartSprite:Load(HEARTPATH, true)
    data.heartSprite.Color = Color(1, 1, 1, 1)
    data.heartSprite.Scale = Vector(1, 1)
    data.heartSprite:SetFrame("Idle", 0)
    data.font = Font()
    data.font:Load("font/pftempestasevencondensed.fnt")
end
function ____exports.render(self, modPlayerData)
    if not data.initialized then
        ____exports.init(nil)
    end
    if game:GetHUD():IsVisible() then
        local x = 0
        do
            local i = 0
            while i < game:GetNumPlayers() do
                local player = game:GetPlayer(i)
                if (player ~= nil) and ((player:GetPlayerType() == PlayerType.PLAYER_XXX_B) or (player:GetPlayerType() == PlayerType.PLAYER_ISAAC_B)) then
                    x = 2
                end
                i = i + 1
            end
        end
        if modPlayerData.data[data.firstAlaIndex + 1].bdcharge ~= 0 then
            data.heartSprite:Render(
                (data.vec + (LISTYOFFSET * x)) + (OFFSET * hudOffset),
                Vector(0, 0),
                Vector(0, 0)
            )
            data.font:DrawString(
                tostring(modPlayerData.data[data.firstAlaIndex + 1].bdcharge),
                (data.vec.X + 9) + (OFFSET * hudOffset).X,
                ((data.vec.Y + (LISTYOFFSET * x).Y) + data.num2) + (OFFSET * hudOffset).Y,
                KColor(1, 1, 1, 1)
            )
        end
    end
end
return ____exports
 end,
["globals.pocketItems"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModItemTypes = ____constants.ModItemTypes
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.pocketItems(self, _modPlayerData)
    do
        local i = 0
        while i < Game():GetNumPlayers() do
            local player = game:GetPlayer(i)
            if player ~= nil then
                local ____switch5 = player:GetPlayerType()
                if ____switch5 == ModPlayerTypes.ALABASTER then
                    goto ____switch5_case_0
                end
                goto ____switch5_case_default
                ::____switch5_case_0::
                do
                    do
                        if not player:HasCollectible(ModItemTypes.GHOST_SHOT) then
                            player:AddCollectible(ModItemTypes.GHOST_SHOT)
                        end
                        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) ~= ModItemTypes.BLOODDRIVE then
                            print("blood drive added!")
                            player:AddCollectible(ModItemTypes.BLOODDRIVE, nil, nil, ActiveSlot.SLOT_POCKET)
                        end
                        goto ____switch5_end
                    end
                end
                ::____switch5_case_default::
                do
                    do
                        goto ____switch5_end
                    end
                end
                ::____switch5_end::
            end
            i = i + 1
        end
    end
end
return ____exports
 end,
["globals.saveload"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
local ____constants = require("constants")
local game = ____constants.game
local ____playerdata = require("playerdata")
local PlayerData = ____playerdata.PlayerData
function ____exports.loadData(self, continued, mod, modPlayerData)
    if continued and mod:HasData() then
        local olddata = json.decode(
            mod:LoadData()
        )
        do
            local i = 0
            while i < #olddata.data do
                local player = game:GetPlayer(i)
                if player ~= nil then
                    modPlayerData.data[i + 1] = __TS__New(PlayerData, player, olddata.data[i + 1].bdcharge, olddata.data[i + 1].lost, olddata.data[i + 1].razors)
                else
                    modPlayerData.data[i + 1] = __TS__New(PlayerData, nil, 0, false, 0)
                end
                i = i + 1
            end
        end
    else
        modPlayerData.data = {
            __TS__New(
                PlayerData,
                game:GetPlayer(0),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(1),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(2),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(3),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(3),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(5),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(6),
                0,
                false,
                0
            ),
            __TS__New(
                PlayerData,
                game:GetPlayer(7),
                0,
                false,
                0
            )
        }
    end
end
function ____exports.save(self, mod, modPlayerData)
    mod:SaveData(
        json.encode(modPlayerData)
    )
end
return ____exports
 end,
["callbacks.MC_POST_GAME_STARTED"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____hud = require("globals.hud")
local init = ____hud.init
local ____pocketItems = require("globals.pocketItems")
local pocketItems = ____pocketItems.pocketItems
local ____saveload = require("globals.saveload")
local loadData = ____saveload.loadData
function ____exports.gameStart(self, mod, modPlayerData, continued)
    loadData(nil, continued, mod, modPlayerData)
    init(nil)
    pocketItems(nil, modPlayerData)
end
return ____exports
 end,
["globals.costumes"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.costumes(self, _modPlayerData)
    do
        local i = 0
        while i < 8 do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                if player:GetPlayerType() == Isaac.GetPlayerTypeByName("Alabaster") then
                    player:TryRemoveNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                    player:AddNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                    player:GetData().costumeEquipped = true
                end
            end
            i = i + 1
        end
    end
end
return ____exports
 end,
["callbacks.MC_POST_NEW_ROOM"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____costumes = require("globals.costumes")
local costumes = ____costumes.costumes
function ____exports.postNewRoom(self, modPlayerData)
    costumes(nil, modPlayerData)
end
return ____exports
 end,
["callbacks.MC_POST_NPC_RENDER"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.npcRender(self, _npc, _renderOffset)
end
return ____exports
 end,
["items.active.blooddrive"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModPlayerTypes = ____constants.ModPlayerTypes
local sfxManager = ____constants.sfxManager
local ____playerdata = require("playerdata")
local GetPlayerId = ____playerdata.GetPlayerId
function ____exports.bloodDrive(self, player, modPlayerData, rng)
    if (player:GetPlayerType() == ModPlayerTypes.ALABASTER) and ((game:GetRoom():GetType() == RoomType.ROOM_ANGEL) or (game:GetRoom():GetType() == RoomType.ROOM_DEVIL)) then
        if modPlayerData.data[GetPlayerId(nil, player) + 1].bdcharge > 0 then
            local ____obj, ____index = modPlayerData.data[GetPlayerId(nil, player) + 1], "bdcharge"
            ____obj[____index] = ____obj[____index] - 2
            local spawned = true
            local rand = rng:RandomInt(100)
            local pos = game:GetRoom():FindFreePickupSpawnPosition(player.Position)
            local runes = {Card.RUNE_ALGIZ, Card.RUNE_ANSUZ, Card.RUNE_BERKANO, Card.RUNE_BLACK, Card.RUNE_BLANK, Card.RUNE_DAGAZ, Card.RUNE_EHWAZ, Card.RUNE_HAGALAZ, Card.RUNE_JERA, Card.RUNE_PERTHRO, Card.CARD_SOUL_APOLLYON, Card.CARD_SOUL_AZAZEL, Card.CARD_SOUL_BETHANY, Card.CARD_SOUL_BLUEBABY, Card.CARD_SOUL_CAIN, Card.CARD_SOUL_EDEN, Card.CARD_SOUL_EVE, Card.CARD_SOUL_FORGOTTEN, Card.CARD_SOUL_ISAAC, Card.CARD_SOUL_JACOB, Card.CARD_SOUL_JUDAS, Card.CARD_SOUL_KEEPER, Card.CARD_SOUL_LAZARUS, Card.CARD_SOUL_LILITH, Card.CARD_SOUL_LOST, Card.CARD_SOUL_MAGDALENE, Card.CARD_SOUL_SAMSON}
            local chests = {PickupVariant.PICKUP_OLDCHEST, PickupVariant.PICKUP_LOCKEDCHEST, PickupVariant.PICKUP_REDCHEST, PickupVariant.PICKUP_CHEST, PickupVariant.PICKUP_WOODENCHEST}
            local cards = {Card.CARD_ACE_OF_CLUBS, Card.CARD_ACE_OF_DIAMONDS, Card.CARD_ACE_OF_HEARTS, Card.CARD_ACE_OF_SPADES, Card.CARD_ANCIENT_RECALL, Card.CARD_CHAOS, Card.CARD_CHARIOT, Card.CARD_CLUBS_2, Card.CARD_CREDIT, Card.CARD_DEATH, Card.CARD_DEVIL, Card.CARD_DIAMONDS_2, Card.CARD_DICE_SHARD, Card.CARD_EMERGENCY_CONTACT, Card.CARD_EMPEROR, Card.CARD_EMPRESS, Card.CARD_ERA_WALK, Card.CARD_FOOL, Card.CARD_GET_OUT_OF_JAIL, Card.CARD_HANGED_MAN, Card.CARD_HEARTS_2, Card.CARD_HERMIT, Card.CARD_HIEROPHANT, Card.CARD_HIGH_PRIESTESS, Card.CARD_HOLY, Card.CARD_HUGE_GROWTH, Card.CARD_HUMANITY, Card.CARD_JOKER, Card.CARD_JUDGEMENT, Card.CARD_JUSTICE, Card.CARD_LOVERS, Card.CARD_MAGICIAN, Card.CARD_MOON, Card.CARD_QUEEN_OF_HEARTS, Card.CARD_QUESTIONMARK, Card.CARD_REVERSE_CHARIOT, Card.CARD_REVERSE_DEATH, Card.CARD_REVERSE_DEVIL, Card.CARD_REVERSE_EMPEROR, Card.CARD_REVERSE_EMPRESS, Card.CARD_REVERSE_FOOL, Card.CARD_REVERSE_HANGED_MAN, Card.CARD_REVERSE_HERMIT, Card.CARD_REVERSE_HIEROPHANT, Card.CARD_REVERSE_HIGH_PRIESTESS, Card.CARD_REVERSE_JUDGEMENT, Card.CARD_REVERSE_JUSTICE, Card.CARD_REVERSE_LOVERS, Card.CARD_REVERSE_MAGICIAN, Card.CARD_REVERSE_MOON, Card.CARD_REVERSE_STARS, Card.CARD_REVERSE_STRENGTH, Card.CARD_REVERSE_SUN, Card.CARD_REVERSE_TEMPERANCE, Card.CARD_REVERSE_TOWER, Card.CARD_REVERSE_WHEEL_OF_FORTUNE, Card.CARD_REVERSE_WORLD, Card.CARD_RULES}
            if rand == 100 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_COLLECTIBLE,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 95 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    chests[rng:RandomInt(#chests - 1) + 1],
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 90 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_TAROTCARD,
                    runes[rng:RandomInt(#runes - 1) + 1],
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 87 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_TRINKET,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 82 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_PILL,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 77 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_TAROTCARD,
                    cards[rng:RandomInt(#cards - 1) + 1],
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 62 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_COIN,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_COIN,
                    0,
                    game:GetRoom():FindFreePickupSpawnPosition(player.Position),
                    Vector(0, 0),
                    nil
                )
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_COIN,
                    0,
                    game:GetRoom():FindFreePickupSpawnPosition(player.Position),
                    Vector(0, 0),
                    nil
                )
            elseif rand > 47 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_BOMB,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 32 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_KEY,
                    0,
                    pos,
                    Vector(0, 0),
                    nil
                )
            elseif rand > 5 then
                if game:GetRoom():GetType() == RoomType.ROOM_ANGEL then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_HEART,
                        HeartSubType.HEART_SOUL,
                        pos,
                        Vector(0, 0),
                        nil
                    )
                else
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_HEART,
                        HeartSubType.HEART_BLACK,
                        pos,
                        Vector(0, 0),
                        nil
                    )
                end
            else
                spawned = false
            end
            if spawned then
                player:AnimateHappy()
                sfxManager:Play(SoundEffect.SOUND_THUMBSUP)
            else
                player:AnimateSad()
                sfxManager:Play(SoundEffect.SOUND_THUMBS_DOWN)
            end
        end
        return true
    end
    return nil
end
function ____exports.alabasterHearts(self, pickup, modPlayerData)
    if (pickup.Variant == PickupVariant.PICKUP_HEART) and (((pickup.SubType == HeartSubType.HEART_FULL) or (pickup.SubType == HeartSubType.HEART_HALF)) or (pickup.SubType == HeartSubType.HEART_DOUBLEPACK)) then
        do
            local i = 0
            while i < game:GetNumPlayers() do
                local player = game:GetPlayer(i)
                if (player ~= nil) and (player:GetPlayerType() == ModPlayerTypes.ALABASTER) then
                    if player.Position:Distance(pickup.Position) < (player.Size + pickup.Size) then
                        pickup:Remove()
                        local ____switch25 = pickup.SubType
                        if ____switch25 == HeartSubType.HEART_DOUBLEPACK then
                            goto ____switch25_case_0
                        elseif ____switch25 == HeartSubType.HEART_FULL then
                            goto ____switch25_case_1
                        end
                        goto ____switch25_case_default
                        ::____switch25_case_0::
                        do
                            local ____obj, ____index = modPlayerData.data[i + 1], "bdcharge"
                            ____obj[____index] = ____obj[____index] + 4
                            goto ____switch25_end
                        end
                        ::____switch25_case_1::
                        do
                            do
                                local ____obj, ____index = modPlayerData.data[i + 1], "bdcharge"
                                ____obj[____index] = ____obj[____index] + 2
                                goto ____switch25_end
                            end
                        end
                        ::____switch25_case_default::
                        do
                            do
                                local ____obj, ____index = modPlayerData.data[i + 1], "bdcharge"
                                ____obj[____index] = ____obj[____index] + 1
                                goto ____switch25_end
                            end
                        end
                        ::____switch25_end::
                        print(modPlayerData.data[i + 1].bdcharge)
                    end
                end
                i = i + 1
            end
        end
    end
end
return ____exports
 end,
["callbacks.MC_POST_PICKUP_UPDATE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____blooddrive = require("items.active.blooddrive")
local alabasterHearts = ____blooddrive.alabasterHearts
function ____exports.postPickupUpdate(self, pickup, modPlayerData)
    if pickup.Variant == PickupVariant.PICKUP_HEART then
        alabasterHearts(nil, pickup, modPlayerData)
    end
end
return ____exports
 end,
["callbacks.MC_POST_PLAYER_INIT"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____pocketItems = require("globals.pocketItems")
local pocketItems = ____pocketItems.pocketItems
function ____exports.postPlayerInit(self, _player, modPlayerData)
    pocketItems(nil, modPlayerData)
end
return ____exports
 end,
["callbacks.MC_POST_PLAYER_UPDATE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____alabaster = require("globals.alabaster")
local alabasterHealth = ____alabaster.alabasterHealth
function ____exports.playerUpdate(self, player)
    alabasterHealth(nil, player)
end
return ____exports
 end,
["callbacks.MC_POST_PROJECTILE_INIT"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local rocks = ____fatfetus.rocks
function ____exports.projectileInit(self, projectile)
    if projectile.Variant == ProjectileVariant.PROJECTILE_ROCK then
        rocks(nil, projectile)
    end
end
return ____exports
 end,
["callbacks.MC_POST_RENDER"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local hud = require("globals.hud")
function ____exports.render(self, modPlayerData)
    hud:render(modPlayerData)
end
return ____exports
 end,
["callbacks.MC_POST_UPDATE"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.postUpdate(self)
end
return ____exports
 end,
["callbacks.MC_PRE_GAME_EXIT"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____saveload = require("globals.saveload")
local save = ____saveload.save
function ____exports.preGameExit(self, forgottenFables, modPlayerData)
    save(nil, forgottenFables, modPlayerData)
end
return ____exports
 end,
["callbacks.MC_PRE_TEAR_COLLISION"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____ghostshot = require("items.passive.ghostshot")
local ghostCollide = ____ghostshot.ghostCollide
function ____exports.preTearCollision(self, tear, collider, _low)
    ghostCollide(nil, tear, collider)
end
return ____exports
 end,
["items.active.russianroulette"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local sfxManager = ____constants.sfxManager
function ____exports.rRoulette(self, rng, player)
    if Game():GetRoom():GetAliveEnemiesCount() ~= 0 then
        if math.abs(
            rng:RandomInt(
                math.floor(
                    Isaac.GetPlayer().Luck + 0.5
                ) + 6
            )
        ) == 0 then
            player:TakeDamage(
                255,
                DamageFlag.DAMAGE_NO_MODIFIERS,
                EntityRef(player),
                0
            )
            sfxManager:Play(SoundEffect.SOUND_EXPLOSION_WEAK)
        else
            for ____, entity in ipairs(
                Isaac.GetRoomEntities()
            ) do
                if entity:IsVulnerableEnemy() then
                    entity:Kill()
                end
            end
            sfxManager:Play(SoundEffect.SOUND_EXPLOSION_STRONG)
            print(
                rng:RandomInt(1)
            )
        end
        return true
    end
    return false
end
return ____exports
 end,
["items.active.stoned6"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
function ____exports.stoneD6(self)
    for ____, entity in ipairs(
        Isaac.GetRoomEntities()
    ) do
        if (entity.Type == EntityType.ENTITY_PICKUP) and (entity.Variant == PickupVariant.PICKUP_COLLECTIBLE) then
            local totalItems = (#__TS__ObjectKeys(CollectibleType) - 1) + #__TS__ObjectKeys(ModItemTypes)
            if entity.SubType == CollectibleType.COLLECTIBLE_NULL then
                entity:Remove()
                entity:Update()
                Isaac.Explode(entity.Position, nil, 0)
                Isaac.GridSpawn(GridEntityType.GRID_ROCKT, 0, entity.Position, true)
                return true
            end
            __TS__OptionalMethodCall(
                entity:ToPickup(),
                "Morph",
                entity.Type,
                entity.Variant,
                math.abs(entity.SubType - (totalItems - 1)),
                true
            )
            Isaac.Spawn(
                EntityType.ENTITY_EFFECT,
                EffectVariant.POOF01,
                0,
                entity.Position,
                Vector(0, 0),
                nil
            ):Kill()
            entity:Update()
        end
    end
    return true
end
return ____exports
 end,
["callbacks.MC_USE_ITEM"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ____costumes = require("globals.costumes")
local costumes = ____costumes.costumes
local ____blooddrive = require("items.active.blooddrive")
local bloodDrive = ____blooddrive.bloodDrive
local ____russianroulette = require("items.active.russianroulette")
local rRoulette = ____russianroulette.rRoulette
local ____stoned6 = require("items.active.stoned6")
local stoneD6 = ____stoned6.stoneD6
function ____exports.useItem(self, item, rng, player, _slot, modPlayerData)
    local returnVal = nil
    local ____switch3 = item
    if ____switch3 == ModItemTypes.RUSSIANROULETTE then
        goto ____switch3_case_0
    elseif ____switch3 == ModItemTypes.BLOODDRIVE then
        goto ____switch3_case_1
    elseif ____switch3 == ModItemTypes.STONE_D6 then
        goto ____switch3_case_2
    end
    goto ____switch3_case_default
    ::____switch3_case_0::
    do
        do
            returnVal = rRoulette(nil, rng, player)
            goto ____switch3_end
        end
    end
    ::____switch3_case_1::
    do
        do
            returnVal = bloodDrive(nil, player, modPlayerData, rng)
            goto ____switch3_end
        end
    end
    ::____switch3_case_2::
    do
        do
            returnVal = stoneD6(nil)
            goto ____switch3_end
        end
    end
    ::____switch3_case_default::
    do
        goto ____switch3_end
    end
    ::____switch3_end::
    costumes(nil, modPlayerData)
    if returnVal ~= nil then
        return returnVal
    end
end
return ____exports
 end,
["callbacks.MC_USE_PILL"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____costumes = require("globals.costumes")
local costumes = ____costumes.costumes
function ____exports.usePill(self, _pillEffect, _player, _useFlags, modPlayerData)
    costumes(nil, modPlayerData)
end
return ____exports
 end,
["callbacks.callbacks"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____MC_ENTITY_TAKE_DMG = require("callbacks.MC_ENTITY_TAKE_DMG")
local entityTakeDamage = ____MC_ENTITY_TAKE_DMG.entityTakeDamage
local ____MC_EVALUATE_CACHE = require("callbacks.MC_EVALUATE_CACHE")
local evalCache = ____MC_EVALUATE_CACHE.evalCache
local ____MC_NPC_UPDATE = require("callbacks.MC_NPC_UPDATE")
local npcUpdate = ____MC_NPC_UPDATE.npcUpdate
local ____MC_POST_BOMB_INIT = require("callbacks.MC_POST_BOMB_INIT")
local bombInit = ____MC_POST_BOMB_INIT.bombInit
local ____MC_POST_BOMB_UPDATE = require("callbacks.MC_POST_BOMB_UPDATE")
local bombUpdate = ____MC_POST_BOMB_UPDATE.bombUpdate
local ____MC_POST_FIRE_TEAR = require("callbacks.MC_POST_FIRE_TEAR")
local postFireTear = ____MC_POST_FIRE_TEAR.postFireTear
local ____MC_POST_GAME_STARTED = require("callbacks.MC_POST_GAME_STARTED")
local gameStart = ____MC_POST_GAME_STARTED.gameStart
local ____MC_POST_NEW_ROOM = require("callbacks.MC_POST_NEW_ROOM")
local postNewRoom = ____MC_POST_NEW_ROOM.postNewRoom
local ____MC_POST_NPC_RENDER = require("callbacks.MC_POST_NPC_RENDER")
local npcRender = ____MC_POST_NPC_RENDER.npcRender
local ____MC_POST_PICKUP_UPDATE = require("callbacks.MC_POST_PICKUP_UPDATE")
local postPickupUpdate = ____MC_POST_PICKUP_UPDATE.postPickupUpdate
local ____MC_POST_PLAYER_INIT = require("callbacks.MC_POST_PLAYER_INIT")
local postPlayerInit = ____MC_POST_PLAYER_INIT.postPlayerInit
local ____MC_POST_PLAYER_UPDATE = require("callbacks.MC_POST_PLAYER_UPDATE")
local playerUpdate = ____MC_POST_PLAYER_UPDATE.playerUpdate
local ____MC_POST_PROJECTILE_INIT = require("callbacks.MC_POST_PROJECTILE_INIT")
local projectileInit = ____MC_POST_PROJECTILE_INIT.projectileInit
local ____MC_POST_RENDER = require("callbacks.MC_POST_RENDER")
local render = ____MC_POST_RENDER.render
local ____MC_POST_UPDATE = require("callbacks.MC_POST_UPDATE")
local postUpdate = ____MC_POST_UPDATE.postUpdate
local ____MC_PRE_GAME_EXIT = require("callbacks.MC_PRE_GAME_EXIT")
local preGameExit = ____MC_PRE_GAME_EXIT.preGameExit
local ____MC_PRE_TEAR_COLLISION = require("callbacks.MC_PRE_TEAR_COLLISION")
local preTearCollision = ____MC_PRE_TEAR_COLLISION.preTearCollision
local ____MC_USE_ITEM = require("callbacks.MC_USE_ITEM")
local useItem = ____MC_USE_ITEM.useItem
local ____MC_USE_PILL = require("callbacks.MC_USE_PILL")
local usePill = ____MC_USE_PILL.usePill
____exports.render = render
____exports.gameStart = gameStart
____exports.playerUpdate = playerUpdate
____exports.useItem = useItem
____exports.entityTakeDamage = entityTakeDamage
____exports.evalCache = evalCache
____exports.bombInit = bombInit
____exports.postFireTear = postFireTear
____exports.postNewRoom = postNewRoom
____exports.npcRender = npcRender
____exports.postPickupUpdate = postPickupUpdate
____exports.postPlayerInit = postPlayerInit
____exports.projectileInit = projectileInit
____exports.preGameExit = preGameExit
____exports.preTearCollision = preTearCollision
____exports.usePill = usePill
____exports.bombUpdate = bombUpdate
____exports.postUpdate = postUpdate
____exports.npcUpdate = npcUpdate
return ____exports
 end,
["main"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local callbacks = require("callbacks.callbacks")
local ____playerdata = require("playerdata")
local PlayerData = ____playerdata.PlayerData
local modPlayerData = {
    data = {
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0),
        __TS__New(PlayerData, nil, 0, false, 0)
    }
}
local forgottenFables = RegisterMod("Forgotten Fables", 1)
forgottenFables:AddCallback(
    ModCallbacks.MC_PRE_GAME_EXIT,
    function()
        callbacks:preGameExit(forgottenFables, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, callbacks.playerUpdate)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_RENDER,
    function()
        callbacks:render(modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_GAME_STARTED,
    function(____, continued)
        callbacks:gameStart(forgottenFables, modPlayerData, continued)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    function(____, player, flag)
        callbacks:evalCache(modPlayerData, player, flag)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, callbacks.preTearCollision)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    function(____, player)
        callbacks:postPlayerInit(player, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        callbacks:postNewRoom(modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_PILL,
    function(____, pillEffect, player, flags)
        callbacks:usePill(pillEffect, player, flags, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_USE_ITEM,
    function(____, item, rng, player, _flag, slot)
        callbacks:useItem(item, rng, player, slot, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, callbacks.npcRender)
forgottenFables:AddCallback(
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    function(____, entity, amt, flags, src)
        callbacks:entityTakeDamage(entity, amt, flags, src, modPlayerData)
    end
)
forgottenFables:AddCallback(
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    function(____, pickup)
        callbacks:postPickupUpdate(pickup, modPlayerData)
    end
)
forgottenFables:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, callbacks.postFireTear)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, callbacks.bombUpdate)
forgottenFables:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, callbacks.bombInit)
forgottenFables:AddCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, callbacks.projectileInit)
forgottenFables:AddCallback(ModCallbacks.MC_POST_UPDATE, callbacks.postUpdate)
forgottenFables:AddCallback(ModCallbacks.MC_NPC_UPDATE, callbacks.npcUpdate)
return ____exports
 end,
["globals.floorinit"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.newFloor(self)
end
return ____exports
 end,
["globals.razors"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.razor(self, _modPlayerData, _pickup)
end
return ____exports
 end,
["globals.sarah"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.sarahStats(self, _player, _modPlayerData, _flags)
end
return ____exports
 end,
["globals.sarahlostdamage"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.sarahLostKill(self, _modPlayerData, _tookDamage, _amount, _flags)
    return true
end
return ____exports
 end,
["items.active.suicide"] = function() --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.suicide(self, _modPlayerData, _player)
    return false
end
function ____exports.revive(self, _modPlayerData, _player)
    return false
end
function ____exports.bodyAnim(self, _entity)
end
return ____exports
 end,
}
return require("main")
