function Policia(idPolicia) {
    this.Policia(idPolicia);
}

Policia.prototype = {
    idPolicia : 0, 
    nombre: "",
    apellido1 : "",
    apellido2 : "",
    Policia: function (idPolicia) {
        this.idPolicia = idPolicia;
    }
};

Policia.from = function (plain) {
    policia = new Policia(
        plain.idPolicia
    );
    return policia;
};

Policia.to = function (policia) {
    return {
        _class: 'Policia',
        idPolicia : policia.idPolicia
    };
};
 