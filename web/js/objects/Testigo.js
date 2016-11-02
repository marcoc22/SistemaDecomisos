function Testigo(idTestigo) {
    this.Testigo(idTestigo);
}

Testigo.prototype = {
    idTestigo : "", 
    Testigo: function (idTestigo) {
        this.idTestigo = idTestigo;
    }
};

Testigo.from = function (plain) {
    testigo = new Testigo(
        plain.idTestigo
    );
    return testigo;
};

Testigo.to = function (testigo) {
    return {
        _class: 'Testigo',
        idTestigo : testigo.idTestigo
    };
};
 