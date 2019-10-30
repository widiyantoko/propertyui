<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-10-29
  Time: 21:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title></title>
    </head>

    <body>
        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

        <!-- Sub banner start -->
        <div class="sub-banner overview-bgi">
            <div class="overlay">
                <div class="container">
                    <div class="breadcrumb-area">
                        <h1>Properties Listing</h1>
                        <ul class="breadcrumbs">
                            <li><a href="${createLink(controller: 'home', action: 'index')}">Home</a></li>
                            <li class="active">Properties Listing</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Banner end -->
        <g:render template="/templates/footer"/>
    </body>
</html>