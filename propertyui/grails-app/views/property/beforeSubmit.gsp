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
                                        <input type="text" class="input-text" id="title" name="title"
                                               value="${this.submitProperty?.title}"
                                               placeholder="Property Title"
                                               data-rule-required="true"
                                               data-msg="Nama property harus diisi"
                                        />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select class="selectpicker search-fields" id="status" name="status"
                                                        data-rule-required="true"
                                                        data-msg="Status harus di isi">
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
                                                <select class="selectpicker search-fields" id="type" name="type"
                                                        data-rule-required="true"
                                                        data-msg="Status harus di isi">
                                                    <g:each in="${PropertyType.values()}" var="type">
                                                        <option value="${this.submitProperty?.propertyType}">
                                                            <g:message code="property.type.${type}.label"/>
                                                        </option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Harga</label>
                                                <input type="text" class="input-text" id="price" name="price"
                                                       value="${this.submitProperty?.price}"
                                                       placeholder="IDR"
                                                       data-rule-required="true"
                                                       data-msg="Harga harus diisi"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Jumlah Ruangan</label>
                                                <input type="text" class="input-text" id="totalRoom" name="totalRoom"
                                                       placeholder="Jumlah Ruangan"
                                                       value="${this.submitProperty?.totalRoom}"
                                                       data-rule-required="true"
                                                       data-msg="Jumlah ruangan harus diisi"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <label>Jumlah Kamar Mandi</label>
                                                <input type="text" class="input-text" id="totalBathRoom" name="totalBathRoom"
                                                       placeholder="Jumlah Kamar Mandi"
                                                       value="${this.submitProperty?.totalBathRoom}"
                                                       data-rule-required="true"
                                                       data-msg="Jumlah kamar mandi harus diisi"
                                                />
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
                                            <input type="text" class="input-text" id="address" name="address"
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
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Kode pos</label>
                                            <input type="text" class="input-text" name="zip"  placeholder="Postal Code">
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
                                            <textarea class="input-text" name="message" placeholder="Detailed Information"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-30">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>Building Age <span>(optional)</span></label>
                                            <select class="selectpicker search-fields" name="years">
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
                                            <select class="selectpicker search-fields" name="1">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>Bathrooms (optional)</label>
                                            <select class="selectpicker search-fields" name="1">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <label class="margin-t-10">Features (optional)</label>
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4 col-xs-12">
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
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-12">
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
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-12">
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