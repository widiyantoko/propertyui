<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-12-08
  Time: 20:10
--%>

<!doctype html>
<html>
    <head>
        <title>Verifikasi Berhasil</title>
        <meta name="layout" content="main">
    </head>
    <body>
        <g:render template="/templates/header_top"/>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="error404-content">
                        <h2>Verifikasi Berhasil</h2>
                        <p>Email anda berhasil di verifikasi</p>
                        <form action="${createLink(controller: 'user', action: 'index')}" method="post">
                            <button type="submit" class="button-sm out-line-btn">Kembali ke halaman profil anda</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <g:render template="/templates/simple_footer"/>
    </body>
</html>
