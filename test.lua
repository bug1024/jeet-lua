local router = require 'core.router'
local r = router.new()

r:any('/hello', function(params, method)
  print('hello world' .. method .. params.name)
end)

r:execute('GET',  '/hello', {name = "wangyu"})
