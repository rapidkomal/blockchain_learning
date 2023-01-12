// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SwapToken {
    // using Token for address;
    address public owner1; //account 0
    address public owner2; // account 1
    uint256 public amount1;
    uint256 public amount2;
    IERC20 public token1;
    IERC20 public token2;

    constructor(
        address owner_1,
        address token_1,
        uint256 amount_1,
        address owner_2,
        address token_2,
        uint256 amount_2
    ) {
        owner1 = owner_1;
        token1 = IERC20(token_1);
        owner2 = owner_2;
        token2 = IERC20(token_2);
        amount1 = amount_1;
        amount2 = amount_2;
    }

    function check() public returns (address, address) {
        return (owner1, owner2);
    }

    function swap() public {
        // require(
        //     msg.sender == owner1 || msg.sender == owner2,
        //     "this user is not authorized"
        // );
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Amount is not valid for 1st owner"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Amount is not valid for 2nd owner"
        );

        require(
            _safeTranscer(token1, owner1, owner2, amount1),
            "Something went wrong while transfering tokens for 1st owner"
        );
        require(
            _safeTranscer(token2, owner2, owner1, amount2),
            "Something went wrong while transfering tokens for 2nd owner"
        );
    }

    function _safeTranscer(
        IERC20 token,
        address from_,
        address to_,
        uint256 amt_
    ) public returns (bool) {
        bool value = token.transferFrom(from_, to_, amt_);
        require(value, "something went wrong!!");
        return value;
    }
}
