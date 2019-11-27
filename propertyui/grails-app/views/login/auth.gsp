<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-22
  Time: 17:15
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
                                <g:if test="${flash.error}">
                                    <div class="alert alert-danger wow fadeInRight delay-03s" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <p>${flash.error}</p>
                                    </div>
                                </g:if>
                                <g:if test="${flash.message}">
                                    <div class="alert alert-danger wow fadeInRight delay-03s" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <p>${raw(flash.message)}</p>
                                    </div>
                                </g:if>
                                <div class="main-title">
                                    <h1>Login</h1>
                                </div>
                                <div class="js-validation-error-container"></div><br>
                                <form class="js-login-form" action="${postUrl ?: createLink(url:'/login/authenticate')}" method="post">
                                    <div class="form-group">
                                        <input type="text" id="login-email" name="username" class="input-text login-input" value="${user}"
                                               placeholder="${message(code: 'placeholder.email.label', default: 'Alamat  Email')}"
                                               data-rule-required="true"
                                               data-msg="${message(code: 'public.wrong.email.password.label', default: 'Email atau password tidak sesuai. Coba lagi.')}"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="input-text login-input"
                                               placeholder="${message(code: 'placeholder.password.label', default: 'Password')}"
                                               autocomplete="off"
                                               data-rule-required="true"
                                               data-msg="${message(code: 'public.wrong.email.password.label', default: 'Email atau password tidak sesuai. Coba lagi.')}"
                                        />
                                    </div>
                                    <div class="checkbox">
                                        <div class="ez-checkbox pull-left">
                                            <!--
                                            <label>
                                                <input type="checkbox" class="ez-hide" value="${rememberMeParameter}">
                                                Remember me
                                            </label>
                                            -->
                                        </div>
                                        <a href="${createLink(controller: 'login', action: 'forgotPassword')}" class="link-not-important pull-right">
                                            ${message(code: 'public.label.forgot.password', default: 'Lupa password')}
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block js-btn-login">
                                            ${message(code: 'public.label.login', default: 'Login')}
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="footer">
                                <span>
                                    ${message(code: 'public.label.new.account', default: 'Belum punya akun?')}
                                    <a href="${createLink(controller: 'registration', action: 'index')}">
                                        ${message(code: 'public.label.register', default: 'Daftar')}
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:render template="/templates/footer"/>
    </body>
</html>