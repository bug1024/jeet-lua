-- base model

local model = {
    table = "name"
}

function model:getConnect()
    if self.handle == nil then
        local mysql = require "core.mysql"
        self.handle  = mysql:new()
        self.handle:connect(require "config.mysql")
    end

    return self
end

function model:getOne()
    local one = self.handle:query("select * from " .. self.table .. " limit 1")
    if one then
        return one[1]
    end
    return nil
end

function model:getMany()
    return self.handle:query("select * from " .. self.table)
end

return model

