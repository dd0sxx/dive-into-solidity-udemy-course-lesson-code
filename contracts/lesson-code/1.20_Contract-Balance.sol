// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Deposit {

    modifier onlyOwner {
        require(msg.sender == owner);
        _; 
    }

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    receive () external payable {
        
    }

    fallback () external payable {

    }

    function getBalance () public view returns (uint) {
        return address(this).balance;
    }

    function sendEther (address payable destination, uint amount) public onlyOwner returns (bool) {
        require(amount <= address(this).balance)
        ///@dev returns false on failure
        bool res = destination.send(amount);
        return res;
    }

    function transferEther (address payable destination, uint amount) onlyOwner public {
        require(amount <= address(this).balance)
        ///@dev reverts on failure
        destination.transfer(amount);
    }

    function callEther (address payable destination, uint amount) onlyOwner public {
        require(amount <= address(this).balance)
        ///@dev this call is dangerous and allows for reentrancy
        destination.call{value: amount}("");
    }
}