<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="hibernateVeEntityler.RandevuEkleHibernate" %>
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


    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>


    <%
        String tcKimlikNo=request.getParameter("tc");
        request.setAttribute("tcKimlikNo",tcKimlikNo);
    %>

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



                        <!-- Navbar Menu -->
                        <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">





                            <!-- Logout    -->
                            <li class="nav-item"><a class="nav-link logout"><%= (new java.util.Date()).toLocaleString()%><i class="fa fa-sign-out"></i></a></li>
                            <li class="nav-item">
                                <form action="ControllerServlet" method="get">
                                    <input type="hidden" name="command" value="LOGOUT" />
                                    <input type="submit" value="Oturumu Sonlandir"  class="btn-danger"/>

                                </form>
                            </li>
                        </ul>
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
                        <h1 class="h4">Hosgeldiniz <br> <br>${kullanici}</h1>
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
                        <h2 class="no-margin-bottom">Saglikli Gunler Dileriz   <span style="color: #419641;">   ${randevu}</span></h2>
                    </div>
                </header>


                <!--  Kart Bölümü            -->
                <div class="col-lg-12" style="margin-top: 20px;">
                    <div class="recent-updates card">
                        <div class="card-header">
                            <h3 class="h4">Guncel Duyurular</h3>
                        </div>
                        <div class="card-body no-padding">
                            <!-- Item-->
                            <div class="item d-flex justify-content-between">
                                <div class="info d-flex">
                                    <div class="icon"><i class="icon-rss-feed"></i></div>
                                    <div class="title">
                                        <h5>Sistem Kullanimi</h5>
                                        <p>https://www.youtube.com/channel/UCx8a4W76x5RtQCk2ZCkvHmw  bu linkte proje kullanim videosu mevcuttur.</p>
                                    </div>
                                </div>
                                <div class="date text-right"><strong>18</strong><span>Eylul 2017</span></div>
                            </div>
                            <!-- Item-->
                            <div class="item d-flex justify-content-between">
                                <div class="info d-flex">
                                    <div class="icon"><i class="icon-rss-feed"></i></div>
                                    <div class="title">
                                        <h5>Proje Dosyalari</h5>
                                        <p>https://github.com/mevlanayalcin hesabindan proje dosyalarina ulasabilirsiniz.</p>
                                    </div>
                                </div>
                                <div class="date text-right"><strong>18</strong><span>Eylul 2017</span></div>
                            </div>
                            <!-- Item        -->
                            <div class="item d-flex justify-content-between">
                                <div class="info d-flex">
                                    <div class="icon"><i class="icon-rss-feed"></i></div>
                                    <div class="title">
                                        <h5>Proje Yapiminda Kullanilan Araclar</h5>
                                        <p>JSP,Servlet,Hibernate,MySql,Bootstrap,Html,Css,Javascript,Jquery</p>
                                    </div>
                                </div>
                                <div class="date text-right"><strong>18</strong><span>Eylul 2017</span></div>
                            </div>
                            <!-- Item-->
                            <div class="item d-flex justify-content-between">
                                <div class="info d-flex">
                                    <div class="icon"><i class="icon-rss-feed"></i></div>
                                    <div class="title">
                                        <h5>Kullanim Sartlari</h5>
                                        <p>Bu program tamamiyla bana aittir.Indirip istediginiz bicimde kullanabilirsiniz.Bir tesekkuru de cok gormezsiniz umarim :)</p>
                                    </div>
                                </div>
                                <div class="date text-right"><strong>18</strong><span>Eylul 2017</span></div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Page Footer-->
                <footer class="main-footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <p>Hastane Randevu Sistemi &copy; 2017 Eylul</p>
                            </div>
                            <div class="col-sm-6 text-right">
                                <p>Eylul 2017 Mevlana YALCIN </p>
                                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>


    <!-- Javascript files-->

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
