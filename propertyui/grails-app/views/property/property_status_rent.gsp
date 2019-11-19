<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-17
  Time: 19:36
--%>

<%@ page contentType="text/html;charset=UTF-8" import="Enums.PropertyFeature" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>${params?.status ? ' status' : ' Tipe'} - <g:message code="property.listing.${params?.status ?: params?.type}.label" default="${params?.status ?: params?.type }"/></title>
    </head>

    <body>
        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

        <!-- Sub banner start -->
        <div class="sub-banner overview-bgi">
            <div class="overlay">
                <div class="container">
                    <div class="breadcrumb-area">
                        <h1>Properties Listing</h1>
                        <ul class="breadcrumbs">
                            <li><a href="${createLink(controller: 'property', action: 'index')}">
                                <g:message code="public.home.label"/>
                            </a>
                            </li>
                            <li class="active">Property  ${params?.type ? ' Type' : ''}
                            <g:message code="property.listing.${params?.type}.label" default="${params?.type}"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Banner end -->

        <g:if test="${propertyList?.size() > 0}">
            <!-- Properties section body start -->
            <div class="properties-section property-big content-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="option-bar">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-2">
                                        <h4>
                                            <span class="heading-icon">
                                                <i class="fa fa-th-list"></i>
                                            </span>
                                            <span class="hidden-xs">${propertyList?.size()} Properties List ${params?.type}</span>
                                        </h4>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-10 col-pad">
                                        <div class="sorting-options">
                                            <select class="sorting js-filter-property-by-type">
                                                <option ${params?.sort?.equals('desc') ? 'selected' : ''}
                                                        data-url="${createLink(controller: 'property', action: 'rent', params: [type: params?.type, sort :'desc'])}">
                                                    <g:message code="public.date.filter.desc.label"/>
                                                </option>
                                                <option ${params?.sort?.equals('asc') ? 'selected' : ''}
                                                        data-url="${createLink(controller: 'property', action: 'rent', params: [type: params?.type, sort : 'asc'])}">
                                                    <g:message code="public.date.filter.asc.label"/>
                                                </option>
                                                <option ${params?.price?.equals('desc') ? 'selected' : ''}
                                                        data-url="${createLink(controller: 'property', action: 'rent', params: [type: params?.type, price : 'desc'])}">
                                                    <g:message code="public.price.filter.asc.label"/>
                                                </option>
                                                <option ${params?.price?.equals('asc') ? 'selected' : ''}
                                                        data-url="${createLink(controller: 'property', action: 'rent', params: [type: params?.type, price : 'asc'])}">
                                                    <g:message code="public.price.filter.desc.label"/>
                                                </option>
                                            </select>
                                            <a href="" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                            <a href="" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <!-- property start -->
                            <g:each in="${propertyList}" var="property" status="i">
                                <g:set var="details" value="${property?.propertyDetails}"/>
                                <div class="property property-hp clearfix wow fadeInUp delay-03s">
                                    <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 col-pad">
                                        <div class="property-img">
                                            <a class="property-tag button alt featured">
                                                <g:message code="property.type.${property?.propertyType}.label" default="${property?.propertyType}"/>
                                            </a>
                                            <a class="property-tag button sale">
                                                <g:message code="property.status.${property?.propertyStatus}.label" default="${property?.propertyStatus}"/>
                                            </a>
                                            <div class="property-price">
                                                <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                            </div>
                                            <img src="${property?.gallery ?: 'http://placehold.it/312x220'}" alt="fp-list" class="img-responsive">
                                            <div class="property-overlay">
                                                <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}" class="overlay-link">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                                <a class="overlay-link property-video" data-property-id="${property?.id}" title="Lexus GS F">
                                                    <i class="fa fa-video-camera"></i>
                                                </a>
                                                <div class="property-magnify-gallery">
                                                    <a href="http://placehold.it/750x540" class="overlay-link">
                                                        <i class="fa fa-expand"></i>
                                                    </a>
                                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12 property-content ">
                                        <h1 class="title">
                                            <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}">${property?.title}</a>
                                        </h1>
                                        <h3 class="property-address">
                                            <a>
                                                <i class="fa fa-map-marker"></i>${property?.getFullAddress()}
                                            </a>
                                        </h3>
                                        <p>${property?.description?.take(200)}</p>
                                        <ul class="facilities-list clearfix">
                                            <g:if test="${details}">
                                                <g:each var="detail" in="${details}" status="a">
                                                    <g:set var="feature" value="${detail?.getFeature()}"/>
                                                    <g:set var="unit" value="${detail?.getUnit()}"/>
                                                    <g:if test="${a < 6}">
                                                        <li>
                                                            <i class="flaticon-${PropertyFeature.getByValue(feature)?.code()}"></i>
                                                            <span>${unit} <g:message code="property.feature.${feature}.label" default="${feature}"/></span>
                                                        </li>
                                                    </g:if>
                                                </g:each>
                                            </g:if>
                                        </ul>
                                        <div class="property-footer">
                                            <span class="left">
                                                <a href="${createLink(controller: 'user', action: 'agentDetails', params: [id: property?.user?.id])}">
                                                    <i class="fa fa-user"></i>${property?.user?.getLongName()}
                                                </a>
                                            </span>
                                            <span class="right">
                                                <i class="fa fa-calendar"></i>${property?.getDatePosted()}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                            <!-- property end -->

                            <g:if test="${countPropertyByStatus >= 8}">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <g:form method="post" controller="property" action="rent" params="${params - [inputPage: params.inputPage]}">
                                            <g:paginate maxsteps="0" controller="property" action="rent" params="${params - [inputPage: params.inputPage]}" total="${countPropertyByStatus}" prev="‹" next="›" first="First" last="Last" />
                                        </g:form>
                                    </ul>
                                </nav>
                            </g:if>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Properties section body end -->
            <g:render template="modal_property_preview" model="${propertyList}"/>
        </g:if>

        <g:render template="/templates/footer"/>

    </body>
</html>