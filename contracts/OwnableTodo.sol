// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// import "@openzeppelin/contracts/access/Ownable.sol";

// import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ToDoTask is ReentrancyGuard, Ownable {
    address private _owner;

    mapping(uint => Todo) public tasks;

    uint[] public T_Ids;

    struct Todo {
        string desc;
        string status;
    }

    constructor() {
        _owner = msg.sender;
    }

    // modifier onlyOwner(){

    // }

    function get(uint id_) public view returns (string memory, string memory) {
        // Retrieve the account from the mapping
        Todo storage todo = tasks[id_];
        // Return the name and balance
        return (todo.desc, todo.status);
    }

    function addtask(uint id_, string memory desc_) public onlyOwner {
        // Create a new todo
        Todo memory todo = Todo(desc_, "PENDING");
        // Add the todo to the mapping
        tasks[id_] = todo;
        T_Ids.push(id_);
    }

    function numoftasks() public view returns (uint) {
        return T_Ids.length;
    }

    function markcompleted(uint id_) public onlyOwner {
        Todo storage todos = tasks[id_];
        Todo memory todo = Todo(todos.desc, "SUCCESS");
        tasks[id_] = todo;
    }
}
