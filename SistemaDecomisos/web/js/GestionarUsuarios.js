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

