<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-10
  Time: 22:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>${request.forwardURI}</title>
</head>

<body>
<g:render template="/templates/header_top"/>
<g:render template="/templates/header"/>

<!-- Sub banner start -->
<div class="sub-banner overview-bgi">
    <div class="overlay">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Agent List</h1>
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Agent List</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<g:render template="/templates/footer"/>

</body>
</html>