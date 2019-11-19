<%@ page import="Enums.PropertyType; Enums.PropertyStatus" %>
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
                    <img src="${createLinkTo(dir: 'images', file: 'red-logo.png')}" alt="logo">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown  ${request.forwardURI?.equals('/') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'index')}"><g:message code="public.home.label"/></a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/all') ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/buy/' + params?.type) ? 'active' : ''}
                        ${request.forwardURI?.equals('/property-details/' + params?.long('id')) ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/search') ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/list/sale') ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/type/' + params?.type) ? 'active' : ''}">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            <g:message code="public.buy.label"/>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <g:each in="${PropertyType.values() - [PropertyType.OFFICE]}" var="type">
                                    <li>
                                        <a href="${createLink(controller: 'property', action: 'buy', params: [type: type?.value()?.toLowerCase()])}">
                                            <g:message code="property.type.${type}.label" default="${type}"/>
                                        </a>
                                    </li>
                                </g:each>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/property/rent/' + params?.type) ? 'active' : ''}
                        ${request.forwardURI?.equals('/property/list/rent') ? 'active' : ''}">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            <g:message code="public.rent.label"/>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <g:each in="${PropertyType.values() - [PropertyType.LAND]}" var="type">
                                    <li>
                                        <a href="${createLink(controller: 'property', action: 'rent', params: [type: type?.value()?.toLowerCase()])}">
                                            <g:message code="property.type.${type}.label" default="${type}"/>
                                        </a>
                                    </li>
                                </g:each>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/agent') ? 'active' : ''} ${request.forwardURI?.equals('/agent/' + params?.long('id')) ? 'active' : ''}">
                        <a href="${createLink(controller: 'user', action: 'agentList')}">
                            <g:message code="public.agent.label"/>
                        </a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/blog') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'blog')}">
                            <g:message code="public.blog.label"/>
                        </a>
                    </li>
                    <li class="dropdown ${request.forwardURI?.equals('/about') ? 'active' : ''}">
                        <a href="${createLink(controller: 'property', action: 'about')}">
                            <g:message code="public.about.label"/>
                        </a>
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