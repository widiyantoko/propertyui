<!-- Top header start -->
<header class="top-header hidden-xs" id="top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="list-inline">
                    <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>1-8X0-666-8X88</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>info@themevessel.com</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <ul class="top-social-media pull-right">
                    <sec:access expression="!isAuthenticated()">
                        <li>
                            <a href="${createLink(url: '/login/auth')}" class="sign-in"><i class="fa fa-sign-in"></i> Login</a>
                        </li>
                        <li>
                            <a href="${createLink(controller: 'registration', action: 'index')}" class="sign-in"><i class="fa fa-user"></i> Register</a>
                        </li>
                    </sec:access>
                    <sec:access expression="isAuthenticated()">
                        <li>
                            <a href="${createLink(url: '/logout')}" class="-sign-out"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </sec:access>
                    <sec:access expression="isAuthenticated()">
                        <li>
                            <a href="${createLink(url: '/')}" class="profile-user"><i class="fa fa-user"></i>My Profile</a>
                        </li>
                    </sec:access>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Top header end -->