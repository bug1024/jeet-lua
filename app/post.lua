
local tpl  = require "core.template"

local Post = {}

Post.index = function(data)
    tpl.render("app/view.html", {desc="simple web framework based on openresty"})
end

Post.get = function()
    local cjson = require "cjson"
    local name = require "core.model"

    local one = name:getConnect():getOne()
    local many = name:getConnect():getMany()

    ngx.say(cjson.encode(one))
    ngx.say(cjson.encode(many))
end

Post.get_latest_posts = function()
    ngx.say("you get latest posts")
end

return Post
