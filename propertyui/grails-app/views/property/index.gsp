<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-10-19
  Time: 12:53
--%>

<%@ page contentType="text/html;charset=UTF-8" import="Enums.PropertyStatus; Enums.PropertyType; Enums.PropertyFeature" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <title></title>
    </head>

    <body>

        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

    <!-- Banner start -->
        <div class="banner">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item item-100vh active">
                        <img src="http://www.statedevelopment.com.au/wp-content/uploads/2018/10/8-Gardener-Close-Milton-2200-x-1200.jpg" alt="banner-slider-1" class="img-responsive">
                        <div class="carousel-caption banner-slider-inner banner-tb text-left">
                            <div class="banner-content banner-content-left">
                                <div class="text-center hidden-md hidden-lg">
                                    <h1 data-animation="animated fadeInDown delay-05s"><span>Find your </span> Dream House</h1>
                                    <p data-animation="animated fadeInUp delay-1s">Lorem ipsum dolor sit amet, conconsectetuer adipiscing elit Lorem ipsum dolor sit amet, conconsectetuer</p>
                                    <a href="#" class="btn button-md button-theme" data-animation="animated fadeInUp delay-15s">Get Started Now</a>
                                    <a href="#" class="btn button-md border-button-theme" data-animation="animated fadeInUp delay-15s">Learn More</a>
                                </div>

                                <div class="banner-search-box hidden-xs hidden-sm">
                                    <!-- Search area start -->
                                    <div class="search-area animated fadeInDown delay-1s">
                                        <div class="search-area-inner">
                                            <div class="search-contents ">
                                                <form method="GET">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group">
                                                            <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value">
                                                                <option>Area From</option>
                                                                <option>1000</option>
                                                                <option>800</option>
                                                                <option>600</option>
                                                                <option>400</option>
                                                                <option>200</option>
                                                                <option>100</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group">
                                                            <select class="selectpicker search-fields" name="property-status" data-live-search="false" data-live-search-placeholder="Search value">
                                                                <option><g:message code="property.status.label" default="Property status"/></option>
                                                                <g:each in="${PropertyStatus}" var="pStatus">
                                                                    <option name="propertyStatus" value="${pStatus}">
                                                                        <g:message code="property.status.${pStatus}.label"/>
                                                                    </option>
                                                                </g:each>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
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
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group">
                                                            <select class="selectpicker search-fields" name="property-types" data-live-search="false" data-live-search-placeholder="Search value">
                                                                <option>Property Types</option>
                                                                <g:each in="${PropertyType}" var="pType">
                                                                    <option name="propertyType" value="${pType}">
                                                                        <g:message code="property.type.${pType}.label"/>
                                                                    </option>
                                                                </g:each>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group">
                                                            <select class="selectpicker search-fields" name="bedrooms" data-live-search="true" data-live-search-placeholder="Search value" >
                                                                <option>Bedrooms</option>
                                                                <option>1</option>
                                                                <option>2</option>
                                                                <option>3</option>
                                                                <option>4</option>
                                                                <option>5</option>
                                                                <option>6</option>
                                                                <option>7</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group">
                                                            <select class="selectpicker search-fields" name="bathrooms" data-live-search="true" data-live-search-placeholder="Search value" >
                                                                <option>Bathrooms</option>
                                                                <option>1</option>
                                                                <option>2</option>
                                                                <option>3</option>
                                                                <option>4</option>
                                                                <option>5</option>
                                                                <option>6</option>
                                                                <option>7</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group mb-0">
                                                            <div class="range-slider">
                                                                <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group mb-0">
                                                            <button class="search-button">Search</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Search area start -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item item-100vh">
                        <img src="http://www.statedevelopment.com.au/wp-content/uploads/2018/10/24-white-st-nerage-2200-x-1200.jpg" alt="banner-slider-1" class="img-responsive">
                        <div class="container">
                            <div class="carousel-caption banner-slider-inner">
                                <div class="banner-content banner-content-left">
                                    <div class="banner-detail-box text-left">
                                        <h3 data-animation="animated fadeInDown delay-1s"><span>Find your </span> Dream House</h3>
                                        <p data-animation="animated fadeInUp delay-05s">Lorem ipsum dolor sit amet, conconsectetuer adipiscing elit Lorem ipsum dolor sit amet, conconsectetuer</p>
                                        <a href="#" class="btn button-sm button-theme" data-animation="animated fadeInUp delay-15s">View Details</a>
                                        <a href="#" class="btn button-sm border-button-theme" data-animation="animated fadeInUp delay-15s">Contact Agent</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!--
                    <div class="item item-100vh">
                        <img src="http://placehold.it/2200x1200" alt="banner-slider-1" class="img-responsive">
                        <div class="container">
                            <div class="carousel-caption banner-slider-inner">
                                <div class="banner-content banner-content-left">
                                    <div class="banner-detail-box text-left">
                                        <h3 data-animation="animated fadeInLeft delay-05s"><span>Find your </span> Dream House</h3>
                                        <p data-animation="animated fadeInLeft delay-1s">Lorem ipsum dolor sit amet, conconsectetuer adipiscing elit Lorem ipsum dolor sit amet, conconsectetuer</p>
                                        <a href="#" class="btn button-sm button-theme" data-animation="animated fadeInLeft delay-15s">View Details</a>
                                        <a href="#" class="btn button-sm border-button-theme" data-animation="animated fadeInLeft delay-20s">Contact Agent</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            -->
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="slider-mover-left" aria-hidden="true">
                        <i class="fa fa-angle-left"></i>
                    </span>
                    <span class="sr-only">Previous</span>
                </a>

                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="slider-mover-right" aria-hidden="true">
                        <i class="fa fa-angle-right"></i>
                    </span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- Banner end -->

        <!-- Featured properties start -->
        <div class="content-area featured-properties">
            <div class="container">
                <!-- Main title -->
                <div class="main-title">
                    <h1>Featured Properties</h1>
                </div>
                <g:if test="${propertyList}">
                    <ul class="list-inline-listing filters filters-listing-navigation">
                        <li class="active btn filtr-button filtr" data-filter="all">All</li>
                        <g:each in="${typeList}" var="type">
                            <li data-filter="${type?.code()}" class="active btn btn-inline filtr-button filtr ${countType.get(type.name()) == 0 ? 'hide' : ''}">
                                ${type?.name()}
                            </li>
                        </g:each>
                    </ul>
                </g:if>
                <div class="row">
                    <div class="filtr-container">
                        <g:each in="${propertyList}" var="property" status="i">
                            <g:set var="details" value="${property?.propertyDetails}"/>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  filtr-item" data-category="${PropertyType?.getByValue(property?.propertyType)?.code()}">
                                <div class="property">
                                    <!-- Property img -->
                                    <div class="property-img">
                                        <a href="${createLink(controller: 'property', action: 'getPropertyByType', params: [type: property?.propertyType?.toLowerCase()])}" class="property-tag button alt featured">${property?.propertyType}</a>
                                        <div class="property-tag button sale">${property?.propertyStatus}</div>
                                        <div class="property-price">
                                            <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                        </div>
                                        <img src="http://placehold.it/360x240" alt="fp" class="img-responsive">
                                        <div class="property-overlay">
                                            <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}" class="overlay-link">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <a class="overlay-link property-video" data-property-id="${property?.id}" data-score="${property?.stars}" title="Lexus GS F">
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
                                    <!-- Property content -->
                                    <div class="property-content">
                                        <!-- title -->
                                        <h1 class="title">
                                            <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}">${property?.title}</a>
                                        </h1>
                                        <!-- Property address -->
                                        <h3 class="property-address">
                                            <a href="">
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
                                        <!-- Property footer -->
                                        <div class="property-footer">
                                            <span class="left">
                                                <a href="#"><i class="fa fa-user"></i>${property?.user?.getLongName()}</a>
                                            </span>
                                            <span class="right">
                                                <i class="fa fa-calendar"></i>
                                                ${property?.getDatePosted()}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                    <g:if test="${propertyList?.size() > 0}">
                        <div class="col-lg-12 text-center mt-20">
                            <a href="${createLink(controller: "property", action: "propertyList")}" class="btn button-md button-theme text-center">Load More</a>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
        <!-- Featured properties end -->

        <!-- Services start -->
        <div class="services mb-100 clearfix">
            <div class="container">
                <!-- Main title -->
                <div class="main-title">
                    <h1>What Are you Looking For?</h1>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInLeft delay-04s">
                        <div class="services-info">
                            <i class="flaticon-apartment"></i>
                            <h5>Apartments</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInLeft delay-04s">
                        <div class="services-info">
                            <i class="flaticon-internet"></i>
                            <h5>Houses</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInRight delay-04s">
                        <div class="services-info">
                            <i class="flaticon-vehicle"></i>
                            <h5>Garages</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInRight delay-04s">
                        <div class="services-info">
                            <i class="flaticon-symbol"></i>
                            <h5>Commercial</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
                        </div>
                    </div>
                    <div class="col-lg-12 text-center mt-20">
                        <a href="#" class="btn button-md button-theme text-center">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services end -->

        <!-- Car Video Modal -->

            <g:each in="${propertyList}" var="property" status="i">
                <div class="modal property-modal fade" id="propertyModal-${property?.id}" tabindex="-1" role="dialog" aria-labelledby="carModalLabel" aria-hidden="true">
                    <g:set var="details" value="${property?.propertyDetails}"/>
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="carModalLabel">
                                    ${property?.title}
                                </h5>
                                <p>${property?.getFullAddress()}</p>
                                <span class="ratings">
                                    <i class="fa fa-star s1 active" data-score=""></i>
                                    <i class="fa fa-star s2 active" data-score=""></i>
                                    <i class="fa fa-star s3 active" data-score="3"></i>
                                    <i class="fa fa-star s4 active" data-score="4"></i>
                                    <i class="fa fa-star s5 active" data-score="5"></i>
                                </span>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row modal-raw">
                                    <div class="col-lg-5 modal-left">
                                        <div class="modal-left-content">
                                            <div class="bs-example" data-example-id="carousel-with-captions">
                                                <div class="carousel slide" id="properties-carousel" data-ride="carousel">
                                                    <div class="carousel-inner" role="listbox">
                                                        <div class="item">
                                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                                        </div>
                                                        <div class="item">
                                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                                        </div>
                                                        <div class="item active">
                                                            <iframe class="modalIframe" src="" allowfullscreen></iframe>
                                                        </div>
                                                    </div>

                                                    <a class="control control-prev" href="#properties-carousel" role="button" data-slide="prev">
                                                        <i class="fa fa-angle-left"></i>
                                                    </a>
                                                    <a class="control control-next" href="#properties-carousel" role="button" data-slide="next">
                                                        <i class="fa fa-angle-right"></i>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="description">
                                                <h3>Description</h3>
                                                <p>${property?.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-7 modal-right">
                                        <div class="modal-right-content bg-white">
                                            <strong class="price">
                                                <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                            </strong>
                                            <section>
                                                <h3>Features</h3>
                                                <div class="features">
                                                    <ul class="bullets">
                                                        <g:each var="detail" in="${details}">
                                                            <g:set var="feature" value="${detail?.getFeature()}"/>
                                                            <g:set var="unit" value="${detail?.getUnit()}"/>
                                                            <li><i class="flaticon-${PropertyFeature.getByValue(feature)?.code()}"></i>
                                                                <g:message code="property.feature.${feature}.label" default="${feature}"/>
                                                            </li>
                                                        </g:each>
                                                    </ul>
                                                </div>
                                            </section>
                                            <section>
                                                <h3>Overview</h3>
                                                <dl>
                                                    <dt>Model</dt>
                                                    <dd>Maxima</dd>
                                                    <dt>Type</dt>
                                                    <dd><g:message code="property.type.${property?.propertyType}.label"/></dd>
                                                    <dt>Year</dt>
                                                    <dd><g:formatDate date="${property?.lastModified}" format="yyyy"/></dd>
                                                </dl>
                                            </section>
                                            <section>
                                                <h3>Last Review</h3>
                                                <div class="ratings" data-rating="5">
                                                    <span>
                                                        <i class="fa fa-star s1 active" data-score="1"></i>
                                                        <i class="fa fa-star s2 active" data-score="2"></i>
                                                        <i class="fa fa-star s3 active" data-score="3"></i>
                                                        <i class="fa fa-star s4 active" data-score="4"></i>
                                                        <i class="fa fa-star s5 active" data-score="5"></i>
                                                    </span>
                                                </div>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's </p>
                                            </section>
                                            <a href="${createLink(controller: 'property', action: 'propertyDetails', params: [id: property?.id])}" class="btn button-sm button-theme">Show Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </g:each>

        <g:render template="/templates/footer"/>

    </body>
</html>