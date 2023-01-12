#!/usr/bin/python3

from brownie import ERC20NEW, accounts, config


def main():
    sender = accounts.add(config["wallets"]["from_key"])
    # sender = accounts[0]
    # token_addr = Token.deploy("Test Token", "TST", 18, 1e21, {'from': sender})
    test_addr = ERC20NEW.deploy("GTOKEN", "CTN", {"from": sender}, publish_source=True)
    return test_addr
