-- ngx
local method = ngx.var.request_method
local uri    = ngx.var.request_uri
local data   = ngx.req.get_uri_args()

-- router
local r = require("core.router"):new()
local pcall  = pcall
r:any("/:app/:controller/:action/", function(params, method)
    local path = params.app .. "." .. params.controller
    local action = params.action

    -- run action
    local ok, err = pcall(function()
        local controller = require(path)
        controller[action]()
    end)

    if err then
        ngx.status = 404
        ngx.say(err)
    end
end)
local ok, err = r:execute(method, uri, data)

if ok then
    ngx.status = 200
else
    ngx.status = 404
    ngx.say(err)
end

