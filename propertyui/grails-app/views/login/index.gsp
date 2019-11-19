<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-19
  Time: 19:24
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Login</title>
    </head>

    <body>
        <div class="content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-content-box">
                            <div class="details">
                                <div class="main-title">
                                    <h1>Login</h1>
                                </div>
                                <form action="index.html" method="GET">
                                    <div class="form-group">
                                        <input type="email" name="email" class="input-text" placeholder="Email Address">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="Password" class="input-text" placeholder="Password">
                                    </div>
                                    <div class="checkbox">
                                        <div class="ez-checkbox pull-left">
                                            <label>
                                                <input type="checkbox" class="ez-hide">
                                                Remember me
                                            </label>
                                        </div>
                                        <a href="${createLink(controller: 'login', action: 'forgotPassword')}" class="link-not-important pull-right">Forgot Password</a>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">login</button>
                                    </div>
                                </form>
                            </div>
                            <div class="footer">
                                <span>
                                    New to Tempo? <a href="${createLink(controller: 'registration', action: 'index')}">Sign up now</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>