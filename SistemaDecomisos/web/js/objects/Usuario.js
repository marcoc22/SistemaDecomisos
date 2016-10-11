function Usuario(id, nick, contrasena) {
    this.Usuario(id, nick, contrasena);
}

Usuario.prototype = {
    id: "",
    nick: "",
    contrasena: "",
    Usuario: function (id, nick, contrasena) {
        this.id = id;
        this.nick = nick;
        this.contrasena = contrasena;
    },
    toString: function () {
        return this.id;
    }
};

Usuario.from = function (plain) {
    usuario = new Usuario(plain.id, plain.nick, plain.contrasena);
    return usuario;
};

Usuario.to = function (usuario) {
    return {
        _class: 'Usuario',
        id: usuario.id,
        nick: usuario.nick,
        contrasena: usuario.contrasena
    };
};
 