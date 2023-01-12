// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract ERC20NEW is ERC20, ERC20Burnable {
    string public token_name;
    string public token_symbol;
    address payable public owner;

    constructor(string memory token_name_, string memory symbol_)
        ERC20(token_name_, symbol_)
    {
        owner = payable(msg.sender);
        token_name = token_name_;
        token_symbol = symbol_;
        _mint(owner, 100 * 10**uint256(decimals()));
    }
}
