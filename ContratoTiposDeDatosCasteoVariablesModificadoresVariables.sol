pragma solidity >=0.6.0 <0.9.0;

contract ContratoTiposDeDatosCasteoVariablesModificadoresVariables {

    // Tipos de datos

    uint numero = 5;
    bool booleano = true;
    string cadenaDeTexto = "cadena de texto";
    int numero2 = -5;
    address direccionWallet = 0x54153153185418515135484515;
    bytes32 ejemploBytes = "hola";

    // Casteo de variables

    uint8 entero8bits = 8;
    uint256 entero256bits = uint256(entero8bits);

    uint numero3 = 3;
    int numero4 = int(numero3);

    // Modificadores de acceso

    string public variablePublica = "Hola"; // crea un getter. Visibilidad total.
    int private numeroPrivado = 10; // visibilidad sólo dentro del contrato
    uint internal numeroInterno = 20; // visibilidad desde dentro del contrato y contratos derivados

}