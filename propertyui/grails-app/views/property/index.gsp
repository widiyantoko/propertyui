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
                <div class="carousel-inner" role="listbox">
                    <div class="item banner-max-height active">
                        <img src="${createLinkTo(dir:'images', file:'interior-1.jpg')}" alt="banner-slider-1" class="img-responsive">
                        <div class="carousel-caption banner-slider-inner">
                            <div class="banner-content">
                                <g:message code="public.home.banner.title.label"/>
                                <p data-animation="animated fadeInUp delay-1s">Lorem ipsum dolor sit amet, conconsectetuer adipiscing elit Lorem ipsum dolor sit amet, conconsectetuer</p>
                                <div class="col-lg-12">
                                    <g:form class="form-search view-search" method="GET" controller="property" action="search">
                                        <div class="form-group mb-0">
                                           <input type="text" name="keywords" class="form-control js-search-field" value="${params?.keywords}" placeholder="<g:message code="public.search.placeholder.label"/>">
                                        </div>
                                        <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner end -->

        <!-- Featured properties start -->
        <g:if test="${propertyList}">
            <div class="content-area featured-properties">
                <div class="container">
                    <div class="main-title">
                        <h1><g:message code="public.feature.property.label"/></h1>
                    </div>
                    <ul class="list-inline-listing filters filters-listing-navigation">
                        <li class="active btn filtr-button filtr" data-filter="all">
                            <g:message code="property.type.all.label"/>
                        </li>
                        <g:set value="${propertyList.groupBy {it.propertyType}}" var="property"/>
                        <g:each in="${property}" var="p">
                           <g:set value="${p.key?.toString()}" var="i"/>
                            <li data-filter="${PropertyType.getByValue(i)?.code()}" class="active btn btn-inline filtr-button filtr ${!PropertyType.getByValue(i)?.name() ? 'hide' : ''}">
                                <g:message code="property.type.${i}.label" default="${i}"/>
                            </li>
                        </g:each>

                    </ul>
                    <div class="clearfix"></div>
                    <div class="row wow">
                        <div class="filtr-container">
                            <g:each in="${propertyList}" var="property" status="i">
                                <g:set var="details" value="${property?.propertyDetails}"/>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  filtr-item" data-category="${PropertyType?.getByValue(property?.propertyType)?.code()}">
                                    <div class="property">
                                        <div class="property-img">
                                            <a href="${createLink(controller: 'property', action: 'buy', params: [type: property?.propertyType?.toLowerCase()])}" class="property-tag button alt featured">
                                                <g:message code="property.type.${property?.propertyType}.label" default="${property?.propertyType}"/>
                                            </a>
                                            <a class="property-tag button sale">
                                                <g:message code="property.status.${property?.propertyStatus}.label" default="${property?.propertyStatus}"/>
                                            </a>
                                            <div class="property-price">
                                                <g:formatNumber number="${property?.price}" format="\$###,##0" type="currency" currencyCode="IDR" locale="id_ID"/>
                                            </div>
                                            <img src="${property?.gallery ?: "http://placehold.it/360x240"}" alt="fp" class="img-responsive">
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
                                        <div class="property-content">
                                            <h1 class="title">
                                                <a href="${createLink(controller: "property", action: "propertyDetails", params: [id: property?.id])}">${property?.title}</a>
                                            </h1>
                                            <h3 class="property-address">
                                                <a>
                                                    <i class="fa fa-map-marker"></i>${property?.getFullAddress()}
                                                </a>
                                            </h3>
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
                                </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <g:if test="${propertyList?.size() > 0}">
                <div class="categories">
                    <div class="container">
                        <div class="clearfix"></div>
                        <div class="row wow">
                            <div class="col-lg-12 text-center mt-20">
                                <a href="${createLink(controller: "property", action: "propertyList")}" class="btn button-md button-theme text-center">
                                    <g:message code="public.button.more.label"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>
        </g:if>
        <!-- Featured properties end -->

        <div class="clearfix"></div>
        <!-- Categories strat -->
        <g:if test="${popularPropertyList?.size > 2}">
            <div class="categories">
                <div class="container">
                    <div class="main-title">
                        <h1><g:message code="public.popular.place.label"/></h1>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row wow">
                        <g:each in="${popularPropertyList}" var="popularProperty" status="i">
                            <g:set var="city" value="${popularProperty?.getAt(0)}"/>
                            <g:set var="total" value="${popularProperty?.getAt(1)}"/>

                            <g:if test="${i == 0}">
                                <div class="col-lg-5 col-md-5 col-sm-12 col-pad wow delay-04s fadeInRight">
                                    <div class="category">
                                        <div class="category_bg_box category_long_bg cat-${i}-bg">
                                            <div class="category-overlay">
                                                <div class="category-content">
                                                    <div class="category-subtitle">${total} Properties</div>
                                                    <h3 class="category-title"><a href="#">${city}</a></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:if>
                            <g:else>
                                <div class="col-lg-7 col-md-7 col-sm-12">
                                    <div class="row">
                                        <div class="${i > 0 && i < 2 ? 'col-sm-12 col-pad wow fadeInLeft delay-04s' : 'col-sm-12 col-pad wow fadeInUp delay-04s'}">
                                            <div class="category">
                                                <div class="category_bg_box cat-${i}-bg">
                                                    <div class="category-overlay">
                                                        <div class="category-content">
                                                            <div class="category-subtitle">${total} Properties</div>
                                                            <h3 class="category-title">
                                                                <a href="#">${city}</a>
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:else>
                        </g:each>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Categories end-->

        <!-- Counters strat -->
        <g:if test="${statusList.size() > 0 && countStatus.get('all') != 0}">
            <div class="counters overview-bgi">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 bordered-right">
                            <div class="counter-box">
                                <i class="flaticon-tag"></i>
                                <h1 class="counter">${countStatus.get('all')}</h1>
                                <p><g:message code="all.available.property.label"/></p>
                            </div>
                        </div>
                        <g:each in="${statusList}" var="status">
                            <div class="col-md-3 col-sm-6 bordered-right">
                                <div class="counter-box">
                                    <i class="flaticon-tag"></i>
                                    <h1 class="counter">${countStatus.get(status.name())}</h1>
                                    <p>Untuk di <g:message code="property.status.${status.name()}.label" default="${status.name()}"/></p>
                                </div>
                            </div>
                        </g:each>
                        <div class="col-md-3 col-sm-6">
                            <div class="counter-box">
                                <i class="flaticon-people-1"></i>
                                <h1 class="counter">${totalUser}</h1>
                                <p>User</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Counters end -->

        <!-- Testimonials 2 -->
        <g:if test="${lastReviewList}">
            <div class="testimonials-2">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="sec-title-three">
                                <h4>Happy Clients</h4>
                                <h2>Testimonials</h2>
                                <div class="text">
                                    We collect reviews from our customers so you can get an honest opinion of what an apartment is really like!
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                            <div id="carouse3-example-generic" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <g:each in="${lastReviewList}" var="lr" status="i">
                                        <div class="item content clearfix ${i < 1 ? 'active' : ''}">
                                            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                                <div class="avatar">
                                                    <img src="http://placehold.it/220x220" alt="avatar-1" class="img-responsive">
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="text">
%{--                                                    <p style="font-style: italic">"${lr?.userReview?.take(300)}"</p>--}%
                                                    <p style="font-style: italic">"${lr?.userReview?.take(240)}"</p>
                                                </div>
                                                <div class="author-name">
                                                    ${lr?.user?.getFullName()}
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <i class="fa fa-star"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-star"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-star"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-star"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-star-half-full"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </g:each>
                                </div>
                                <a class="left carousel-control" href="#carouse3-example-generic" role="button" data-slide="prev">
                                    <span class="slider-mover-left t-slider-l" aria-hidden="true">
                                        <i class="fa fa-angle-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carouse3-example-generic" role="button" data-slide="next">
                                    <span class="slider-mover-right t-slider-r" aria-hidden="true">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Testimonial 2 end -->
        <div class="clearfix"></div>

        <div class="content-area-10"></div>
        <g:render template="/templates/brands_partner"/>


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
                                            <div class="carousel slide" id="properties-carousel-${i}" data-ride="carousel">
                                                <div class="carousel-inner" role="listbox">
                                                    <div class="item active">
                                                        <img src="${property?.gallery ?: 'http://placehold.it/450x300'}" alt="best-properties">
                                                    </div>
                                                    <div class="item">
                                                        <img src="${property?.gallery ?: 'http://placehold.it/450x300'}" alt="best-properties">
                                                    </div>
                                                    <!--
                                                    <div class="item active">
                                                        <iframe class="modalIframe" src="${property?.gallery}" allowfullscreen></iframe>
                                                    </div>
                                                    -->
                                                </div>

                                                <a class="control control-prev" href="#properties-carousel-${i}" role="button" data-slide="prev">
                                                    <i class="fa fa-angle-left"></i>
                                                </a>
                                                <a class="control control-next" href="#properties-carousel-${i}" role="button" data-slide="next">
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="description">
                                            <h3><g:message code="public.description.label"/></h3>
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
                                            <h3><g:message code="public.feature.label"/></h3>
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
                                            <h3><g:message code="public.overview.label"/></h3>
                                            <dl>
                                                <dt><g:message code="public.model.label"/></dt>
                                                <dd>Maxima</dd>
                                                <dt><g:message code="public.type.label"/></dt>
                                                <dd><g:message code="property.type.${property?.propertyType}.label"/></dd>
                                                <dt><g:message code="public.year.label"/></dt>
                                                <dd><g:formatDate date="${property?.lastModified}" format="yyyy"/></dd>
                                            </dl>
                                        </section>
                                        <section>
                                            <h3><g:message code="public.lastReview.label"/></h3>
                                            <div class="ratings" data-rating="5">
                                                <span>
                                                    <i class="fa fa-star s1 active" data-score="1"></i>
                                                    <i class="fa fa-star s2 active" data-score="2"></i>
                                                    <i class="fa fa-star s3 active" data-score="3"></i>
                                                    <i class="fa fa-star s4 active" data-score="4"></i>
                                                    <i class="fa fa-star s5 active" data-score="5"></i>
                                                </span>
                                            </div>
                                            <p style="font-style: italic">${property?.userReview?.take(300)}</p>
                                        </section>
                                        <a href="${createLink(controller: 'property', action: 'propertyDetails', params: [id: property?.id])}" class="btn button-sm button-theme">
                                            <g:message code="public.show.detail.label"/>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>

        <g:render template="/templates/simple_footer"/>
        <g:render template="/templates/footer"/>

    </body>
</html>