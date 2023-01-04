// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDoList{
    struct Todo{
        string text;
        string status;
        bool completed;
    }

    // Initialise string varibale for owner address
    address private _owner;

    Todo[] public todos;

    // constructor 
    constructor() {
        _owner = msg.sender;
    }

    // to view owner address
    function owner() public view virtual returns (address) {
        return _owner;
    }

    // creating todo list
    function create(string calldata text_) public {
       // assert _owner == msg.sender;
       
        require(msg.sender == _owner, "Only Owner is allowed to do this!");
        //initializing struct
        todos.push(Todo(text_, "INITIATED", false));

        //key value mapping here
        todos.push(Todo({text: text_, status: "INITIATED", completed: false}));

        // initialize struct as empty
        Todo memory todo;
        todo.text = text_;
        todo.status = "INITIATED";

        todos.push(todo);

    }
    
    // change status as pending function
    function statuschange(uint _index, string calldata _status) public {
        require(msg.sender == _owner, "Only Owner is allowed to do this!");
        Todo storage todo = todos[_index];
        todo.status = _status;
    }

    // get function
    function get(uint _index) public view returns (string memory text, string memory status, bool completed){
        Todo storage todo = todos[_index];
        return (todo.text, todo.status, todo.completed);
    }

    //todo update by anyone
    function update(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    //update as completed
    function complete(uint _index) public {
        Todo storage todo = todos[_index];
        todo.status = "SUCCESS";
        todo.completed = !todo.completed;
    }

}