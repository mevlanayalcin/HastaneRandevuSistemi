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
    <script language="javascript" type="text/javascript">
        $(document).ready(function(){

            //ilce bilgileri burada
            var ankaraIlceler = [
                {display: "Kecioren", value: "Kecioren" },
                {display: "Etimesgut", value: "Etimesgut" },
                {display: "Altindag", value: "Altindag" },
                ];

            var istanbulIlceler = [
                {display: "Fatih", value: "Fatih" },
                {display: "Uskudar", value: "Uskudar" },
                {display: "Kadikoy", value: "Kadikoy" }
                ];

            var kirsehirIlceler = [
                {display: "Kaman", value: "Kaman" },
                {display: "Cicekdagi", value: "Cicekdagi" }];

            //ilcelerin hastane bilgileri burada

            //Ankara İlçeleri
            var keciorenHastaneler = [
                {display: "Tepebasi Agiz Dis Hastanesi", value: "Tepebasi Agiz Dis Hastanesi" },
                {display: "Senatoryum Hastanesi", value: "Senatoryum Hastanesi" },
                {display: "Gulhane Arastirma Hastanesi", value: "Gulhane Arastirma Hastanesi" },
            ];

            var etimesgutHastaneler = [
                {display: "Etimesgut Devlet Hastanesi", value: "Etimesgut Devlet Hastanesi" },
            ];

            var altindagHastaneler = [
                {display: "Ulus Devlet Hastanesi", value: "Ulus Devlet Hastanesi" },
                {display: "Ibni Sina Hastanesi", value: "Ibni Sina Hastanesi" },
                {display: "Diskapi Hastanesi", value: "Diskapi Hastanesi" },
            ];

            //İstanbul ilçeleri

            var fatihHastaneler = [
                {display: "Haseki Arastirma Hastanesi", value: "Haseki Arastirma Hastanesi" },
                {display: "Cerrahpasa Hastanesi", value: "Cerrahpasa Hastanesi" },
                {display: "Bezmialem Hastanesi", value: "Bezmialem Hastanesi" },
            ];

            var uskudarHastaneler = [
                {display: "Haydarpasa Numune Hastanesi", value: "Haydarpasa Numune Hastanesi" },
                {display: "Uskudar Devlet Hastanesi", value: "Uskudar Devlet Hastanesi" },
                {display: "Zeynep Kamil Hastanesi", value: "Zeynep Kamil Hastanesi" },
            ];

            var kadikoyHastaneler = [
                {display: "Erenkoy Ruh ve Sinir Hastaliklari Hastanesi", value: "Erenkoy Ruh ve Sinir Hastaliklari Hastanesi" },
                {display: "Yeditepe Universitesi Hastanesi", value: "Yeditepe Universitesi Hastanesi" },

            ];

            //Kirsehir Hastaneler

            var kamanHastaneler = [
                {display: "Kaman Devlet Hastanesi", value: "Kaman Devlet Hastanesi" },
            ];

            var cicekdagiHastaneler = [
                {display: "Cicekdagi Devlet Hastanesi", value: "Cicekdagi Devlet Hastanesi " },
            ];

            //Klinik Listesi

            var klinikler = [
                {display: "Agiz Ve Dis Sagligi", value: "Agiz Ve Dis Sagligi" },
                {display: "Androloji", value: "Androloji" },
                {display: "Beslenme ve Diyetik", value: "Beslenme ve Diyetik" },
                {display: "Beyin ve Sinir Cerrahisi", value: "Beyin ve Sinir Cerrahisi" },
                {display: "Cocuk Cerrahisi", value: "Cocuk Cerrahisi" },
                {display: "Gogus Hastaliklari", value: "Gogus Hastaliklari" },
                {display: "Genel Cerrahi", value: "Genel Cerrahi" },
                {display: "Goz Hastaliklari", value: "Goz Hastaliklari" },
                {display: "Kadin Hastaliklari ve Dogum", value: "Kadin Hastaliklari ve Dogum" },
                {display: "Ic Hastaliklari ", value: "Ic Hastaliklari" },
                {display: "Psikiyatri", value: "Psikiyatri" },
                {display: "Tomosentez", value: "Tomosentez" }

            ];


                //If parent option is changed
            $("#parent_selection").change(function() {
                var parent = $(this).val(); //get option value from parent
                list2(klinikler);

                switch(parent){ //using switch compare selected option and populate child
                    case 'Ankara':
                        list(ankaraIlceler);
                        break;
                    case 'Istanbul':
                        list(istanbulIlceler);
                        break;
                    case 'Kirsehir':
                        list(kirsehirIlceler);
                        break;
                    default: //default child option is blank
                        $("#child_selection").html('');
                        break;
                }
            });


            //If parent option is changed
            $("#child_selection").change(function() {
                var parent = $(this).val(); //get option value from parent

                switch(parent){ //using switch compare selected option and populate child
                    case 'Kecioren':
                        list1(keciorenHastaneler);
                        break;
                    case 'Etimesgut':
                        list1(etimesgutHastaneler);
                        break;
                    case 'Altindag':
                        list1(altindagHastaneler);
                        break;
                    case 'Fatih':
                        list1(fatihHastaneler);
                        break;
                    case 'Uskudar':
                        list1(uskudarHastaneler);
                        break;
                    case 'Kadikoy':
                        list1(kadikoyHastaneler);
                        break;
                    case 'Kaman':
                        list1(kamanHastaneler);
                        break;
                    case 'Cicekdagi':
                        list1(cicekdagiHastaneler);
                        break;
                    default: //default child option is blank
                        $("#hastaneler").html('');
                        break;
                }
            });






                //function to populate child select box
            function list(array_list)
            {
                $("#child_selection").html(""); //reset child options
                $(array_list).each(function (i) { //populate child options
                    $("#child_selection").append("<option value=\""+array_list[i].value+"\">"+array_list[i].display+"</option>");
                });

            }




            function list1(array_list)
            {

                $("#hastaneler").html("");
                $(array_list).each(function (i) { //populate child options
                    $("#hastaneler").append("<option value=\""+array_list[i].value+"\">"+array_list[i].display+"</option>");
                });

            }

            function list2(array_list)
            {

                $("#klinikler").html("");
                $(array_list).each(function (i) { //populate child options
                    $("#klinikler").append("<option value=\""+array_list[i].value+"\">"+array_list[i].display+"</option>");
                });

            }


        });






    </script>


