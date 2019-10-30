<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-10-19
  Time: 12:53
--%>

<%@ page contentType="text/html;charset=UTF-8" import="propertyui.PropertyDetails; Enums.PropertyStatus; Enums.PropertyType; Enums.PropertyFeature" %>
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
                <ul class="list-inline-listing filters filters-listing-navigation">
                    <li class="active btn filtr-button filtr" data-filter="all">All</li>
                    <g:each in="${PropertyType}" var="type" status="i">
                        <li data-filter="${type?.code()}" class="btn btn-inline filtr-button filtr">${type}</li>
                    </g:each>
                </ul>
                <div class="row">
                    <div class="filtr-container">
                        <g:each in="${propertyList}" var="property" status="i">
                            <g:set var="details" value="${property?.propertyDetails}"/>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  filtr-item" data-category="${PropertyType?.getByValue(property?.propertyType)?.code()}">
                                <div class="property">
                                    <!-- Property img -->
                                    <div class="property-img">
                                        <div class="property-tag button alt featured">Featured</div>
                                        <div class="property-tag button sale">${property?.propertyStatus}</div>
                                        <div class="property-price">$ ${property?.price}</div>
                                        <img src="http://placehold.it/360x240" alt="fp" class="img-responsive">
                                        <div class="property-overlay">
                                            <a href="properties-details.html" class="overlay-link">
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
                                    <!-- Property content -->
                                    <div class="property-content">
                                        <!-- title -->
                                        <h1 class="title">
                                            <a href="properties-details.html">${property?.title}</a>
                                        </h1>
                                        <!-- Property address -->
                                        <h3 class="property-address">
                                            <a href="properties-details.html">
                                                <i class="fa fa-map-marker"></i>${property?.address},
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
                                                    <li>
                                                        <i class="flaticon-${PropertyFeature.getByValue(detail?.feature)?.code()}"></i>
                                                        <span>${detail?.unit} ${detail?.feature}</span>
                                                    </li>
                                                </g:each>
                                            </g:if>
                                        </ul>
                                        <!-- Property footer -->
                                        <div class="property-footer">
                                            <span class="left">
                                                <a href="#"><i class="fa fa-user"></i>Jhon Doe</a>
                                            </span>
                                            <span class="right">
                                                <i class="fa fa-calendar"></i>5 Days ago
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                    <g:if test="${propertyList?.size() > 0}">
                        <div class="col-lg-12 text-center mt-20">
                            <a href="${createLink(controller: "home", action: "propertyList")}" class="btn button-md button-theme text-center">Load More</a>
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

        <!-- Intro section strat -->
        <div class="intro-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <img src="${createLinkTo(dir: 'images', file: 'red-logo.png')}" alt="logo-2">
                    </div>
                    <div class="col-md-7 col-sm-6 col-xs-12">
                        <h3>Looking To Sell Or Rent Your Property?</h3>
                    </div>
                    <div class="col-md-2 col-sm-3 col-xs-12">
                        <a href="submit-property.html" class="btn button-md button-theme">Submit Now</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Intro section end -->

        <g:render template="/templates/footer"/>

    </body>
</html>