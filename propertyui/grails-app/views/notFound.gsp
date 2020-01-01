<!doctype html>
<html>
    <head>
        <title>Page Not Found</title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <!--
        <ul class="errors">
            <li>Error: Page Not Found (404)</li>
            <li>Path: ${request.forwardURI}</li>
        </ul>
        -->
        <g:render template="/templates/header_top"/>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Error404 content start -->
                    <div class="error404-content">
                        <h1>404</h1>
                        <h2>Something is wrong</h2>
                        <p>The page you are looking for was moved, removed, renamed or might never.</p>
                        <form action="${createLink(controller: 'property', action: 'index')}" method="post">
                            <button type="submit" class="button-sm out-line-btn">Back to home page</button>
                        </form>
                    </div>
                    <!-- Error404 content end -->
                </div>
            </div>
        </div>

        <g:render template="/templates/simple_footer"/>
        <g:render template="/templates/footer"/>

    </body>
</html>
