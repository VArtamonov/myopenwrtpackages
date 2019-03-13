
local response = require "wsapi.response"
local cgilua = require "cgilua.main"

local _M = {}

_M._NAME = "my-pages"
_M._VERSION = "0.0.1"
_M._COPYRIGHT = "Copyright (C) 2019"
_M._DESCRIPTION = "Web Development"

function _M.run(wsapi_env)
	local res = response.new()
	cgilua.main(wsapi_env, res)
	return res:finish()
end

return _M
