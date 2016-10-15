<%-- 
    Document   : login
    Created on : 05/10/2016, 08:29:54 AM
    Author     : Byron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html >

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio de Sesión</title>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <script src='js/jquery.min.js'></script>
        <script src="js/login.js"></script>
        <script src="js/Proxy.js"></script>
        <script src="js/BaseDatos.js"></script>
        <script src="js/objects/Usuario.js"></script>
    </head>
    <body>
        <div class="login_wrapper">
            <div class="animate form login-form">
                <section class="login-content">
                    <form action="home.jsp" method="GET">
                        <h1>Sistema de Gestión de Decomisos</h1>
                        <div class="logo ">
                            <img src="media/images/logo.png" alt="logo">
                        </div>
                        <div class="form-group ">
                            <input type="text" name="username" class="form-control" placeholder="Usuario" id="UserName">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group log-status">
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" id="PassWord">
                            <i class="fa fa-lock"></i>
                        </div>
                        <span class="alert">¡Datos Erróneos! <br/>Si ha olvidado la contraseña, contacte con el administrador.</span>
                        <button type="button" class="log-btn" id="login">Iniciar Sesión</button> 
                    </form>
                </section>
            </div>
        </div>
    </body>
    
    
</html>