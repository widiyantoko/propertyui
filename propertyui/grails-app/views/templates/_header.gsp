<%@ page import="Enums.PropertyStatus" %>
<!-- Main header start -->
<header class="main-header">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navigation" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="${createLink(controller: 'property', action: 'index')}" class="logo">
                    <img src="${createLinkTo(dir: 'images', file: 'logo.png')}" alt="logo">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown  ${request.forwardURI?.equals('/') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'index')}">Home</a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/property-list') ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/getProperty') ? 'active' : ''}
                        ${request.forwardURI?.equals('/property-details/' + params?.long('id')) ? 'active' : ''}
                         ${request.forwardURI?.equals('/property/search') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'propertyList')}">Property</a>
                        <ul class="dropdown-menu">
                            <g:each in="${PropertyStatus}" var="status">
                                <li>
                                    <a href="${createLink(controller: 'property', action: 'getProperty', params: [status: status])}">
                                        <g:message code="property.status.${status}.label"/>
                                    </a>
                                </li>
                            </g:each>
                        </ul>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/agent') ? 'active' : ''} ${request.forwardURI?.equals('/agent/' + params?.long('id')) ? 'active' : ''}">
                        <a href="${createLink(controller: 'user', action: 'agentList')}">Agents</a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/blog') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'blog')}">Blog</a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/about') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'about')}">About</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right rightside-navbar">
                    <li>
                        <a href="" class="button">Submit Property</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- Main header end -->