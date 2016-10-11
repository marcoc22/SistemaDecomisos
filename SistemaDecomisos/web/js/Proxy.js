var Proxy = Proxy || {};
//------------------LOGIN LOGOUT-----------------------
Proxy.userLogin = function (criterio) {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=userLogin",
        type: "POST",
        data: "user=" + criterio,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            //data: user returned from Servlet
        }
    });
};


