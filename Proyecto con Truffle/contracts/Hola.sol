// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Hola {
    string public message = "Hola Mundo";

    function getMessage() public view returns (string memory) {
        return message;
    }

    function setMessage(string memory _message) public {
        message = _message;
    }
}