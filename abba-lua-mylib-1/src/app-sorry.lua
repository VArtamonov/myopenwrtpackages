#!/usr/bin/env lua

local _M = {}

function _M.run(wsapi_env)
  local headers = { ["Content-type"] = "text/html" }

  local function hello_text()
    coroutine.yield("<html><body>")
    coroutine.yield("<p>Error! Sorry, the server is not working</p>")
    coroutine.yield("</body></html>")
  end

  return 404, headers, coroutine.wrap(hello_text)
end

return _M
