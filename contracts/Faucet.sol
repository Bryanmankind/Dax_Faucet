// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface  IERC20 {
        function transfer (address to, uint256 amount) external view returns (bool);
        function balanceOf (address _acount) external view returns (uint256);
        event Transfer(address indexed from, address indexed  to, uint256 value);
    }

contract DaxFaucet {

    address payable  owner;
    IERC20 public  token;
    uint256 public lockTime = 1 minutes;

    uint256 public withDrawAmount = 50 * (10 ** 18);

    mapping (address => uint256) public usersWithdrawTime;

    event deposit (address indexed sender, uint256 indexed _amount);

    constructor (address _tokenAddress){
        token = IERC20(_tokenAddress);
       owner = payable (msg.sender);
    }

    receive() external payable {
        emit  deposit(msg.sender, msg.value);
    }

    function faucetBalance () external  view returns (uint256) {
        return  token.balanceOf(address(this));
    }


    function withDrawFaucet () public {
        require(msg.sender != address(0), "You need 0.001 ether in your wallet");
        require(token.balanceOf(address(this)) >= withDrawAmount, "Not enough faucet at the moment");
        require(block.timestamp >= usersWithdrawTime[msg.sender], "You can only withdraw in 24 hours");
        usersWithdrawTime[msg.sender] = block.timestamp + lockTime;


        token.transfer(msg.sender, withDrawAmount);
    }

    function reSetwithDrawAmount (uint256 _amount) private onlyOwner{
        withDrawAmount = _amount * (10 ** 18) ;
    }

    function reSetlockTime (uint256 _time) private onlyOwner {
        lockTime = _time * 1 minutes;
    }

    function withDraw () external view  onlyOwner {
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
    }

}