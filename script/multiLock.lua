
local token = ARGV[1]
local expire = ARGV[2]

for i, v in ipairs(KEYS) do
    if (redis.call("SET", v, token, "NX", "PX", expire) == false) then
        for k=i-1,1,-1 do
            redis.call("DEL", KEYS[k])
        end
        return false
    end
end

return "OK"