<%
    String tcKimlikNo= (String) request.getAttribute("tc1");
    request.setAttribute("tcKimlikNo",tcKimlikNo);
%>
    <c:if test="${empty tcKimlikNo}">
        <%
            String tcKimlikNoYedek=request.getParameter("tc");
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


                        <h1 class="h4">Hosgeldiniz <br> <br>${tc}${tcKimlikNo}</h1>
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


                <!-- Horizontal Form-->
                <div class="col-lg-9" style="margin-top: 10px;">
                    <div class="card">

                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">Randevu Bilgilerinizi Seciniz</h3>
                        </div>
                        <div class="card-body">

                            <form class="form-horizontal" method="get" action="ControllerServlet">
                                <input type="hidden" name="command" value="RANDEVU" />
                                <c:if test="${empty tcKimlikNo}">
                                    <input type="hidden" name="tcNo" value="${tc}" />
                                </c:if>
                                <input type="hidden" name="tcNo" value="${tcKimlikNo}" />
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Sehir</label>
                                    <div class="col-sm-9 select">
                                        <select name="parent_selection" id="parent_selection" class="form-control" >
                                            <option value="">-- Seciniz --</option>
                                            <option value="Ankara">Ankara</option>
                                            <option value="Istanbul">Istanbul</option>
                                            <option value="Kirsehir">Kirsehir</option>
                                        </select>
                                    </div>
                                </div>
                               <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Ilce</label>
                                    <div class="col-sm-9 select">
                                        <select name="child_selection" id="child_selection" class="form-control" ></select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Hastane</label>
                                    <div class="col-sm-9 select">
                                        <select name="hastaneler" id="hastaneler" class="form-control" ></select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Klinik</label>
                                    <div class="col-sm-9 select">
                                        <select name="klinikler" id="klinikler" class="form-control"></select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-9 offset-sm-3">
                                        <input type="submit" value="Randevu al" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
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
