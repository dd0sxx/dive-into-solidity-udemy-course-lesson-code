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
}