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
        <title>Forgot Password</title>
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
                                <g:if test="${flash.email}">
                                    <div class="alert alert-danger wow fadeInRight delay-03s" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <p>Reset password email has been sent to ${flash.email ?: ''}</p>
                                    </div>
                                </g:if>
                                <div class="main-title">
                                    <h1>Forgot Password</h1>
                                </div>
                                <g:form class="js-forgot-password-form" controller="login" action="sendResetLink" method="POST">
                                    <div class="form-group">
                                        <input type="text" id="forgot-email" name="email" class="input-text" placeholder="Email Address"
                                               data-url-remote="${createLink(action: 'checkEmailAddress', id: 'forgot')}"
                                               data-msg="${message(code: 'email.require.label', default: 'Email Address is required.')}"
                                               data-msg-email='${message(code: 'property.model.ForgotPassword.email.invalid.email', default: 'Email "{0}" is invalid.')}'
                                               data-msg-remote="${message(code: 'property.model.ForgotPassword.email.notFound', default: 'No account was found  with this email address.')}"
                                        />
                                        <g:hasErrors bean="${forgotPassword}" field="email">
                                            <label id="forgot-email-error" class="o-form-error" for="forgot-email">
                                                <g:fieldError field="email" bean="${forgotPassword}"/>
                                            </label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">Kirim email reset password</button>
                                    </div>
                                </g:form>
                            </div>
                            <div class="footer">
                                <span>
                                    Kembali ke <a href="${createLink(controller: 'login', action: 'auth')}">Login</a> atau
                                </span>
                                <a class="" href="${createLink(controller: 'property', action: 'index')}">Beranda</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:render template="/templates/footer"/>
    </body>
</html>