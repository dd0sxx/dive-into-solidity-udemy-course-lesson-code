// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Auction {

    mapping (address => uint) public bids;

    function bid() payable public {
        ///@dev msg.sender = address that calls this function
        ///@dev msg.value = amount of ether sent from msg.sender to this function call
        ///@notice addding a key value pair to the mapping
        bids[msg.sender] = msg.value;
    }

}