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
        guardarUsuario();
    } else {
        if (refNombre.value == "") {
            refNombre.className = "error";
            refNombre.title = "Nombre requerido";
        }
        else {
            refNombre.className = "";
            refNombre.title = "";
        }

        if (refNick.value == "") {
            refNick.className = "error";
            refNick.title = "Nombre de usuario requerido";
        }
        else {
            refNick.className = "";
            refNick.title = "";
        }
        if (refPass.value == "") {
            refPass.className = "error";
            refPass.title = "Contrase\u00F1a requerido";
        }
        else {
            refPass.className = "";
            refPass.title = "";
        }
        
    }

    return exito;
}
function clearForm(){
   
    var refNick = document.getElementById("nuevo_usuario");
    var refPass = document.getElementById("pass");
    
    refNick.value="";
    refPass.value="";
}


