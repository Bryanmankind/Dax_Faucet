// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface  IERC20 {
        function transfer (address to, uint256 amount) external view returns (bool);
        function balanceOf (address _acount) external view returns (uint256);
    }

contract DaxFaucet {

    address payable  owner;
    IERC20 public  token;

    uint256 public withDrawAmount = 50 * (10 ** 18);

    mapping (address => uint256) public usersWithdrawTime;

    event deposit (address indexed sender, uint256 _amount);

    constructor (address _tokenAddress){
        token = IERC20(_tokenAddress);
       owner = payable (msg.sender);
    }

    function depositFaucet (uint256 _amount) public payable {
        require(msg.value > 0, "Invalid amount");
        emit  deposit(msg.sender, _amount);
    }

    function faucetBalance () public view returns (uint256) {
        return address(this).balance;
    }

    function faucetWithDrawTime (address _address) public view returns (bool) {
        return usersWithdrawTime[_address] + 1 minutes < block.timestamp;
    }

    function withDrawFaucet () public {

        token.transfer(msg.sender, withDrawAmount);

        require(faucetWithDrawTime(msg.sender), "You can only withdraw in 24 hours");

        usersWithdrawTime[msg.sender] = block.timestamp;

        (bool success, ) = msg.sender.call{value: 1 ether}("");
        require(success, "Transfer failed.");
    }

}