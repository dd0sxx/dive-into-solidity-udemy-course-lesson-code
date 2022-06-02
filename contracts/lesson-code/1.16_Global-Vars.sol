// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract GlobalVariables {

    address public owner;
    uint public thisMoment = block.timestamp;
    uint public blockNumber = block.number;
    uint public difficulty = block.difficulty;
    uint public gasLimit = block.gaslimit;
    
    constructor() {
        owner = msg.sender;
    }

    function changeOwner () public {
        owner = msg.sender;
    }

    function getBalance () public view returns (uint) {
        return address(this).balance;
    }

    receive () external payable {

    }

    function howMuchGas () public view returns (uint) {
        uint start = gasleft();
        uint j = 1;
        for(uint i = 1; i <20; i++) {
            j *=1;
        }
        uint end = gasleft();
        return start - end;
    }

}