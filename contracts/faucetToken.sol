// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract faucetToken is ERC20Burnable {
    address payable public owner; 

    constructor () ERC20("faucetToken", "FCT") {
        owner = payable(msg.sender);
        _mint(owner, 500000 * (10 ** uint256(decimals())));
    }
}
