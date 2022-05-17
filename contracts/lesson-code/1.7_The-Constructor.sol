// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Space {

    uint256 public price;
    string public constant LOCATION = "outer";
    address public immutable owner;

    constructor (uint256 _price) {
        price = _price;
        owner = msg.sender;
    }

    function setPrice (uint256 _price) public {
        price = _price;
    }

}