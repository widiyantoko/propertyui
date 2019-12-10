<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-12-07
  Time: 17:25
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>${message(code: 'account.myProfile.label', default: 'Profile Saya')}</title>
    </head>

    <body>
        <g:render template="/templates/header"/>

        <!-- My profile start -->
        <div class="content-area my-profile">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <!-- User account box start -->
                        <div class="user-account-box">
                            <div class="header clearfix">
                                <div class="edit-profile-photo">
                                    <img src="http://placehold.it/150x150" alt="agent-1" class="img-responsive">
                                    <div class="change-photo-btn">
                                        <div class="photoUpload">
                                            <span><i class="fa fa-upload"></i>
                                                ${message(code: 'account.upload.image.label', default: 'Upload Photo')}
                                            </span>
                                            <input type="file" class="upload">
                                        </div>
                                    </div>
                                </div>
                                <h3>${user?.getFullName()}</h3>
                                <p>${user?.email}</p>

                                <ul class="social-list clearfix">
                                    <li>
                                        <a href="#" class="facebook">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="twitter">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="linkedin">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="google">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="rss">
                                            <i class="fa fa-rss"></i>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                            <div class="content">
                                <ul>
                                    <li>
                                        <a href="${createLink(url: '/profile')}" class="${createLink(url: '/profile') ? 'active' : ''}">
                                            <i class="flaticon-social"></i>
                                            ${message(code: 'public.myProfile.label', default: 'Akun')}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <i class="flaticon-apartment"></i>
                                            ${message(code: 'account.myProperty.label', default: 'Property Saya')}
                                        </a>
                                    </li>
                                    <!--
                                    <li>
                                        <a href="">
                                            <i class="fa fa-heart"></i>Favorited Properties
                                        </a>
                                    </li>
                                    -->
                                    <li>
                                        <a href="${createLink(controller: 'property', action: 'beforeSubmit')}">
                                            <i class="fa fa-plus"></i>
                                            ${message(code: 'account.submit.newProperty.label', default: 'Submit Property Baru')}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <i class="flaticon-security disabled"></i>
                                            ${message(code: 'account.change.password.label', default: 'Ubah Password')}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${createLink(url: '/logout')}">
                                            <i class="flaticon-sign-out-option"></i>
                                            ${message(code: 'public.logout.label', default: 'Logout')}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- User account box end -->
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <!-- My address start-->
                        <div class="my-address">
                            <g:if test="${!user?.emailVerified}">
                                <div class="alert alert-danger wow fadeInLeft delay-03s"  role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>${message(code: 'account.email.notVerified.label', default: 'Email belum diverifikasi')}</strong><br>
                                        <span style="color: #a94442; text-decoration: underline">
                                            <a>${message(code: 'account.verificationSent.label', default: 'Link verifikasi telah dikirimkan ke {0}', args: [user?.email])}</a> atau
                                            <a href="javascript:void(0);" class="js-verify-email" data-action="${createLink(action: 'resendVerificationLink')}">
                                                ${message(code: 'account.resendVerification.label', default: 'Kirim ulang link verifikasi?')}
                                            </a>
                                        </span>
                                </div>
                            </g:if>
                            <div class="main-title-2">
                                <h1><span>PROFIL</span> SAYA</h1>
                            </div>

                            <g:form class="js-form-user-profile">
                                <div class="form-group">
                                    <label>${message(code: 'account.user.name.label', default: 'Nama')}</label>
                                    <input type="text" class="input-text" name="name" value="${user?.firstName}" ${!user?.emailVerified ? 'disabled' : ''}/>
                                </div>
                                <div class="form-group">
                                    <label>${message(code: 'account.user.role.label', default: 'Hak Akses')}</label>
                                    <input type="text" class="input-text" name="agent" value="${userRole?.role?.name}" ${!user?.emailVerified ? 'disabled' : ''}>
                                </div>
                                <div class="form-group">
                                    <label>${message(code: 'account.user.phone.label', default: 'No Hp')}</label>
                                    <input type="text" class="input-text" name="phone" value="${user?.contactMobile ?: user?.contactOffice}" ${!user?.emailVerified ? 'disabled' : ''}>
                                </div>
                                <div class="form-group">
                                    <label>${message(code: 'account.user.email.label', default: 'Alamat Email')}</label>
                                    <input type="email" class="input-text" name="email" value="${user?.email}"  ${!user?.emailVerified ? 'disabled' : ''}>
                                </div>
                                <div class="form-group ${userRole?.role?.name?.equals('User') || userRole?.role?.name?.equals('Admin') ? 'hidden' : ''}">
                                    <label>${message(code: 'account.user.biography.label', default: 'Biografi')}</label>
                                    <textarea class="input-text" style="text-align: justify" name="message" ${!user?.emailVerified ? 'disabled' : ''}>${user?.biography}</textarea>
                                </div>
                                <button type="submit" class="btn button-md button-theme" ${!user?.emailVerified ? 'disabled' : ''}>Save Changes</button>
                            </g:form>
                        </div>
                        <!-- My address end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- My profile end -->

        <g:render template="/templates/footer"/>
        <g:render template="modal_verification_email" model="${user}"/>

    </body>
</html>