pragma solidity >=0.6.0 <0.9.0;

contract ContratoMapping {

    /* mapping */
    // es un diccionario. par clave-valor

    struct Persona {
        string nombre;
        uint edad;
    }

    Persona[] personas;
    mapping (string => uint) public nombreToEdad;

    function agregarPersona(string memory _nombre, uint _edad) {
        personas.push(Persona(_nombre, _edad));
        nombreToEdad[_nombre] = _edad;
    }

    // 1. agregamos una persona
    // 2. se crea el mapping nombreToEdad
    // 3. ahora, preguntando por su nombre, podemos saber su edad
}