<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-29
  Time: 16:23
--%>

<%@ page contentType="text/html;charset=UTF-8" import="propertyui.Regency; Enums.PropertyStatus; Enums.PropertyType; Enums.PropertyFeature" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Submit Property</title>
    </head>

    <body>
        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>
        <!-- Submit Property start -->
        <div class="content-area-7 submit-property">
            <div class="container">
                <div class="row mb-30">
                    <div class="col-md-12">
                        <div class="alert alert-info wow fadeInLeft delay-03s"  role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Well done!</strong> You successfully read this important alert message.
                        </div>
                    </div>
                    <g:if test="${flash.error || flash.message}">
                        <div class="col-md-12">
                            <div class="alert alert-danger wow fadeInLeft delay-03s"  role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>Well done!</strong> You successfully read this important alert message.
                            </div>
                        </div>
                    </g:if>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="submit-address">
                            <g:form class="js-submit-property" controller="property" action="submitProperty" method="post">
                                <div class="main-title-2">
                                    <h1><span>Basic</span> Information</h1>
                                </div>
                                <div class="search-contents-sidebar mb-30">
                                    <div class="form-group">
                                        <label>Nama Property</label>
                                        <input type="text" id="title" name="title" class="input-text ${hasErrors(bean: submitProperty, field: 'title', 'form-has-error')}"
                                               value="${this.submitProperty?.title}"
                                               placeholder="Property Title"
                                               data-rule-required="true"
                                               data-msg="Nama property harus diisi"
                                        />
                                    </div>
                                    <div class="js-error-property-title">
                                        <g:hasErrors bean="${submitProperty}" field="title">
                                            <label id="title-error" class="o-form-error" for="title">
                                                <g:fieldError field="title" bean="${submitProperty}"/>
                                            </label>
                                        </g:hasErrors>
                                    </div><br>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select class="selectpicker search-fields" id="status" name="status">
                                                    <g:each in="${PropertyStatus.values()}" var="status">
                                                        <option value="${this.submitProperty?.propertyStatus}">
                                                            <g:message code="property.status.${status}.label"/>
                                                        </option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Type</label>
                                                <select class="selectpicker search-fields" id="type" name="type">
                                                    <g:each in="${PropertyType.values()}" var="type">
                                                        <option value="${type}">
                                                            <g:message code="property.type.${type}.label"/>
                                                        </option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div><br>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Harga</label>
                                                <input type="text" id="price" name="price" class="input-text ${hasErrors(bean: submitProperty, field: 'price', 'form-has-error')}"
                                                       value="${this.submitProperty?.price}"
                                                       placeholder="IDR"
                                                       data-rule-required="true"
                                                       data-msg="Harga harus diisi"
                                                />
                                            </div>
                                            <div class="js-error-property-price">
                                                <g:hasErrors bean="${submitProperty}" field="price">
                                                    <label id="price-error" class="o-form-error" for="price">
                                                        <g:fieldError field="price" bean="${submitProperty}"/>
                                                    </label>
                                                </g:hasErrors>
                                            </div><br>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Jumlah Ruangan</label>
                                                <input type="text" id="totalRoom" name="totalRoom" class="input-text ${hasErrors(bean: submitProperty, field: 'totalRoom', 'form-has-error')}"
                                                       placeholder="Jumlah Ruangan"
                                                       value="${this.submitProperty?.totalRoom}"
                                                       data-rule-required="true"
                                                       data-msg="Jumlah ruangan harus diisi"
                                                />
                                            </div>
                                            <div class="js-error-total-room">
                                                <g:hasErrors bean="${submitProperty}" field="totalRoom">
                                                    <label id="totalRoom-error" class="o-form-error" for="totalRoom">
                                                        <g:fieldError field="totalRoom" bean="${submitProperty}"/>
                                                    </label>
                                                </g:hasErrors>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Jumlah Kamar Mandi</label>
                                                <input type="text" id="totalBathRoom" name="totalBathRoom" class="input-text ${hasErrors(bean: submitProperty, field: 'totalBathRoom', 'form-has-error')}"
                                                       placeholder="Jumlah Kamar Mandi"
                                                       value="${this.submitProperty?.totalBathRoom}"
                                                       data-rule-required="true"
                                                       data-msg="Jumlah kamar mandi harus diisi"
                                                />
                                            </div>
                                            <div class="js-error-total-bath-room">
                                                <g:hasErrors bean="${submitProperty}" field="totalBathRoom">
                                                    <label id="totalBathRoom-error" class="o-form-error" for="totalBathRoom">
                                                        <g:fieldError field="totalBathRoom" bean="${submitProperty}"/>
                                                    </label>
                                                </g:hasErrors>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="main-title-2">
                                    <h1><span>Property</span> Gallery</h1>
                                </div>
                                <div id="myDropZone" class="dropzone dropzone-design mb-50">
                                    <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                                </div>

                                <div class="main-title-2">
                                    <h1><span>Location</span></h1>
                                </div>
                                <div class="row mb-30 ">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Alamat</label>
                                            <input type="text" id="address" name="address" class="input-text ${hasErrors(bean: submitProperty, field: 'address', 'form-has-error')}"
                                                   placeholder="Alamat"
                                                   value="${this.submitProperty?.address}"
                                                   data-rule-required="true"
                                                   data-msg="Alamat harus diisi"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Propinsi</label>
                                            <select class="selectpicker search-fields js-filter-province-list" name="state" data-live-search="true" data-live-search-placeholder="Search value">
                                                <g:each in="${propertyList}" var="province">
                                                    <option name="provinceCode" value="${this.submitProperty?.state}" class="js-option-province"
                                                            data-url="${createLink(action: 'getCityByProvince', params: [provinceCode: province?.code])}">
                                                        ${province?.name}
                                                    </option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Kota</label>
                                            <select class="selectpicker search-fields js-filter-regency-list" name="city" data-live-search="true" data-live-search-placeholder="Search value"></select>
                                        </div>
                                        <div class="js-error-property-address">
                                            <g:hasErrors bean="${submitProperty}" field="address">
                                                <label id="address-error" class="o-form-error" for="address">
                                                    <g:fieldError field="address" bean="${submitProperty}"/>
                                                </label>
                                            </g:hasErrors>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Kode pos</label>
                                            <input type="text" id="postalCode" name="postalCode" class="input-text ${hasErrors(bean: submitProperty, field: 'postalCode', 'form-has-error')}"
                                                   placeholder="Kode Pos"
                                                   value="${this.submitProperty?.postalCode}"
                                                   data-rule-required="true"
                                                   data-msg="Kode Pos harus diisi"
                                            />
                                        </div>
                                        <div class="js-error-property-zip">
                                            <g:hasErrors bean="${submitProperty}" field="postalCode">
                                                <label id="postalCode-error" class="o-form-error" for="postalCode">
                                                    <g:fieldError field="postalCode" bean="${submitProperty}"/>
                                                </label>
                                            </g:hasErrors>
                                        </div>
                                    </div>
                                </div>
                                <div class="main-title-2">
                                    <h1><span>Detailed</span> Information</h1>
                                </div>
                                <div class="row mb-30">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Detailed Information</label>
                                            <textarea id="description" name="description" class="input-text ${hasErrors(bean: submitProperty, field: 'description', 'form-has-error')}"
                                                      placeholder="Detailed Information"
                                                      data-rule-required="true"
                                                      data-msg="Harus diisi"></textarea>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mb-30">
                                    <div class="col-lg-12">
                                        <label class="margin-t-10">Features (optional)</label>
                                        <div class="row">
                                            <g:each in="${PropertyFeature.values()}" var="feature" status="i">
                                                <div class="col-lg-4 col-sm-4 col-xs-12">
                                                    <div class="checkbox-2 checkbox-theme checkbox-circle">
                                                        <input id="checkbox-${i}" type="checkbox" name="feature" class="js-feature-option">
                                                        <label for="checkbox-${i}">
                                                            <g:message code="property.feature.${feature.name()}.label" default="${feature.name()}"/>
                                                        </label>
                                                    </div>
                                                </div>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>Building Age <span>(optional)</span></label>
                                            <select class="selectpicker search-fields" name="buildingAge" id="buildingAge">
                                                <option>0-1 Years</option>
                                                <option>0-5 Years</option>
                                                <option>0-10 Years</option>
                                                <option>0-20 Years</option>
                                                <option>0-40 Years</option>
                                                <option>40+Years</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>Bedrooms (optional)</label>
                                            <input type="text" class="input-text" id="totalBedRoom" name="totalBedRoom" value="${this.submitProperty?.totalBedRoom}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <label></label>
                                        <div class="form-group">
                                            <button type="submit" class="button-md button-theme btn-block">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Submit Property end -->
        <g:render template="/templates/footer"/>
    </body>
</html>