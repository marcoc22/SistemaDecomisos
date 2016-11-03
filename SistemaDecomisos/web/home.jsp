<%-- 
    Document   : home
    Created on : 14/10/2016, 08:57:31 PM
    Author     : Byron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sistema de Gestión de Decomisos</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
       
        
        <!-- Custom Theme Style -->
        <link href="css/custom.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="media/images/logo2.ico" type="image/x-icon" />

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="home.jsp" class="site_title"><img src="media/images/logo_home.png"></a>
                        </div>

                        <div class="clearfix"></div>

                        <!-- menu profile quick info -->
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="media/images/user.png" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Bienvenido,</span>
                                <h2><%%></h2>
                            </div>
                        </div>
                        <!-- /menu profile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li><a href="home.jsp"><i class="fa fa-home"></i> Inicio </a>
                                    </li>
                                    <li><a><i class="fa fa-edit"></i> Gestionar Decomisos <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="actaDecomiso.jsp">Registrar acta de decomiso</a></li>
                                            <li><a href="#">Registrar acta de donación</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-bar-chart-o"></i> Ver Reportes <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="#">Gráfico de zonas</a></li>
                                            <li><a href="#">Zonas recientes</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /sidebar menu -->

                        <!-- /menu footer buttons -->

                        <!-- /menu footer buttons -->
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <img src="media/images/user.png" alt="">User
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <li><a id="administrar" href="gestionarUsuarios.jsp"><i class="fa fa-cog pull-right" ></i> Gestión de Usuarios</a></li>
                                        <li><a id="logout"><i class="fa fa-sign-out pull-right" ></i> Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                 <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>TODO <small> Todo el contenido va aquí.</small></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
               

                <!-- footer content -->
                <footer>
                    <div class="pull-right">
                        Municipalidad de Heredia. 2016 Todos los derechos reservados.
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="js/fastclick.js"></script>
        <!-- NProgress -->
        <script src="js/nprogress.js"></script>
        <!--Date-->
        <script src="js/daterangepicker.js"></script>
        <script src="js/moment.min.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="js/custom.js"></script>
        <script src="js/home.js"></script>
        <script src="js/Proxy.js"></script>
      
    </body>
</html>

