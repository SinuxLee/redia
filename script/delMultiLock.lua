local token = ARGV[1]
local count = 0

for _, v in ipairs(KEYS) do
    if (redis.call("get", v) ~= token) then
        break
    end
    count = count + redis.call("del",v) 
end

return count

