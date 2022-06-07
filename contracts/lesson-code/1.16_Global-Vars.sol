// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract GlobalVariables {

    address public owner;
    uint public thisMoment;
    uint public blockNumber;
    uint public difficulty;
    uint public gasLimit;
    
    constructor() {
        owner = msg.sender;
        thisMoment = block.timestamp;
        blockNumber = block.number;
        difficulty = block.difficulty;
        gasLimit = block.gaslimit;
    }

    function changeOwner () public {
        require (msg.sender == owner, "not owner");
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