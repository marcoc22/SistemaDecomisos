function Usuario(idUsuario,nick, contrasena,estado,privilegio) {
    this.Usuario(idUsuario,nick, contrasena,estado,privilegio);
}

Usuario.prototype = {
    idUsuario: 0,
    nick: "",
    contrasena: "",
    estado: 0,
    privilegio:0,
    Usuario: function (idUsuario,nick, contrasena,estado,privilegio) {
        this.idUsuario = idUsuario;
        this.nick = nick;
        this.contrasena = contrasena;
        this.estado = estado;
    },
    toString: function () {
        return this.nick;
    }
};

Usuario.from = function (plain) {
    usuario = new Usuario(plain.nick, plain.contrasena);
    return usuario;
};

Usuario.to = function (usuario) {
    return {
        _class: 'Usuario',
        nick: usuario.nick,
        contrasena: usuario.contrasena
    };
};
 