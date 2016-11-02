function showPopUp(action){
    cargarListado();
    $("#modalAgregarUsuario").modal('show');;
}
function cargarListado(){
    if(document.getElementById("funcionarioRadio").checked){
        Proxy.listadoFuncionarios();
    }else{
        Proxy.listadoPolicias();
    }
}