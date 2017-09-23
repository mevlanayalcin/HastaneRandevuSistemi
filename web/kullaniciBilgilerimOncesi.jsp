<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hastane Randevu Sistemi 2017</title>
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



    <%
        String tcKimlikNo=request.getParameter("tc");
        request.setAttribute("tcKimlikNo",tcKimlikNo);
    %>

    <c:if test="${empty tcKimlikNo}">
        <%
            String tcKimlikNoYedek= (String) request.getAttribute("tc1");
            request.setAttribute("tcKimlikNo",tcKimlikNoYedek);
        %>

    </c:if>

    <c:url var="indexIcinTc" value="index.jsp" >
        <c:param name="tc" value="${tcKimlikNo}"/>
    </c:url>

    <c:url var="randevuGosterIcinTc" value="RandevuGoster.jsp" >
        <c:param name="tc" value="${tcKimlikNo}"/>
    </c:url>

    <c:url var="yakindakiHastanelerIcinTc" value="yakindakiHastaneler.jsp" >
        <c:param name="tc" value="${tcKimlikNo}"/>
    </c:url>

    <c:url var="bilgilerOncesiIcinTc" value="kullaniciBilgilerimOncesi.jsp" >
        <c:param name="tc" value="${tcKimlikNo}"/>
    </c:url>

    <c:url var="duyurularIcinTc" value="duyurular.jsp" >
        <c:param name="tc" value="${tcKimlikNo}"/>
    </c:url>
</head>

<body>
    <div class="page home-page">
        <!-- Main Navbar-->
        <header class="header">
            <nav class="navbar">


                <div class="container-fluid">
                    <div class="navbar-holder d-flex align-items-center justify-content-between">


                        <!-- Navbar Header-->
                        <div class="navbar-header">
                            <!-- Navbar Brand -->
                            <a href="index.html" class="navbar-brand">
                                <div class="brand-text brand-big hidden-lg-down"><span>Hastane Randevu Sistemi </span><strong> 2017</strong></div>
                                <div class="brand-text brand-small"><strong>HRS 2017</strong></div>
                            </a>
                            <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                        </div>

                    </div>
                </div>
            </nav>
        </header>
        <div class="page-content d-flex align-items-stretch">
            <!-- Side Navbar -->
            <nav class="side-navbar">
                <!-- Sidebar Header-->
                <div class="sidebar-header d-flex align-items-center">
                    <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                    <div class="title">
                        <h1 class="h4">Hosgeldiniz </h1>
                        <p></p>
                    </div>
                </div>
                <!-- Sidebar Navidation Menus--><span class="heading">Menuler</span>
                <ul class="list-unstyled">
                    <li class="active"> <a href="${indexIcinTc}"><i class="icon-home"></i>Randevu al</a></li>
                    <li>
                        <a href="${randevuGosterIcinTc}"> <i class="icon-interface-windows"></i>Randevu Gecmisi </a>

                    </li>
                    <li>
                        <a href="${yakindakiHastanelerIcinTc}"> <i class="icon-grid"></i>Yakinimdaki Hastaneler </a>
                    </li>
                    <li>
                        <a href="${bilgilerOncesiIcinTc}"> <i class="fa fa-bar-chart"></i>Bilgilerim </a>
                    </li>
                    <li>
                        <a href="${duyurularIcinTc}"> <i class="icon-padnote"></i>Duyurular </a>
                    </li>

                </ul>

            </nav>
            <div class="content-inner">
                <!-- Page Header-->
                <header class="page-header">
                    <div class="container-fluid">
                        <h2 class="no-margin-bottom">Saglikli Gunler Dileriz</h2>
                    </div>
                </header>

 <!-- Horizontal Form-->
 <div class="col-lg-9" style="margin-top: 10px;">
        <div class="card">

            <div class="card-header d-flex align-items-center">
                <h3 class="h4">Bu alana erismek icin kimlik numaraniz ve sifrenizi girmeniz gereklidir   ${uyeGuncellemesi} </h3>
            </div>
            <div class="card-body">
                <!-- Modal Form-->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary">Bilgilerinizi gormek icin tiklayiniz</button>
                            <!-- Modal-->
                            <div id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                                <div role="document" class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-body">
                                            <p>Lorem ipsum dolor sit amet consectetur.</p>
                                            <form action="kullaniciBilgilerim.jsp" method="post">
                                                <div class="form-group">
                                                    <input type="hidden" name="tc1" value="${tcKimlikNo}" />
                                                    <label>TC Kimlik Numarasi</label>
                                                    <input type="number" name="tc" placeholder="TC Kimlik Numarasi" class="form-control" min="10000000000" max="99999999999">
                                                </div>
                                                <div class="form-group">
                                                    <label>Sifre</label>
                                                    <input type="password" name="sifre" placeholder="Sifre" class="form-control">
                                                </div>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" data-dismiss="modal" class="btn btn-secondary">Kapat</button>
                                            <button type="submit" class="btn btn-primary">Onayla</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="js/charts-home.js"></script>
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
