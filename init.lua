-- ngx
local method = ngx.var.request_method
local uri    = ngx.var.request_uri
local data   = ngx.req.get_uri_args()

-- router
local r = require("core.router"):new()
r:any("/:app/:controller/:action/", function(params, method)
    local path = params.app .. "." .. params.controller
    ngx.say(path .. "." .. params.action)
    local controller = require(path)
    controller[params.action]()
end)
local ok, err = r:execute(method, uri, data)

if ok then
    ngx.status = 200
else
    ngx.status = 404
    ngx.say(err)
end

