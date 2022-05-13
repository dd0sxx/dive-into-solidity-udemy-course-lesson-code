// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Space {

    ///@notice we declare price as type "uint256"
    uint256 public price = 100;

    ///@notice we use the constant keyword
    ///@dev best practices are to name constant variables in all caps with underscores
    string public constant TYPE = "outer";

    ///@dev this is not permitted in Solidity:
    // price = 100;

    function setPrice (uint256 _price) public {
        price = _price;
    }

}