var Proxy = Proxy || {};
//------------------LOGIN LOGOUT-----------------------
Proxy.userLogin = function (criterio) {
    var loader = "<img src='media/images/ajax-loader-1.gif' alt='0' width='15' height='15'>";
    $("#login").html("Iniciando Sesi\u00F3n " + loader);

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=userLogin",
        type: "POST",
        data: "user=" + criterio,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data != null) {
                window.location.href = "home.jsp";
            } else {
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};
Proxy.userLogout = function (criterio) {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=userLogout",
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            window.location.href = "login.jsp";
        }
    });
};
Proxy.listadoFuncionarios = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoFuncionarios",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            var select = document.getElementById("listadoNombre");
            clearRoot(select);
            
            if (data != null) {
                funcionarios = new Contenedor();
                funcionarios.items = data;
                for (var i = 0; i < funcionarios.size(); i++) {
                    var opt = document.createElement('option');
                    funcionario = funcionarios.get(i);
                    opt.value = funcionario.idFuncionario;
                    opt.innerHTML = funcionario.nombre + " " + funcionario.apellido1 + " " + funcionario.apellido2;
                    select.appendChild(opt);
                }
            } else {
                var opt = document.createElement('option');
                opt.value = 0;
                opt.innerHTML = "Lista vacia";
                select.appendChild(opt);
            }
        }
    });
};
Proxy.listadoPolicias = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoPolicias",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            var select = document.getElementById("listadoNombre");
            clearRoot(select);
            
            if (data != null) {
                policias = new Contenedor();
                policias.items = data;
                for (var i = 0; i < policias.size(); i++) {
                    var opt = document.createElement('option');
                    policia = policias.get(i);
                    opt.value = policia.idPolicia;
                    opt.innerHTML = policia.nombre + " " + policia.apellido1 + " " + policia.apellido2;
                    select.appendChild(opt);
                }
            } else {
                var opt = document.createElement('option');
                opt.value = 0;
                opt.innerHTML = "Lista vacia";
                select.appendChild(opt);
            }
        }
    });
};
Proxy.guardarUsuario = function (criterio) {
    
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarUsuario",
        type: "POST",
        data: "usuario=" + criterio,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data != null) {
                var res=Number(data);
                switch(res){
                    case 0:
                    alert("error en conexion")
                    case 1:
                        alert("error,usuario repetido");
                        break;
                    case 2:
                        alert("guardado correctamente");
                }
            } else {
                alert("error al guardar");
            }
        }
    });
};