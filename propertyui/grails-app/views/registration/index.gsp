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
                            <div class="alert alert-danger wow fadeInRight delay-03s js-alert-container ${flash.error ? '' : 'hide'}"  role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <p>Registration failed</p>
                            </div>
                            <div class="details">
                                <div class="main-title">
                                    <h1><span>Signup</span></h1>
                                </div>
                                <g:form class="js-registration-form" controller="registration" action="registerNewUser" method="POST" novalidate="true">
                                    <div class="form-group">
                                        <input type="text" name="firstName" id="firstName" class="input-text ${hasErrors(bean:userRegister, field:'firstName', 'form-has-error')}"
                                               value="${this.userRegister?.firstName}"
                                               placeholder="${message(code: 'placeholder.first.name.label', default: 'First Name')}"
                                               data-rule-required="true"
                                               data-msg="${message(code: 'first.name.required.label', default: 'First Name is required.')}"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="lastName" id="lastName" class="input-text ${hasErrors(bean:userRegister, field: 'lastName', 'form-has-error')}"
                                               value="${this.userRegister?.lastName}"
                                               placeholder="${message(code: 'placeholder.last.name.label', default: 'Last Name')}"
                                               data-rule-required="true"
                                               data-msg="${message(code: 'last.name.require.label', default: 'Last Name is required.')}"
                                        />
                                    </div>
                                    <div class="js-error-name-placement">
                                        <g:hasErrors bean="${userRegister}" field="firstName">
                                            <label id="firstName-error" class="o-form-error" for="firstName"><g:fieldError bean="${userRegister}" field="firstName"/></label>
                                        </g:hasErrors>
                                        <g:hasErrors bean="${userRegister}" field="lastName">
                                            <label id="lastName-error" class="o-form-error" for="lastName"><g:fieldError bean="${userRegister}" field="lastName"/></label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="email" id="reg_email" class="input-text ${hasErrors(bean:userRegister,field:'email', 'form-has-error')}"
                                               value="${this.userRegister?.email}"
                                               placeholder="${message(code: 'placeholder.email.label', default: 'Email Address')}"
                                               data-rule-required="true"
                                               autocomplete="off"
                                               data-url-remote="${createLink(action: 'checkEmailAddress', id: 'registration')}"
                                               data-msg-remote="${message(code: 'property.model.UserRegister.duplicate.invalid.email', default: 'This Email has been used.')}"
                                               data-msg="${message(code: 'email.require.label', default: 'Email Address is required.')}"
                                               data-msg-email='${message(code: 'property.model.UserRegister.email.invalid.email', default: 'Email "{0}" is invalid.')}'
                                        />
                                        <g:hasErrors bean="${userRegister}" field="email">
                                            <label id="reg_email-error" class="o-form-error" for="reg_email"><g:fieldError bean="${userRegister}" field="email"/></label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="reg_password" class="input-text ${hasErrors(bean:userRegister,field:'password', 'form-has-error')}"
                                               data-rule-minlength="6"
                                               data-rule-required="true"
                                               autocomplete="off"
                                               placeholder="${message(code: 'placeholder.password.label', default: 'Password')}"
                                               data-msg="${message(code: 'password.require.label', default: 'Password is required.')}"
                                               data-msg-minlength="${message(code: 'property.model.UserRegister.password.minSize.error', default: 'Password needs to be at least 6 characters.')}"
                                        />
                                        <g:hasErrors bean="${userRegister}" field="password">
                                            <label id="reg_password-error" class="o-form-error" for="reg_password"><g:fieldError bean="${userRegister}" field="password"/></label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="passwordAgain" id="passwordAgain" class="input-text ${hasErrors(bean:userRegister,field:'passwordAgain', 'form-has-error')}"
                                               placeholder="Confirm Password" autocomplete="off"
                                               data-rule-equalTo="#reg_password" data-rule-required="true"
                                               data-msg="${message(code: 'property.model.UserRegister.password.invalid', default : 'Password not match.')}"
                                               data-msg-equalTo="${message(code: 'property.model.UserRegister.password.invalid', default: 'Password not match.')}"
                                        />
                                        <g:hasErrors bean="${userRegister}" field="passwordAgain">
                                            <label id="passwordAgain-error" class="o-form-error" for="passwordAgain"><g:fieldError bean="${userRegister}" field="passwordAgain"/></label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <div class="checkbox">
                                            <input type="checkbox" name="acceptTnc" id="label-agreement" value="true"
                                                   data-rule-required="true"
                                                   data-msg="${message(code: 'property.model.UserRegister.tnc.accepted', default: 'Please agree to the Terms of Use and Privacy Policy before proceeding.')}"
                                            />
                                            <label for="label-agreement" class="${hasErrors(bean: userRegister, field: 'acceptTnc', 'check-has-error')}">
                                                <g:message code="property.accept.tnc.agreement.label"  default="${'I have read and agreed to the <a href="{0}" target="_blank">Term of Use</a> and <a href="{1}" target="_blank">Privacy Policy</a>'}"
                                                    args=""/>
                                            </label>
                                        </div>
                                        <g:hasErrors bean="${userRegister}" field="acceptTnc">
                                            <label id="label-agreement-error" class="o-form-error" for="label-agreement"><g:fieldError bean="${userRegister}" field="acceptTnc"/></label>
                                        </g:hasErrors>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="button-md button-theme btn-block">Signup</button>
                                    </div>
                                </g:form>
                            </div>
                            <div class="footer">
                                <span>
                                    I want to <a href="${createLink(url: '/login/auth')}">return to login</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>