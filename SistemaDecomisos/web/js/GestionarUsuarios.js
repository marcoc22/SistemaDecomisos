$(document).ready(function () {
    
});
function showPopUp(action) {
    cargarListado();
    $("#modalAgregarUsuario").modal('show');
    ;
}
function cargarListado() {
    if (document.getElementById("funcionarioRadio").checked) {
        Proxy.listadoFuncionarios();
    } else {
        Proxy.listadoPolicias();
    }
}
function mouseoverPass(obj) {
    var obj = document.getElementById('pass');
    obj.type = "text";
}
function mouseoutPass(obj) {
    var obj = document.getElementById('pass');
    obj.type = "password";
}
function guardarUsuario(){
    var activo=document.getElementById("activo");
    var privilegio=document.getElementById("esAdmin");
    var estado=0;
    var priv=0;
    if(activo.checked){
        estado=1;
    }
    if(privilegio.checked){
        priv=1;
    }
    
    var usuario = new Usuario(
    0,
    $("#nuevo_usuario").val(),
    $("#pass").val(),
    estado,
    priv
    );
    
    Proxy.guardarUsuario(JSON.stringify(usuario, replacer));
    
}
function validarCampos(){
   

    var exito = true;
    var refNombre = document.getElementById("listadoNombre");
    var refNick = document.getElementById("nuevo_usuario");
    var refPass = document.getElementById("pass");
    
   
    exito = (refNombre.value != "") && (refNick.value != "") && (refPass.value != "");
    if (exito) {
        
    } else {
        if (refId.value == "") {
            refId.className = "error";
            refId.title = "Identificaci\u00F3n requerida";
        }
        else {

            //if (existe == 0) {
            refId.className = "";
            refId.title = "";
            /*} else if (existe == 1) {
             refId.className = "error";
             refId.title = "Empleado existente";
             }*/

        }

        if (refNombre.value == "") {
            refNombre.className = "error";
            refNombre.title = "Nombre es requerido";
        }
        else {
            refNombre.className = "";
            refNombre.title = "";
        }
        if (refApellido1.value == "") {
            refApellido1.className = "error";
            refApellido1.title = "Primer apellido es requerido";
        }
        else {
            refApellido1.className = "";
            refApellido1.title = "";
        }
        if (refApellido2.value == "") {
            refApellido2.className = "error";
            refApellido2.title = "Segundo apellido es requerido";
        }
        else {
            refApellido2.className = "";
            refApellido2.title = "";
        }
        if (refFecharc.value == "") {
            refFecharc.className = "error";
            refFecharc.title = "Fecha de nacimiento es requerida";
        }
        else {
            refFecharc.className = "";
            refFecharc.title = "";
        }
        if (refLugar_nacimiento.value == "") {
            refLugar_nacimiento.className = "error";
            refLugar_nacimiento.title = "Lugar de nacimiento es requerido";
        }
        else {
            refLugar_nacimiento.className = "";
            refLugar_nacimiento.title = "";
        }
        if (refPadre.value == "") {
            refPadre.className = "error";
            refPadre.title = "Identificaci\u00F3n del padre es requerida";
        }
        else {
            if (isNumber(refPadre.value)) {
                refPadre.className = "";
                refPadre.title = "";
            }
            else {
                refPadre.className = "error";
                refPadre.title = "Identificaci\u00F3n del padre debe ser numeral";
            }
        }
        if (refNombre_padre.value == "") {
            refNombre_padre.className = "error";
            refNombre_padre.title = "Nombre de padre es requerido";
        }
        else {
            refNombre_padre.className = "";
            refNombre_padre.title = "";
        }
        if (refMadre.value == "") {
            refMadre.className = "error";
            refMadre.title = "Identificaci\u00F3n de la madre es requerida";
        }
        else {
            if (isNumber(refMadre.value)) {
                refMadre.className = "";
                refMadre.title = "";
            }
            else {
                refMadre.className = "error";
                refMadre.title = "Identificaci\u00F3n de la madre debe ser numeral";
            }

        }
        if (refNombre_madre.value == "") {
            refNombre_madre.className = "error";
            refNombre_madre.title = "Nombre de madre es requerido";
        }
        else {
            refNombre_madre.className = "";
            refNombre_madre.title = "";
        }
        if (refFuente.value == "") {
            refFuente.className = "error";
            refFuente.title = "Fuente es requerida";
        }
        else {
            refFuente.className = "";
            refFuente.title = "";
        }
        if (refDepartamento.value == "") {
            refDepartamento.className = "error";
            refDepartamento.title = "Departamento requerido";
        }
        else {
            refDepartamento.className = "";
            refDepartamento.title = "";
        }
        if (puesto.value == "") {
            puesto.className = "error";
            puesto.title = "Puesto de trabajo requerido";
        }
        else {
            puesto.className = "";
            puesto.title = "";
        }
        if (refTurno.value == "") {
            refTurno.className = "error";
            refTurno.title = "Turno Laboral requerido";
        }
        else {
            refTurno.className = "";
            refTurno.title = "";
        }

    }

    //});
    return exito;
}

