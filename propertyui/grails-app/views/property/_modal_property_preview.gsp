<%@ page import="Enums.PropertyFeature" %>
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