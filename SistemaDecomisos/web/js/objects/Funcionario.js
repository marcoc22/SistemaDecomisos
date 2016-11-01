function Funcionario(id, nombre, apellido1, apellido2) {
    this.Funcionario(id, nombre, apellido1, apellido2);
}

Funcionario.prototype = {
    id: int, 
    nombre: "",
    apellido1 : "",
    apellido2 : "",
    Funcionario: function (id, nombre, apellido1, apellido2) {
        this.id = id, 
        this.nombre = nombre,
        this.apellido1 = apellido1,
        this.apellido2 = apellido2;
    }
};

Funcionario.from = function (plain) {
    funcionario = new Funcionario(
    plain.id, 
    plain.nombre,
    plain.apellido1,
    plain.apellido2);
    return funcionario;
};

Funcionario.to = function (funcionario) {
    return {
        _class: 'Funcionario',
        id: funcionario.idFuncionario, 
        nombre : funcionario.nombre,
        apellido1 : funcionario.apellido1,
        apellido2 : funcionario.apellido2
    };
};
 