<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-08
  Time: 23:44
--%>

<%@ page contentType="text/html;charset=UTF-8" import="Enums.PropertyFeature; Enums.PropertyStatus; Enums.PropertyType" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Search by: ${params?.keywords}</title>
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
                            <li class="active">Search Results</li>
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
                        <!-- Option bar start -->
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
                                        <select class="sorting">
                                            <option>New To Old</option>
                                            <option>Old To New</option>
                                            <option>Properties (High To Low)</option>
                                            <option>Properties (Low To High)</option>
                                        </select>
                                        <a href="properties-list-leftside.html" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                        <a href="properties-grid-leftside.html" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Option bar end -->

                        <div class="clearfix"></div>
                        <!-- Property start -->
                        <g:if test="${propertyList}">
                            <h5>
                                <strong>${countpropertyByParams}</strong> result found for
                                <strong>"${params?.keywords}"</strong></h5>
                            <br>
                            <g:each in="${propertyList}" var="property" status="i">
                                <g:set var="details" value="${property?.propertyDetails}"/>
                                <div class="property clearfix wow fadeInUp delay-03s">
                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 col-pad">
                                        <!-- Property img -->
                                        <div class="property-img">
                                            <div class="property-tag button alt featured">${property?.propertyType}</div>
                                            <div class="property-tag button sale">${property?.propertyStatus}</div>
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
                                        <!-- title -->
                                        <h1 class="title">
                                            <a href="properties-details.html">${property?.title}</a>
                                        </h1>
                                        <!-- Property address -->
                                        <h3 class="property-address">
                                            <a href="properties-details.html">
                                                <i class="fa fa-map-marker"></i>${property?.getFullAddress()}
                                            </a>
                                        </h3>
                                        <!-- Facilities List -->
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                                <span>4800 sq ft</span>
                                            </li>
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
                                        <!-- Property footer -->
                                        <div class="property-footer">
                                            <span class="left">
                                                <a href="#"><i class="fa fa-user"></i>${property?.user?.getFullName()}</a>
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

                            <!-- Page navigation start -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li>
                                        <a href="properties-list-rightside.html" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </li>
                                    <li><a href="properties-list-rightside.html">1 <span class="sr-only">(current)</span></a></li>
                                    <li class="active"><a href="properties-list-leftside.html">2</a></li>
                                    <li><a href="properties-list-fullwidth.html">3</a></li>
                                    <li>
                                        <a href="properties-list-fullwidth.html" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- Page navigation end-->
                        </g:if>
                        <g:else>
                            <h5>No result found for "${params?.keywords}"</h5>
                        </g:else>
                    </div>
                    <div class="col-lg-4 col-md-4 col-xs-12 col-md-pull-8">
                        <!-- Search contents sidebar start -->
                        <div class="sidebar-widget">
                            <div class="main-title-2">
                                <h1><span>Advanced</span> Search</h1>
                            </div>

                            <g:form method="GET" controller="property" action="search">
                                <div class="form-group">
                                    <input type="text" name="keywords" class="form-control search-fields" value="${params?.keywords}" placeholder="<g:message code="public.search.placeholder.label"/>">
                                </div>
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="property-status">
                                        <g:each in="${PropertyStatus}" var="pStatus">
                                            <option name="propertyStatus" value="${pStatus}">
                                                <g:message code="property.status.${pStatus}.label"/>
                                            </option>
                                        </g:each>
                                    </select>
                                </div>
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
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="property-types">
                                        <g:each in="${PropertyType}" var="pType">
                                            <option name="propertyType" value="${pType}">
                                                <g:message code="property.type.${pType}.label"/>
                                            </option>
                                        </g:each>
                                    </select>
                                </div>
                                <div class="range-slider">
                                    <label>Price</label>
                                    <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>
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

                                <div class="form-group mb-0">
                                    <button type="submit" class="search-button">Apply</button>
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
                                    <li><a href="${createLink(controller: 'property', action: 'getPropertyByType', params: [type: type?.name()?.toLowerCase()])}">
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
                </div>
            </div>
        </div>
        <!-- Properties section body end -->
        <g:render template="/templates/footer"/>
    </body>
</html>