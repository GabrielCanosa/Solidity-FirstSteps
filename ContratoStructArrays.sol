pragma solidity >=0.6.0 <0.9.0;

contract ContratoStructArrays {

    /* Struct */

    struct Persona {
        uint number;
        string nombre;
    }

    Persona public persona = Persona({ number: 1, nombre: "Gabriel" });

    /* Array */

    // array dinamico
    Persona[] public personas;

    // array fijo
    Persona[1] public personas2;

    function addPerson(uint _number, string memory _nombre) public {
        personas.push(Persona({number: _number, name: _nombre}));
        // o
        personas.push(Persona(_number, _nombre));
    }

    /* memory & storage */

    // memory

    function doSomething(string memory _parameter) public {
        // los datos sólo serán almacenados durante la ejecución de la función
    }

    // storage
    
    function doSomethingAgain(string storage _parameter) public {
        // los datos persistiran despues de la ejecución de la función
    }
}