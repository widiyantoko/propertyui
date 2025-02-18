<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-02
  Time: 20:11
--%>

<%@ page contentType="text/html;charset=UTF-8" import="Enums.PropertyFeature" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Property ${params?.status ? ' status' : ' type'} - <g:message code="property.listing.${params?.status ?: params?.type}.label" default="${params?.status ?: params?.type }"/></title>
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
                            <li><a href="${createLink(controller: 'property', action: 'index')}">Home</a></li>
                            <li class="active">Property  ${params?.status ? ' Status' : ' Type'}
                                <g:message code="property.listing.${params?.status ?: params?.type}.label" default="${params?.status ?: params?.type}"/>
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
                                            <span class="hidden-xs">Properties List</span>
                                        </h4>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-10 col-pad">
                                        <div class="sorting-options">
                                            <select class="sorting">
                                                <option>New To Old</option>
                                                <option>Old To New</option>
                                                <option>Properties (High To Low)</option>
                                                <option>Properties (Low To High)</option>
                                            </select>
                                            <a href="properties-list-fullwidth.html" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                            <a href="properties-grid-fullwidth.html" class="change-view-btn"><i class="fa fa-th-large"></i></a>
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
                                            <a href="${createLink(controller: 'property', action: 'getProperty', params: [type: property?.propertyType])}" class="property-tag button alt featured">
                                                ${property?.propertyType}
                                            </a>
                                            <a href="${createLink(controller: 'property', action: 'getProperty', params: [status: property?.propertyStatus])}" class="property-tag button sale">
                                                ${property?.propertyStatus}
                                            </a>
                                            <div class="property-price">
                                                <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                            </div>
                                            <img src="${property?.gallery ?: 'http://placehold.it/312x220'}" alt="fp-list" class="img-responsive">
                                            <div class="property-overlay">
                                                <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}" class="overlay-link">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                                <a class="overlay-link property-video" title="Lexus GS F">
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

                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li>
                                        <a href="properties-list-rightside.html" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </li>
                                    <li><a href="properties-list-rightside.html">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="properties-list-leftside.html">2</a></li>
                                    <li class="active"><a href="properties-list-fullwidth.html">3 </a></li>
                                    <li>
                                        <a href="properties-list-fullwidth.html" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Properties section body end -->
        </g:if>
        <g:render template="/templates/footer"/>
    </body>
</html>