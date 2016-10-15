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
            if (data != null) {
                window.location.href = "home.jsp";
            }else{
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


