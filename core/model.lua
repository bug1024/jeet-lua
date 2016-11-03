-- base model

local model = {
    table = "name"
}

-- TODO:singleton
function model.getConnect()
    local mysql = require "core.mysql"
    model.handle  = mysql:new()
    model.handle:connect(require "config.mysql")
    return model
end

function model.getOne()
    local one = model.handle:query("select * from " .. model.table .. " limit 1")
    if one then
        return one[1]
    end
    return nil
end

function model.getMany()
    return model.handle:query("select * from " .. model.table)
end

return model

