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
        <title>${message(code: 'public.label.forgot.password', default: 'Lupa Password')}</title>
    </head>

    <body>
        <g:render template="/templates/header"/>
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
                                        <p>${message(code: 'property.email.reset.password.success.label', default: 'Email reset password telah di kirim ke<br> {0}', args:[flash.email])}</p>
                                    </div>
                                </g:if>
                                <div class="main-title">
                                    <h1>${message(code: 'public.label.forgot.password', default: 'Lupa Password')}</h1>
                                </div>
                                <g:form class="js-forgot-password-form" controller="login" action="sendResetLink" method="POST">
                                    <div class="form-group">
                                        <input type="text" id="forgot-email" name="email" class="input-text"
                                               placeholder="${message(code: 'placeholder.email.label', default: 'Alamat Email')}"
                                               data-url-remote="${createLink(action: 'checkEmailAddress', id: 'forgot')}"
                                               data-msg="${message(code: 'email.require.label', default: 'Email harus diisi.')}"
                                               data-msg-email='${message(code: 'property.model.ForgotPassword.email.invalid.email', default: 'Email "{0}" tidak valid.')}'
                                               data-msg-remote="${message(code: 'property.model.ForgotPassword.email.notFound', default: 'Akun tidak ditemukan.')}"
                                        />
                                        <g:hasErrors bean="${forgotPassword}" field="email">
                                            <label id="forgot-email-error" class="o-form-error" for="forgot-email">
                                                <g:fieldError field="email" bean="${forgotPassword}"/>
                                            </label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">
                                            ${message(code: 'property.button.send.reset.password', default: 'Kirim email reset password')}
                                        </button>
                                    </div>
                                </g:form>
                            </div>
                            <div class="footer">
                                <span>
                                    Kembali ke <a href="${createLink(controller: 'login', action: 'auth')}">${message(code: 'public.label.login', default: 'Login')}</a> atau
                                </span>
                                <a class="" href="${createLink(controller: 'property', action: 'index')}">${message(code: 'public.home.label', default: 'Beranda')}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:render template="/templates/simple_footer"/>
        <g:render template="/templates/footer"/>
    </body>
</html>