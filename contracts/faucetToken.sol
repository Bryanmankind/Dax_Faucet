// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extension/ERC20Capped.sol"
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extension/ERC20Burnable.sol"



contract faucetToken is ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;

    constructor (uint256 cap, uint256 reward) ERC20("faucetToken", "FCT") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 500000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
}
}