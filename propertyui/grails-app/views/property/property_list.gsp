<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-10-29
  Time: 21:18
--%>

<%@ page contentType="text/html;charset=UTF-8" import="Enums.PropertyFeature; Enums.PropertyStatus; Enums.PropertyType" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title></title>
    </head>

    <body>
        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

        <!-- Sub banner start -->
        <div class="sub-banner overview-bgi">
            <div class="overlay">
                <div class="container">
                    <div class="breadcrumb-area">
                        <h1>Property Listing</h1>
                        <ul class="breadcrumbs">
                            <li><a href="${createLink(controller: 'property', action: 'index')}">Home</a></li>
                            <li class="active">Property Listing</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Banner end -->

        <!-- Properties section body start -->
        <div class="properties-section-body content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-xs-12 col-md-push-4">
                        <div class="option-bar">
                            <div class="row">
                                <div class="col-lg-6 col-md-5 col-sm-5 col-xs-2">
                                    <h4>
                                        <span class="heading-icon">
                                            <i class="fa fa-th-list"></i>
                                        </span>
                                        <span class="hidden-xs">Properties List</span>
                                    </h4>
                                </div>
                                <div class="col-lg-6 col-md-7 col-sm-7 col-xs-10 cod-pad">
                                    <div class="sorting-options">
                                        <select class="sorting js-filter-property-list">
                                            <option ${params?.sort?.equals('desc') ? 'selected' : ''}
                                                    data-url="${createLink(controller: 'property', action: 'propertyList', params: [sort :'desc', status: params?.status, type: params?.type])}">
                                                <g:message code="public.date.filter.desc.label"/>
                                            </option>
                                            <option ${params?.sort?.equals('asc') ? 'selected' : ''}
                                                    data-url="${createLink(controller: 'property', action: 'propertyList', params: [sort : 'asc', status: params?.status, type: params?.type])}">
                                                <g:message code="public.date.filter.asc.label"/>
                                            </option>
                                            <option ${params?.price?.equals('desc') ? 'selected' : ''}
                                                    data-url="${createLink(controller: 'property', action: 'propertyList', params: [price : 'desc', status: params?.status, type: params?.type])}">
                                                <g:message code="public.price.filter.asc.label"/>
                                            </option>
                                            <option ${params?.price?.equals('asc') ? 'selected' : ''}
                                                    data-url="${createLink(controller: 'property', action: 'propertyList', params: [price : 'asc', status: params?.status, type: params?.type])}">
                                                <g:message code="public.price.filter.desc.label"/>
                                            </option>
                                        </select>
                                        <a href="" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                        <a href="" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Option bar end -->

                        <div class="clearfix"></div>
                        <!-- Property start -->
                        <g:each in="${propertyList}" var="property" status="i">
                            <g:set var="details" value="${property?.propertyDetails}"/>
                            <div class="property clearfix wow fadeInUp delay-03s">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 col-pad">
                                    <div class="property-img">
                                        <g:if test="${property?.propertyStatus == PropertyStatus.SALE.name()}">
                                            <a href="${createLink(controller: 'property', action: 'buy', params: [type: property?.propertyType?.toLowerCase()])}" class="property-tag button alt featured">
                                                <g:message code="property.type.${property?.propertyType}.label" default="${property?.propertyType}"/>
                                            </a>
                                        </g:if>
                                        <g:elseif test="${property?.propertyStatus == PropertyStatus.RENT.name()}">
                                            <a href="${createLink(controller: 'property', action: 'rent', params: [type: property?.propertyType?.toLowerCase()])}" class="property-tag button alt featured">
                                                <g:message code="property.type.${property?.propertyType}.label" default="${property?.propertyType}"/>
                                            </a>
                                        </g:elseif>
                                        <a href="${createLink(controller: 'property', action: 'list', params: [type: property?.propertyStatus?.toLowerCase()])}" class="property-tag button sale">
                                            <g:message code="property.status.${property?.propertyStatus}.label" default="${property?.propertyStatus}"/>
                                        </a>
                                        <div class="property-price">
                                            <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                        </div>
                                        <img src="${property?.gallery ?: 'http://placehold.it/312x220'}" alt="fp-list" class="img-responsive hp-1">
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
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 property-content ">
                                    <h1 class="title">
                                        <a href="${createLink(controller: 'property', action: 'propertyDetails', params: [id: property?.id])}">
                                            ${property?.title}
                                        </a>
                                    </h1>
                                    <h3 class="property-address">
                                        <a href="">
                                            <i class="fa fa-map-marker"></i>${property?.getFullAddress()}
                                        </a>
                                    </h3>
                                    <ul class="facilities-list clearfix">
                                        <g:if test="${details}">
                                            <g:each var="detail" in="${details}">
                                                <g:set var="feature" value="${detail?.getFeature()}"/>
                                                <g:set var="unit" value="${detail?.getUnit()}"/>
                                                <li>
                                                    <i class="flaticon-${PropertyFeature.getByValue(feature)?.code()}"></i>
                                                    <span>${unit} <g:message code="property.feature.${feature}.label" default="${feature}"/></span>
                                                </li>
                                            </g:each>
                                        </g:if>
                                    </ul>
                                    <div class="property-footer">
                                        <span class="left">
                                            <a href="${createLink(controller: 'user', action: 'agentDetails', params: [id: property?.user?.id])}">
                                                <i class="fa fa-user"></i>${property?.user?.getFullName()}
                                            </a>
                                        </span>
                                        <span class="right">
                                            <i class="fa fa-calendar"></i>
                                            ${property?.getDatePosted()}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                        <!-- Property end -->

                        <g:if test="${totalProperty >= 8}">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <g:form method="post" controller="property" action="propertyList" params="${params - [inputPage: params.inputPage]}">
                                        <g:paginate maxsteps="0" controller="property" action="propertyList" params="${params - [inputPage: params.inputPage]}" total="${totalProperty}" prev="‹" next="›" first="First" last="Last" />
                                    </g:form>
                                </ul>
                            </nav>
                        </g:if>
                    </div>

                    <!-- Search contents sidebar start -->
                    <div class="col-lg-4 col-md-4 col-xs-12 col-md-pull-8">
                        <div class="sidebar-widget">
                            <div class="main-title-2">
                                <h1><span>Advanced</span> Search</h1>
                            </div>

                            <g:form method="GET" controller="property" action="propertyList">
                                <input type="hidden" name="sort" value="${params?.sort}">
                                <input type="hidden" name="price" value="${params?.price}">
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="status">
                                        <option disabled value="" style="display: none" ${!params?.status ? 'selected' : ''}>
                                            <g:message code="property.status.label"/>
                                        </option>
                                        <g:each in="${PropertyStatus?.values()}" var="pStatus">
                                            <option name="status" value="${pStatus?.name()?.toLowerCase()}" ${params?.status == pStatus?.name()?.toLowerCase() ? 'selected' : ''}>
                                                <g:message code="property.status.${pStatus}.label"/>
                                            </option>
                                        </g:each>
                                    </select>
                                </div>
                                <!--
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="location" data-live-search="true" data-live-search-placeholder="Search value">
                                        <option>Location</option>
                                        <option>United States</option>
                                        <option>United Kingdom</option>
                                        <option>American Samoa</option>
                                        <option>Belgium</option>
                                        <option>Cameroon</option>
                                        <option>Canada</option>
                                    </select>
                                </div>
                                -->
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="type">
                                        <option disabled value="" style="display: none" ${!params?.type ? 'selected' : ''}>
                                            <g:message code="property.type.label"/>
                                        </option>
                                        <g:each in="${PropertyType?.values()}" var="pType">
                                            <option name="type" value="${pType?.name()?.toLowerCase()}" ${params?.type == pType?.name()?.toLowerCase() ? 'selected' : ''}>
                                                <g:message code="property.type.${pType}.label"/>
                                            </option>
                                        </g:each>
                                    </select>
                                </div>
                                <!--
                                <div class="range-slider">
                                    <label>Price</label>
                                    <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>
                                -->
                                <!--
                                <a class="show-more-options" data-toggle="collapse" data-target="#options-content">
                                    <i class="fa fa-plus-circle"></i> Show More Options
                                </a>
                                <div id="options-content" class="collapse">
                                    <label class="margin-t-10">Features</label>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox1" type="checkbox">
                                        <label for="checkbox1">
                                            Free Parking
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox2" type="checkbox">
                                        <label for="checkbox2">
                                            Air Condition
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox3" type="checkbox">
                                        <label for="checkbox3">
                                            Places to seat
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox4" type="checkbox">
                                        <label for="checkbox4">
                                            Swimming Pool
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox5" type="checkbox">
                                        <label for="checkbox5">
                                            Laundry Room
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox6" type="checkbox">
                                        <label for="checkbox6">
                                            Window Covering
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox7" type="checkbox">
                                        <label for="checkbox7">
                                            Central Heating
                                        </label>
                                    </div>
                                    <div class="checkbox checkbox-theme checkbox-circle">
                                        <input id="checkbox8" type="checkbox">
                                        <label for="checkbox8">
                                            Alarm
                                        </label>
                                    </div>
                                </div>
                                -->
                                <div class="form-group mb-0">
                                    <button class="search-button">Apply</button>
                                </div>
                            </g:form>
                        </div>

                        <!-- Category posts start -->
                        <div class="sidebar-widget category-posts">
                            <div class="main-title-2">
                                <h1><span>popular</span> Category</h1>
                            </div>
                            <ul class="list-unstyled list-cat">
                                <g:each in="${typeList}" var="type">
                                    <li><a href="${createLink(controller: 'property', action: 'type', params: [type: type?.name()?.toLowerCase()])}">
                                            <g:message code="property.type.${type?.name()}.label" default="${type?.name()}"/>
                                        </a>
                                        <span>(${countType.get(type.name())})</span>
                                    </li>
                                </g:each>
                            </ul>
                        </div>

                        <!-- Popular posts start -->
                        <div class="sidebar-widget popular-posts">
                            <div class="main-title-2">
                                <h1><span>Recent</span> Properties</h1>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-1">
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">
                                        <a href="properties-details.html">Modern Family Home</a>
                                    </h3>
                                    <p>February 27, 2018</p>
                                    <div class="price">
                                        $734,000
                                    </div>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-2">
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">
                                        <a href="properties-details.html">Modern Family Home</a>
                                    </h3>
                                    <p>February 27, 2018</p>
                                    <div class="price">
                                        $734,000
                                    </div>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-3">
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">
                                        <a href="properties-details.html">Beautiful Single Home</a>
                                    </h3>
                                    <p>February 27, 2018</p>
                                    <div class="price">
                                        $734,000
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Helping box Start -->
                        <div class="sidebar-widget helping-box clearfix">
                            <div class="main-title-2">
                                <h1><span>Helping</span> Center</h1>
                            </div>
                            <div class="helping-center">
                                <div class="icon"><i class="fa fa-map-marker"></i></div>
                                <h4>Address</h4>
                                <p>123 Kathal St. Tampa City,</p>
                            </div>
                            <div class="helping-center">
                                <div class="icon"><i class="fa fa-phone"></i></div>
                                <h4>Phone</h4>
                                <p><a href="tel:+55-417-634-7071">+55 417 634 7071</a> </p>
                            </div>
                        </div>

                        <!-- Latest reviews start -->
                        <div class="sidebar-widget latest-reviews mb-0">
                            <div class="main-title-2">
                                <h1><span>Latest</span> Reviews</h1>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="avatar-1">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading"><a href="#">John Antony</a></h3>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet,
                                    consectetur adipiscing elit.
                                    Etiamrisus tortor, accumsan at nisi et,
                                    </p>
                                </div>
                            </div>
                            <div class="media mb-0">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="avatar-2">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading"><a href="#">Karen Paran</a></h3>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet,
                                    consectetur adipiscing elit.
                                    Etiamrisus tortor, accumsan at nisi et,
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Search contents sidebar start -->

                </div>
            </div>
        </div>
        <!-- Properties section body end -->
        <g:render template="/templates/footer"/>
    </body>
</html>