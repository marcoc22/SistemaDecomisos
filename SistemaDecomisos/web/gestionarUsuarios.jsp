<%-- 
    Document   : actaDecomiso
    Created on : 26-oct-2016, 11:52:35
    Author     : Mery Zúñiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


        <!-- Custom Theme Style -->
        <link href="css/custom.min.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <link rel="shortcut icon" href="media/images/logo2.ico" type="image/x-icon" />


    </head>

    <body class="nav-md">
        <div class="container body">
            <div id="modalAgregarUsuario" class="modal modal-wide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Agregar Usuario</h4>
                        </div>
                        <div class="modal-body">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title" id="add_user">
                                        <h2>Datos del Usuario</h2>
                                        
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content" >
                                        <form id="form_agregar_usuario" role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label for="tipoUsuario">Tipo de Usuario</label>
                                                <div>
                                                    <label class="radio-inline">
                                                        <input id="funcionarioRadio" type="radio" name="tipoUsuario" value="funcionario" checked>Funcionario 
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="tipoUsuario" value="policia">Policía Municipal 
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="estado">Estado</label>
                                                
                                                <div>
                                                    <label class="radio-inline">
                                                        <input id="activo" type="radio" name="estado" value="activo" checked>Activo 
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input id="inactivo" type="radio" name="estado" value="inactivo">Inactivo 
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="listadoNombre">Nombre</label>
                                                <div>
                                                    <select id="listadoNombre"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nuevo_usuario">Usuario</label>
                                                <div>
                                                    <input type="text" id="nuevo_usuario" class="col-md-4">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nueva_contraseña">Contraseña</label>
                                                <div>
                                                    <input type="text" id="nueva_contraseña" disabled class="col-md-2"> 
                                                    <button class="btn btn-round btn-xs"><i class="fa fa-search"></i></button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nueva_imagen">Imagen de usuario</label>
                                                <div>
                                                    <input type="file" id="nueva_imagen" class="col-md-6">
                                                </div>
                                            </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-9 col-md-offset-3">
                                                    <button type="submit" class="btn btn-primary btn-sm" id="agregar_usuario"><i class="fa fa-save"></i> Agregar Usuario </button>
                                                    <button type="reset" class="btn btn-danger btn-sm" id="cancelar_agregar_usuario" data-dismiss="modal"><i class="fa fa-remove"></i> Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" >Cerrar</button> 
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
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
                                <h2>User</h2>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div align="right">
                            <img src="media/images/addPersona.png" height="50" width="50" data-toggle="modal"  onclick="showPopUp('agregar');" title="Agregar nuevo usuario" >
                        </div>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Usuarios existentes </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Tipo de Usuario</th>
                                            <th>Estado</th>
                                            <th>Nombre</th>
                                            <th>Usuario</th>
                                            <th>Contraseña</th>
                                            <th>Imagen</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Funcionario</td>
                                            <td>Activo</td>
                                            <td>User</td>
                                            <td>2</td>
                                            <td>123</td>
                                            <td><img src="media/images/user.png" alt=""></td>
                                            <td><button class="btn btn-sm btn-dark" data-toggle="modal" data-target="#myModal" contenteditable="false"><i class="fa fa-edit"></i> Editar</button></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!--<button class="btn btn-upload btn-dark " style=" margin-left: 20px;"><i class="fa fa-plus"></i> Agregar Usuario</button>-->

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
        <script src="js/forms.js"></script>
        <script src="js/multifield.js"></script>
        <script src="js/validator.js"></script>
        <script src="js/objects/Funcionario.js"></script>
        <script src="js/objects/Contenedor.js"></script>
        <script src="js/Utils.js"></script>
        <script src="js/BaseDatos.js"></script>
        <script src="js/Proxy.js"></script>
        <script src="js/GestionarUsuarios.js"></script>
    </body>
</html>

