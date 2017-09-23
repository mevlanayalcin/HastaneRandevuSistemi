<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Giris Yapin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Font Awesome CDN-->
    <!-- you can replace it by local Font Awesome-->
    <script src="https://use.fontawesome.com/99347ac47f.js"></script>
    <!-- Font Icons CSS-->
    <link rel="stylesheet" href="https://file.myfontastic.com/da58YPMQ7U5HY8Rb6UxkNf/icons.css">
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
    <div class="page login-page">
        <div class="container d-flex align-items-center">
            <div class="form-holder has-shadow">
                <div class="row">
                    <!-- Logo & Information Panel-->
                    <div class="col-lg-6">
                        <div class="info d-flex align-items-center" style="background-image: url(img/hastane2.jpg); 
                        background-size: 190% auto; background-position: left ;background-repeat: no-repeat;">
                            <div class="content">


                            </div>
                        </div>
                    </div>
                    <!-- Form Panel    -->
                    <div class="col-lg-6 bg-white">
                        <div class="form d-flex align-items-center">
                            <div class="content">
                                <div class="logo">
                                    <h1 style="color: darkslategray;">Tum bilgileri doldurunuz</h1>
                                </div>

                                <form id="register-form" action="ControllerServlet" method="get">
                                    <input type="hidden" name="command" value="REGISTER" />
                                    <div class="form-group">
                                        <input id="tc_kimlik" type="number" name="TC" required class="input-material" min="10000000000" max="99999999999">
                                        <label for="tc_kimlik" class="label-material">TC Kimlik Numarasi</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="isim" type="text" name="AD" required class="input-material">
                                        <label for="isim" class="label-material">Ad</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="soyisim" type="text" name="SOYAD" required class="input-material">
                                        <label for="soyisim" class="label-material">Soyad</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="email" type="email" name="MAIL" required class="input-material">
                                        <label for="email" class="label-material">Mail Adresi</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="tel" type="number" name="TELEFON" required class="input-material">
                                        <label for="tel" class="label-material">Telefon</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password" type="password" name="SIFRE" required class="input-material">
                                        <label for="password" class="label-material">Sifre</label>
                                    </div>

                                    <input id="register" type="submit" value="Kayit Ol" class="btn btn-primary">
                                </form><small>Giris Ekranina Donmek Icin Tiklayin </small><a href="login.jsp" class="signup">Giris</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Javascript files-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js">
    </script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/front.js"></script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
    <!---->
    <script>
        (function(b, o, i, l, e, r) {
            b.GoogleAnalyticsObject = l;
            b[l] || (b[l] =
                function() {
                    (b[l].q = b[l].q || []).push(arguments)
                });
            b[l].l = +new Date;
            e = o.createElement(i);
            r = o.getElementsByTagName(i)[0];
            e.src = '//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e, r)
        }(window, document, 'script', 'ga'));
        ga('create', 'UA-XXXXX-X');
        ga('send', 'pageview');
    </script>
</body>
</html>