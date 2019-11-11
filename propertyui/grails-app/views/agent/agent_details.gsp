<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-11
  Time: 17:03
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Agent Details</title>
    </head>

    <body>

        <g:render template="/templates/header_top"/>
        <g:render template="/templates/header"/>

        <!-- Sub banner start -->
        <div class="sub-banner overview-bgi">
            <div class="overlay">
                <div class="container">
                    <div class="breadcrumb-area">
                        <h1>Agent Detail</h1>
                        <ul class="breadcrumbs">
                            <li><a href="${createLink(controller: 'user', action: 'agentList')}">Back</a></li>
                            <li class="active">Agent Detail</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Banner end -->

        <!-- Agent section start -->
        <div class="agent-section content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <!-- Agent detail start -->
                        <div class="agent-detail clearfix">
                            <div class="col-lg-5 col-md-6 col-sm-5 agent-theme">
                                <img src="http://placehold.it/312x350" alt="agent-1" class="img-responsive">
                            </div>
                            <div class="col-lg-7 col-md-6 col-sm-7 agent-content clearfix">
                                <h5>Creative Director</h5>
                                <h3>
                                    <a>${agentDetails?.user?.getFullName()}</a>
                                </h3>
                                <!-- Address list -->
                                <ul class="address-list">
                                    <li><span><i class="fa fa-tag"></i>Title:</span>
                                        ${agentDetails?.user?.getFullName()}
                                    </li>
                                    <li><span><i class="fa fa-envelope"></i>Email:</span>
                                        ${agentDetails?.user?.email}
                                    </li>
                                    <li><span><i class="fa fa-phone"></i>Office:</span>
                                        ${agentDetails?.user?.contactOffice ?: '-'}
                                    </li>
                                    <li><span><i class="fa fa-mobile"></i>Mobile:</span>
                                        ${agentDetails?.user?.contactMobile ?: '-'}
                                    </li>
                                    <!--
                                    <li>
                                        <span>
                                            <i class="fa fa-skype"></i>Skype:
                                        </span>
                                        john.antony
                                    </li>
                                    -->
                                </ul>

                                <div class="social-media">
                                    <!-- Social list -->
                                    <ul class="social-list">
                                        <li><a href="${agentDetails?.socialFacebook}" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="${agentDetails?.socialTwitter}" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="${agentDetails?.socialLinkedin}" class="linkedin-bg"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="${agentDetails?.socialInstagram}" class="google-bg"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Agent detail end -->

                        <div class="sidebar-widget clearfix biography">
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>Biography</span></h1>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla. Nulla posuere sapien vitae lectus suscipit, et pulvinar nisi tincidunt. Aliquam erat volutpat. Curabitur convallis fringilla diam sed aliquam. Sed tempor iaculis massa faucibus feugiat. In fermentum facilisis massa, a consequat purus viverra a.
                            </p>
                            <p>
                                Ut euismod ultricies sollicitudin. Curabitur sed dapibus nulla. Nulla eget iaculis lectus. Mauris ac maximus neque. Nam in mauris quis libero sodales eleifend. Morbi varius, nulla sit amet rutrum elementum</p>
                            <br>

                            <div class="panel-box">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1default" data-toggle="tab" aria-expanded="true">Additional Details</a></li>
                                    <li class=""><a href="#tab2default" data-toggle="tab" aria-expanded="false">Attachments</a></li>
                                </ul>
                                <div class="panel with-nav-tabs panel-default">
                                    <div class="panel-body">
                                        <div class="tab-content">
                                            <div class="tab-pane fade active in" id="tab1default">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6">
                                                        <ul class="additional-details-list">
                                                            <li><span>Agent Since:</span><g:formatDate date="${agentDetails?.user?.dateCreated}" format="yyyy"/></li>
                                                            <li><span>Last Sold Property:</span>3 day ago</li>
                                                            <li><span>Properties Sold:</span>20</li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6">
                                                        <ul class="additional-details-list">
                                                            <li><span>Properties Rented:</span>26</li>
                                                            <li><span>Average Price:</span>$180,000</li>
                                                            <li><span>Website:</span><a href="#">www.sparker.com</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade features" id="tab2default">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="attachments">
                                                            <a href="#"><i class="fa fa-file-o"></i>Resume</a>
                                                            <br><br>
                                                            <a href="#"><i class="fa fa-file-o"></i>Brochure</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recently properties start -->
                        <div class="recently-properties">
                            <!-- Main title -->
                            <div class="main-title-2">
                                <h1><span>Recently</span> Properties</h1>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- Property 2 start -->
                                    <div class="property-2">
                                        <!-- Property img -->
                                        <div class="property-img">
                                            <div class="featured">
                                                Featured
                                            </div>
                                            <div class="price-ratings">
                                                <div class="price">$150,000</div>
                                                <div class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                            <img src="http://placehold.it/360x240" alt="rp" class="img-responsive">
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
                                        <!-- content -->
                                        <div class="content">
                                            <!-- title -->
                                            <h4 class="title">
                                                <a href="properties-details.html">Big Head House</a>
                                            </h4>
                                            <!-- Property address -->
                                            <h3 class="property-address">
                                                <a href="properties-details.html">
                                                    <i class="fa fa-map-marker"></i>123 Kathal St. Tampa City,
                                                </a>
                                            </h3>
                                        </div>
                                        <!-- Facilities List -->
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                                <span>4800 sq ft</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-bed"></i>
                                                <span>3</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-holidays"></i>
                                                <span>2</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-vehicle"></i>
                                                <span>1</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Property 2 end -->
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- Property 2 start -->
                                    <div class="property-2">
                                        <!-- Property img -->
                                        <div class="property-img">
                                            <div class="featured">
                                                Featured
                                            </div>
                                            <div class="price-ratings">
                                                <div class="price">$150,000</div>
                                                <div class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                            <img src="http://placehold.it/360x240" alt="rp" class="img-responsive">
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
                                        <!-- content -->
                                        <div class="content">
                                            <!-- title -->
                                            <h4 class="title">
                                                <a href="properties-details.html">Beautiful Single Home</a>
                                            </h4>
                                            <!-- Property address -->
                                            <h3 class="property-address">
                                                <a href="properties-details.html">
                                                    <i class="fa fa-map-marker"></i>123 Kathal St. Tampa City,
                                                </a>
                                            </h3>
                                        </div>
                                        <!-- Facilities List -->
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                                <span>4800 sq ft</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-bed"></i>
                                                <span>3</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-holidays"></i>
                                                <span>2</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-vehicle"></i>
                                                <span>1</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Property 2 end -->
                                </div>
                            </div>
                        </div>
                        <!-- Partners block end -->
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12  col-xs-12">
                        <div class="sidebar">
                            <div class="sidebar-widget contact-1">
                                <div class="main-title-2">
                                    <h1><span>Contact</span> Agent</h1>
                                </div>
                                <div class="contact-form">
                                    <form id="agent_form" action="index.html" method="GET" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group your-name">
                                                    <input type="email" name="name" class="input-text" placeholder="Your Name">
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group your-email">
                                                    <input type="email" name="email" class="input-text" placeholder="Your Email">
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group your-phone">
                                                    <input type="text" name="phone" class="input-text" placeholder="Your Phone">
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group message">
                                                    <textarea class="input-text" name="message" placeholder=" Message"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <button type="submit" class="button-md button-theme btn-block">Send Message</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                            <!-- Category posts start -->
                            <div class="sidebar-widget category-posts">
                                <div class="main-title-2">
                                    <h1><span>popular</span> Category</h1>
                                </div>
                                <ul class="list-unstyled list-cat">
                                    <li><a href="#">Single Family </a> <span>(45)  </span></li>
                                    <li><a href="#">Apartment  </a> <span>(21)  </span></li>
                                    <li><a href="#">Condo </a> <span>(23)  </span></li>
                                    <li><a href="#">Multi Family </a> <span>(19)  </span></li>
                                    <li><a href="#">Villa </a> <span>(19)  </span></li>
                                    <li><a href="#">Other  </a> <span>(22)  </span></li>
                                </ul>
                            </div>
                            <!-- Social media start -->
                            <div class="social-media sidebar-widget clearfix">
                                <!-- Main Title 2 -->
                                <div class="main-title-2">
                                    <h1><span>Social</span> Media</h1>
                                </div>
                                <!-- Social list -->
                                <ul class="social-list">
                                    <li><a href="#" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="linkedin-bg"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" class="google-bg"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#" class="rss-bg"><i class="fa fa-rss"></i></a></li>
                                </ul>
                            </div>
                            <!-- Tags box -->
                            <div class="sidebar-widget tags-box mb-0">
                                <div class="main-title-2">
                                    <h1><span>popular</span> Tags</h1>
                                </div>
                                <ul class="tags">
                                    <li><a href="#">Image</a></li>
                                    <li><a href="#">Features</a></li>
                                    <li><a href="#">Typography</a></li>
                                    <li><a href="#">Gallery</a></li>
                                    <li><a href="#">Slideshow</a></li>
                                    <li><a href="#">Post Formats</a></li>
                                    <li><a href="#">Sellers</a></li>
                                    <li><a href="#">WooCommerce</a></li>
                                    <li><a href="#">Shortcodes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Agent section end -->
        
        <g:render template="/templates/footer"/>
    </body>
</html>