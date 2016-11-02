function Policia(identificacion, puesto, nombre, apellido1, apellido2, idPolicia) {
    this.Policia(identificacion, puesto, nombre, apellido1, apellido2, idPolicia);
}

Policia.prototype = {
    identificacion: "",
    puesto: "",
    nombre: "",
    apellido1: "",
    apellido2: "",
    idPolicia: 0,
    Policia: function (identificacion, puesto, nombre, apellido1, apellido2, idPolicia) {
        this.identificacion = identificacion;
        this.puesto = puesto;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.idPolicia = idPolicia;
    }
};

Policia.from = function (plain) {
    policia = new Policia(
            plain.identificacion,
            plain.puesto,
            plain.nombre,
            plain.apellido1,
            plain.apellido2,
            plain.idPolicia);
    return policia;
};

Policia.to = function (policia) {
    return {
        _class: 'Policia',
        identificacion: policia.idPolicia,
        puesto: policia.puesto,
        nombre: policia.nombre,
        apellido1: policia.apellido1,
        apellido2: policia.apellido2,
        idPolicia: policia.idPolicia
    };
};
 