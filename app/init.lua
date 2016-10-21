
local mysql = require "core.mysql"
local db, err = mysql:new()
if not db then
    ngx.say("failed to instantiate mysql: ", err)
    return
end
ngx.say("success to instantiate mysql <hr>");

-- 1 sec
db:set_timeout(1000)

local ok, err, errno, sqlstate = db:connect(require "config.mysql")

if not ok then
    ngx.say("failed to connect: ", err, ": ", errno, " ", sqlstate)
    return
end
ngx.say("success to connect mysql <hr>");

-- query
res, err, errno, sqlstate = db:query("select * from car_sale limit 2")
local cjson = require "cjson"
ngx.say(cjson.encode(res))

