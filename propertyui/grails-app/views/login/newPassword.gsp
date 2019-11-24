<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-24
  Time: 18:08
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>New Password</title>
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
                                    <h1>New Password</h1>
                                </div>
                                <g:if test="${!invalidToken}">
                                    <g:form class="js-new-password-form" id="${params?.id}" controller="login" action="resetPassword" method="POST">
                                        <div class="form-group">
                                            <input type="password" id="new_password" name="password" class="input-text"
                                                   autocomplete="off" data-rule-minlength="6"
                                                   data-rule-required="true"
                                                   data-msg="${message(code: 'password.require.label', default: 'Password is required.')}"
                                                   data-msg-minlength="${message(code: 'property.model.UserRegister.password.minSize.error', default: 'Password needs to be at least 6 characters.')}"
                                            />
                                            <g:hasErrors bean="${passwordReset}" field="password">
                                                <label id="new_password-error" class="o-form-error" for="new_password">
                                                    <g:fieldError field="password" bean="${passwordReset}"/>
                                                </label>
                                            </g:hasErrors>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="passwordAgain" name="passwordAgain" class="input-text"
                                                   data-rule-required="true" data-rule-equalTo="#new_password"
                                                   data-msg="${message(code: 'property.model.PasswordReset.passwordAgain.doesnotmatch', default: 'Passwords do not match.')}"
                                                   data-msg-equalTo="${message(code: 'property.model.PasswordReset.passwordAgain.doesnotmatch', default: 'Passwords do not match.')}"
                                            />
                                            <g:hasErrors bean="${passwordReset}" field="passwordAgain">
                                                <label id="passwordAgain-error" class="o-form-error" for="passwordAgain">
                                                    <g:fieldError field="passwordAgain" bean="${passwordReset}"/>
                                                </label>
                                            </g:hasErrors>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="button-md button-theme btn-block">Set Password</button>
                                        </div>
                                    </g:form>
                                </g:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>