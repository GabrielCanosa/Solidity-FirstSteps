// SPDX-License-Identifier: MIT

pragma solidity >=0.4.4 < 0.7.0;
pragma experimental ABIEncoderV2;

contract notas {
    //direccion del profesor
    address public profesor;
    
    constructor() public {
        // msg.sender es la direccion de quien despliega el contrato
        profesor = msg.sender;
    }

    // Mapping para relacionar el hash de la identidad del alumno con su nota del examen
    mapping(bytes32 => uint) Notas;

    // Array de los alumnos que pidan revision de examen
    mapping (string => string[]) revisiones;

    // Eventos
    event alumno_evaluado(bytes32);
    event alumno_revision(string);

    // Funcion para evaluar alumnos
    function evaluar(string memory _asignatura, string memory _idAlumno, uint _nota) public UnicamenteProfesor(msg.sender) {
        // Hash de la identificacion del alumno
        bytes32 hash_idAlumno = keccak256(abi.encodePacked(_asignatura, _idAlumno));
        // Relacion entre el hash de la identificacion del alumno y su nota
        Notas[hash_idAlumno] = _nota;
        // Emision del evento
        emit alumno_evaluado(hash_idAlumno);
    }

    modifier UnicamenteProfesor(address _direccion) {
        // Requiere que la direccion introducida sea igual al dueño del contrato (quien lo despliega)
        require(_direccion == profesor, "No tienes permisos para ejecutar esta funcion");
        _;
    }

    // Funcion para ver las notas de un alumno
    function verNotas(string memory _asignatura, string memory _idAlumno) public view returns(uint) {
         // Hash de la identificacion del alumno
         bytes32 hash_idAlumno = keccak256(abi.encodePacked(_asignatura, _idAlumno));
         uint nota_alumno = Notas[hash_idAlumno];
         // Visualizar la nota
         return nota_alumno;
    }

    function revision(string memory _asignatura, string memory _idAlumno) public {
        // Almacenamiento de la identificacion de un alumno
        revisiones[_asignatura].push(_idAlumno);
        // Emision del evento
        emit alumno_revision(_idAlumno);
    }

    // Funcion para ver los alumnos que han solicitado revision de examen
    function verRevisiones(string memory _asignatura) public view UnicamenteProfesor(msg.sender) returns(string[] memory ) {
        return revisiones[_asignatura];
    }
}