function showPopUp(action){
    if(document.getElementById("funcionarioRadio").checked){
        Proxy.listadoFuncionarios();
    }else{
        Proxy.listadoPolicias();
    }
    $("#modalAgregarUsuario").modal('show');;
}