<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-19
  Time: 19:27
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Sign Up</title>
    </head>

    <body>
        <div class="content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-content-box">
                            <div class="details">
                                <div class="main-title">
                                    <h1><span>Signup</span></h1>
                                </div>
                                <form action="index.html" method="GET">
                                    <div class="form-group">
                                        <input type="text" name="fullname" class="input-text" placeholder="Full Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email" class="input-text" placeholder="Email Address">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="input-text" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="confirm_Password" class="input-text" placeholder="Confirm Password">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">Signup</button>
                                    </div>
                                </form>
                            </div>
                            <div class="footer">
                                <span>
                                    I want to <a href="${createLink(controller: 'login', action: 'index')}">return to login</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>