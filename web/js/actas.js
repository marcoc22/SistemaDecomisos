$(document).ready(function(){
   $('#enviarActa_Dec').click(function(){
      enviarActa(); 
   }); 
});

function enviarActa(){
    var idDecomiso = 0;
    var policia = new Policia(1); 
    var testigo = new Testigo(2); 
    var lugar = new Lugar("some", "place"); 
    var fecha = new Date(); 
    var hora = new Date().getTime(); 
    var interesado = new Interesado(4, new Date(), "Some place"); 
    var decomisos = [new Decomiso(5, "a", 1, "xxx"), new Decomiso(6, "a", 1, "xxx")]; 
    var observaciones = "asdasd";
    var actaDecomiso = new ActaDecomiso(idDecomiso,policia, testigo, lugar,
                                        fecha, hora, interesado,
                                        decomisos, observaciones);
    Proxy.actaDecomiso(JSON.stringify(actaDecomiso, replacer));
}