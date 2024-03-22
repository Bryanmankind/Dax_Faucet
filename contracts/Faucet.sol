// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DaxFaucet {

    address public owner;

    mapping (address => uint256) public usersWithdrawAdd;

    event deposit (address indexed sender, uint256 amount);

    constructor () {
       owner = msg.sender;
    }

    function depositFaucet (uint256 _amount) public payable {
        require(msg.value > 0, "Invalid Amount");

        emit deposit(msg.sender, _amount);
    }

    function faucetBalance () public view returns (uint256) {
        return address(this).balance;
    }

    function withDrawFaucet () public payable {
        require(msg.value > 0.01 ether, "You must have more then 0.01 ether in your wallet");
        emit transfer(address(this), msg.sender, 0.01 ether);
    }

}