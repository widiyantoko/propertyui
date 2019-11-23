<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-19
  Time: 19:30
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Reset Password</title>
    </head>

    <body>
        <div class="content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-content-box">
                            <div class="details">
                                <g:if test="${flash.message || flash.error}">
                                    <g:if test="${flash.message}">
                                        <div class="alert alert-danger wow fadeInRight delay-03s" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <p>${raw(flash.message)}</p>
                                        </div>
                                    </g:if>
                                    <g:if test="${flash.error}">
                                        <div class="alert alert-danger wow fadeInRight delay-03s" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <p>${flash.error}</p>
                                        </div>
                                    </g:if>
                                </g:if>
                                <div class="main-title">
                                    <h1>Forgot Password</h1>
                                </div>
                                <g:form class="js-forgot-password-form" controller="login" action="" method="POST">
                                    <div class="form-group">
                                        <input type="text" id="forgot-email" name="email" class="input-text" placeholder="Email Address"
                                               data-url-remote="${createLink(action: 'checkEmailAddress', id: 'forgot')}"
                                               data-msg="${message(code: 'email.require.label', default: 'Email Address is required.')}"
                                               data-msg-email="${message(code: 'property.model.UserRegister.email.invalid.email', default: 'Email "{0}" is invalid.')}"
                                               data-msg-remote="${message(code: 'property.model.ForgotPassword.email.notFound', default: 'No account was found  with this email address.')}"
                                        />
                                        <g:hasErrors bean="${forgotPassword}" field="email">
                                            <label id="forgot-email-error" class="o-form-error" for="forgot-email">
                                                <g:fieldError field="email" bean="${forgotPassword}"/>
                                            </label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">Send Me Email</button>
                                    </div>
                                </g:form>
                            </div>
                            <div class="footer">
                                <span>
                                    I want to <a href="${createLink(controller: 'login', action: 'auth')}">return to login</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>