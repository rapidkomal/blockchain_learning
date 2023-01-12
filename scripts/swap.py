#!/usr/bin/python3

from brownie import Token, SwapToken, ERC20NEW, config, accounts


def approve_fun(token, address, amount):
    token.approve(address, amount)
    pass


def main():
    print("Main Fun")
    # act_three = accounts.add(config["wallets"]["from_key_one"])
    # act_two = accounts.add(config["wallets"]["from_key_two"])
    # act_three = accounts.add(config["wallets"]["from_key"])
    act_one = accounts[0]
    act_two = accounts[1]
    act_three = accounts[2]
    amt_one = 10
    amt_two = 20
    # token_addr = Token.deploy("Test Token", "TST", 18, 1e21, {'from': sender})
    token1 = ERC20NEW.deploy("TOKEN_ONE", "ONE", {"from": act_one})
    token2 = ERC20NEW.deploy("TOKEN_TWO", "TWO", {"from": act_two})

    print("Deploying swap token")
    token3 = SwapToken.deploy(act_one, token1, amt_one, act_two, token2, amt_two, {"from": act_three})

    print("approving token 1st")
    # approve_fun(token1, token3, 200)
    token1.approve(token3, 200)

    print("approving token 2nd")
    # approve_fun(token2, token3, 200)
    token2.approve(token3, 200)

    print("Before Swap balance of act 1: ", token1.balanceOf(act_one))
    print("Before Swap balance of act 2: ", token2.balanceOf(act_two))
    print("Swaping the amount")
    token3.swap()
    print("After Swap balance of act 1: ", token1.balanceOf(act_one))
    print("After Swap balance of act 2: ", token2.balanceOf(act_two))
    print("Total supply of act 1: ", token1.totalSupply())
    print("Total supply of act 2: ", token2.totalSupply())
