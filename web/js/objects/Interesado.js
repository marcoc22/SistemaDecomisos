function Interesado(idInteresado, fechaNacimiento, domicilio) {
    this.Interesado(idInteresado, fechaNacimiento, domicilio);
}

Interesado.prototype = {
    idInteresado: 0, 
    fechaNacimiento: "",
    domicilio : "",
    Interesado: function (idInteresado, fechaNacimiento, domicilio) {
        this.idInteresado = idInteresado, 
        this.fechaNacimiento = fechaNacimiento,
        this.domicilio = domicilio;
    }
};

Interesado.from = function (plain) {
    interesado = new Interesado(
    plain.idInteresado, 
    plain.fechaNacimiento,
    plain.domicilio);
    return interesado;
};

Interesado.to = function (interesado) {
    return {
        _class: 'Interesado',
        idInteresado: interesado.idInteresado, 
        fechaNacimiento : interesado.fechaNacimiento,
        domicilio : interesado.domicilio
    };
};
 