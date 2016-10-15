
$(document).ready(function () {
//        $('.log-btn').click(function(){
//            $('.log-status').addClass('wrong-entry');
//           $('.alert').fadeIn(500);
//           setTimeout( "$('.alert').fadeOut(1500);",3000 );
//        });
    $('.form-control').keypress(function () {
        $('.log-status').removeClass('wrong-entry');
    });
    $('#login').click(function () {
        var nick = $("#UserName").val();
        var pass = $("#PassWord").val();
        var usuario = new Usuario(nick, pass);
        Proxy.userLogin(JSON.stringify(usuario, replacer));
    });
});
function errorLogin() {
    $('.log-status').addClass('wrong-entry');
    $('.alert').fadeIn(500);
    setTimeout("$('.alert').fadeOut(1500);", 3000);
}

