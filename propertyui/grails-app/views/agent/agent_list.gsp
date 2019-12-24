<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-09
  Time: 19:56
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Agent List</title>
    </head>

    <body>
        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

        <!-- Sub banner start -->
        <div class="sub-banner overview-bgi">
            <div class="overlay">
                <div class="container">
                    <div class="breadcrumb-area">
                        <h1>Agent List</h1>
                        <ul class="breadcrumbs">
                            <li><a href="${createLink(controller: 'property', action: 'index')}">Home</a></li>
                            <li class="active">Agent List</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Banner end -->

        <!-- Agent section start -->
        <g:if test="${agentList}">
            <div class="agent-section content-area">
                <div class="container">
                    <div class="option-bar">
                        <div class="row">
                            <div class="col-lg-6 col-md-5 col-sm-5 col-xs-2">
                                <h4>
                                    <span class="heading-icon">
                                        <i class="fa fa-th-list"></i>
                                    </span>
                                    <span class="hidden-xs">Agent List</span>
                                </h4>
                            </div>
                            <div class="col-lg-6 col-md-7 col-sm-7 col-xs-10 cod-pad">
                                <div class="sorting-options">
                                    <select class="sorting">
                                        <option>New To Old</option>
                                        <option>Old To New</option>
                                        <option>Properties (High To Low)</option>
                                        <option>Properties (Low To High)</option>
                                    </select>
                                    <a href="agent-listing-row.html" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                    <a href="agent-listing-grid.html" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- option bar end -->

                    <div class="clearfix"></div>

                    <div class="row">
                        <g:each in="${agentList}" var="agent" status="i">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="agent-2 clearfix">
                                    <div class="col-lg-5 col-md-5 col-sm-4 agent-theme-2">
                                        <img src="http://placehold.it/231x231" alt="team-2" class="img-responsive">
                                        <ul class="social-list clearfix">
                                            <li>
                                                <a href="${agent?.socialFacebook}" class="facebook ${!agent?.socialFacebook ? 'hidden' : ''}">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${agent?.socialTwitter}" class="twitter ${!agent?.socialTwitter ? 'hidden' : ''}">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${agent?.socialLinkedin}" class="linkedin ${!agent?.socialLinkedin ? 'hidden' : ''} ">
                                                    <i class="fa fa-linkedin"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${agent?.socialInstagram}" class="google ${!agent?.socialInstagram ? 'hidden' : ''}">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-8 agent-content">
                                        <h5>Web Developer</h5>
                                        <h3>
                                            <a href="${createLink(controller: 'user', action: 'agentDetails', params: [id: agent?.user?.id])}">${agent?.user?.getFullName()}</a>
                                        </h3>
                                        <ul>
                                            <li>
                                                <strong>Address:</strong><a href="#">${agent?.user?.getUserFullAddress()}</a>
                                            </li>
                                            <li>
                                                <strong>Email:</strong><a href="mailto:info@themevessel.com">${agent?.user?.email}</a>
                                            </li>
                                            <li>
                                                <strong>Mobile:</strong><a href="tel:+554XX-634-7071"> ${agent?.user?.contactMobile}</a>
                                            </li>
                                            <li>
                                                <strong>Fax:</strong><a href="#">${agent?.user?.contactOffice}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Agent section end -->

        <div class="clearfix"></div>

        <div class="content-area-10"></div>

        <g:render template="/templates/brands_partner"/>

        <g:render template="/templates/simple_footer"/>
        <g:render template="/templates/footer"/>

    </body>
</html>