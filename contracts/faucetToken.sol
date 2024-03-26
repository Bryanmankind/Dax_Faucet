// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";



contract faucetToken is ERC20 {
    address payable owner;

    constructor () ERC20(faucetToken, FCt){
        owner = payable(msg.sender);
        _mint(owner, 500000 * (10 ** decimals()))
}
}