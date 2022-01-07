
local key = KEYS[1]
local token = ARGV[1]

local value = redis.call("GET", key)
if value ~= token then
    return 0
end

return redis.call("DEL", key)

