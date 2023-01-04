pragma solidity ^0.8.0;

abstract contract Test {
    uint256 public x = 4;

    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
    require(owner() == msg.sender, "Ownership Assertion: Caller of the function is not the owner.");
      _;
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        _owner = newOwner;
    }

    function getData() public view  returns (uint256){
        return x;
    }


}