// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DaxFaucet {

    address public owner;

    mapping (address => uint256) public usersWithdrawTime;

    event deposit (address indexed sender, uint256 _amount);

    constructor () {
       owner = msg.sender;
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

    function withDrawFaucet () public payable {
        require(faucetWithDrawTime(msg.sender), "You can only withdraw in 24 hours");

        usersWithdrawTime[msg.sender] = block.timestamp;

        (bool success, ) = msg.sender.call{value: 1 ether}("");
        require(success, "Transfer failed.");
    }

}