pragma solidity >=0.6.0 <0.9.0;

contract ContratoFunciones {

    /* Tipos de datos */

    function holaMundo() {
        return "Hola Mundo";
    }

    function Multiplicar(uint numero1, uint numero2) {
        uint resultado = numero1 * numero2;
        return resultado;
    }

    /* Modificadores de acceso */

    // Las funciones por defecto son publicas (accesibles desde cualquier contrato)
    // Por convención, se utiliza el guión bajo para funciones privadas

    function _funcionPrivada() private {
        // Hace algo...
    }

    // No se modifican datos, solo se accede a ellos
    function _funcionView() private view {

    }

    function devuelveUnString() view returns (string) {
        return "¿Qué hay de nuevo viejo?";
    }

    // No modifica variables, trabaja con los parametros recibidos
    function funcionPura(int num1, int num2) private pure returns (int) {
        return num1 + num2;
    }


}