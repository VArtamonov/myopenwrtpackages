#!/usr/bin/env lua

local os = require"os"

local _M = { }

function _M.run(wsapi_env)
  local headers = { ["Content-type"] = "text/html" }

  local function hello_text()

    coroutine.yield([[
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="ROUTER STATUS">
<meta name="author" content="ABBA">
<link rel="icon" href="/favicon.ico">
<title>ROUTER - WEB</title>
<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
]])

    coroutine.yield([[
    <!-- HEADER SECTION START -->
    <nav class="navbar navbar-default navbar-fixed-top header-section border-line-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">ROUTER</a>
        </div>

        <!-- div id="navbar" class="navbar-collapse collapse" -->
        <div id="navbar" class="navbar-collapse">
          <!-- ul class="nav nav-tabs" -->
          <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
          </ul>
        </div>
	</div>
    <!--/.nav-collapse -->
    </nav>
]])


    coroutine.yield([[
    <!-- CONTENT-WRAPPER SECTION START -->
    <div class="content-wrapper">
      <div class="container">
        <div class="row pad-botm">
          <div class="col-md-12">
            <h4 class="header-line">Blank Page</h4>       
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="alert alert-info">
]])

    coroutine.yield("<p><strong>Hello Wsapi!</strong></p>")
    coroutine.yield("<p>REQUEST_METHOD:  " .. wsapi_env.REQUEST_METHOD .. "</p>")
    coroutine.yield("<p>QUERY_STRING:    " .. wsapi_env.QUERY_STRING .. "</p>")
    coroutine.yield("<p>CONTENT_LENGTH:  " .. wsapi_env.CONTENT_LENGTH .. "</p>")
    coroutine.yield("<p>CONTENT_TYPE:    " .. wsapi_env.QUERY_STRING .. "</p>")
    coroutine.yield("<p>PATH_INFO:       " .. wsapi_env.PATH_INFO .. "</p>")
    coroutine.yield("<p>SCRIPT_NAME:     " .. wsapi_env.SCRIPT_NAME .. "</p>")
    coroutine.yield("<p>SCRIPT_FILENAME: " .. wsapi_env.SCRIPT_FILENAME .. "</p>")
    coroutine.yield("<p>PATH_TRANSLATED: " .. wsapi_env.PATH_TRANSLATED .. "</p>")
    coroutine.yield("<p>REDIRECT_STATUS: " .. wsapi_env.REDIRECT_STATUS .. "</p>")
    coroutine.yield("<p>REQUEST_URI:     " .. wsapi_env.REQUEST_URI .. "</p>")


    coroutine.yield([[		
<br />
<br />
</div>
</div>
</div>
</div>
</div>
<!-- CONTENT-WRAPPER SECTION END -->
]])

--	<div class="pull-left">Today is: <%=os.date()%></div>
--		<strong>CLIENT</strong>[<%=wsapi_envREMOTE_ADDR%>]
--		=><strong>SERVER</strong>[<%=wsapi_env.SERVER_NAME%>:<%=wsapi_env.SERVER_PORT%>]

    coroutine.yield([[
<!-- FOOTER SECTION START -->
<footer class="footer-section">
<div class="container-fluid">
<div class="pull-right">ABB&copy; 2019 ROUTER | OPEN </div>
</div>
</footer>
<!-- FOOTER SECTION START -->
<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.min.js"></script>
<script src="/js/js.cookie.js"></script>
<!-- CUSTOM SCRIPTS  -->
<script src="/js/custom.js"></script>
</body>
</html>
]])
  end

  return wsapi_env.REDIRECT_STATUS, headers, coroutine.wrap(hello_text)
end

return _M
