pragma solidity ^0.8.13;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ReenOwnable is ReentrancyGuard, Ownable {
    enum taskstatus {
        TODO,
        PENDING,
        SUCEESS
    }

    taskstatus private _DEFAULT_STATUS = taskstatus.TODO;
    // set status as default

    struct todo {
        string desc;
        taskstatus status;
    }

    mapping(uint => todo) public maptodo;
    address private _owner;
    uint public total_task;

    constructor() {
        _owner == msg.sender;
        total_task = 0;
    }

    function add(uint id_, string memory desc_)
        external
        onlyOwner
        nonReentrant
    {
        todo memory todos = todo(desc_, _DEFAULT_STATUS);
        maptodo[id_] = todos;
        total_task += 1;
    }

    function update(uint id_, string memory desc_) public nonReentrant {
        todo storage todos = maptodo[id_];
        todos.desc = desc_;
        todo memory TODO = todos;
        maptodo[id_] = TODO;
    }

    function remove(uint id_) external onlyOwner nonReentrant {
        require(total_task > 0, "Tasks are empty");
        delete maptodo[id_];
        total_task -= 1;
    }

    function makeinprogress(uint id_) external onlyOwner nonReentrant {
        todo storage todos = maptodo[id_];
        todos.status = taskstatus.PENDING;
        todo memory TODO = todos;
        maptodo[id_] = TODO;
    }

    function complete(uint id_) external onlyOwner nonReentrant {
        todo storage todos = maptodo[id_];
        todos.status = taskstatus.SUCEESS;
        todo memory TODO = todos;
        maptodo[id_] = TODO;
    }

    function get(uint id_) public view returns (todo memory) {
        todo storage t = maptodo[id_];
        return (t);
    }

    function totalcounttask() public view returns (uint) {
        return total_task;
    }
}
