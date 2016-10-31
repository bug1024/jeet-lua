
local tpl  = require "core.template"

local Post = {}

Post.index = function(data)
    tpl.render("app/view.html", {desc="simple web framework based on openresty"})
end

Post.get = function()
    ngx.say("you get posts")
end

Post.get_latest_posts = function()
    ngx.say("you get latest posts")
end

return Post
