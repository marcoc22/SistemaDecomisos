$(document).ready(function () {
    $('.log-btn').click(function () {
        var nick = $("#UserName").val();
        var pass = $("#Password").val();
        var usuario = new Usuario(nick, pass);
        Proxy.userLogin(JSON.stringify(usuario, replacer));
        
        /* En caso de error cuando se hace callback mostrar estaa comentadas
         $('.log-status').addClass('wrong-entry');
         $('.alert').fadeIn(500);
         setTimeout( "$('.alert').fadeOut(1500);",3000 );*/


    });
    $('.form-control').keypress(function () {
        $('.log-status').removeClass('wrong-entry');
    });

});

    