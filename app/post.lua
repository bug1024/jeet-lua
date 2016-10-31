
local Post = {}

Post.index = function(data)
    ngx.say("I'm your father")
end

Post.get = function()
    ngx.say("you get posts")
end

Post.get_latest_posts = function()
    ngx.say("you get latest posts")
end

return Post
