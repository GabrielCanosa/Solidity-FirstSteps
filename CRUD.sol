// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

contract crudTasks {
    // uint nextId;
    struct Task {
        uint id;
        string name;
        string description;
        bool isFinished;
    }

    Task[] public tareas;

    function createTask(uint _id, string memory _name, string memory _description, bool _isFinished) public {
        tareas.push(Task(_id, _name, _description, _isFinished));
    }

    function getTaskNameById(uint _id) public view returns (string memory) {
        return tareas[_id].name;
    }

    function getTaskNameDescriptionAndStatusById(uint _id) public view returns (string memory, string memory, bool) {
        return (tareas[_id].name, tareas[_id].description, tareas[_id].isFinished);
    }

    function updateTask(uint _id, string memory _name, string memory _description, bool _isFinished) public {
        tareas[_id].name = _name;
        tareas[_id].description = _description;
        tareas[_id].isFinished = _isFinished;
    }

    // no se elimina la tarea, lo que se eliminan son sus valores
    function deleteTask(uint _id) public {
        delete tareas[_id];
    }

}
