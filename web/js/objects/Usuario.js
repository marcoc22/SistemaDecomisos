function Usuario(nick, contrasena) {
    this.Usuario(nick, contrasena);
}

Usuario.prototype = {
    
    nick: "",
    contrasena: "",
    Usuario: function (nick, contrasena) {
      
        this.nick = nick;
        this.contrasena = contrasena;
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
 