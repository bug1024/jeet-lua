
-- mysql test
local mysql = require "core.mysql"
local db, err = mysql:new()
if not db then
    ngx.say("failed to instantiate mysql: ", err)
    return
end

local ok, err, errno, sqlstate = db:connect(require "config.mysql")

if not ok then
    ngx.say("failed to connect: ", err, ": ", errno, " ", sqlstate)
    return
end

res, err, errno, sqlstate = db:query("select * from car_sale limit 2")
local cjson = require "cjson"
ngx.say(cjson.encode(res))

-- redis test
local redis = require "core.redis"
local red = redis:new()
local ok, err = red:connect("192.168.5.31", 6379)
if not ok then
    ngx.say("failed to connect redis: ", err)
    return
end

ok, err = red:set("lua-redis-key", "lua-redis-value")
if not ok then
    ngx.say("failed to set key: ", err)
    return
end

local res, err = red:get("lua-redis-key")
if not res then
    ngx.say("failed to get key: ", err)
    return
end
ngx.say(res)

-- memcached test
local memcached = require "core.memcached"
local mem = memcached:new()
local ok, err = mem:connect("192.168.5.201", 11211)
if not ok then
    ngx.say("failed to connect memcached: ", err)
    return
end

local ok, err = mem:set("lua-mem-key", "lua-mem-value", 1000)
if not ok then
    ngx.say("failed to set key: ", err)
    return
end

local res, err = mem:get("lua-mem-key")
if not res then
    ngx.say("failed to get key: ", err)
    return
end
ngx.say(res)
