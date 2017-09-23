<%@ page import="hibernateVeEntityler.entity.RandevuBilgileri" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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


    <%
        String tc=request.getParameter("tc");
        List<RandevuBilgileri> randevuBilgileriList=new ArrayList<>();
        randevuBilgileriList= RandevuEkleHibernate.RandevuCek(tc);
        request.setAttribute("RandevuBilgileriListesi",randevuBilgileriList);
        System.out.println("RandevuGoster.jsp icerisindeyiz agam" );
        for(RandevuBilgileri rd:randevuBilgileriList)
        {
            System.out.print(rd);
        }

    %>

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
                            <a href="index.jsp" class="navbar-brand">
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
                        <div class="card-body">
                          <table class="table table-striped table-hover">
                            <thead>
                              <tr>
                                  <th>Randevu No</th>
                                  <th>Sehir</th>
                                  <th>Ilce</th>
                                  <th>Hastane</th>
                                  <th>Klinik</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${RandevuBilgileriListesi}" var="liste">
                                <tr>
                                    <td>${liste.id}</td>
                                    <td>${liste.sehir}</td>
                                    <td>${liste.ilce}</td>
                                    <td>${liste.hastane}</td>
                                    <td>${liste.klinik}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                          </table>
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
