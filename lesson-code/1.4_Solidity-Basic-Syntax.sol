// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/** 
@title Solidity Basic Syntax Lecture Contract
@author dd0sxx / macro
@notice This contract is only for educational purposes
@dev notice how this is a multi-line natspec comment
*/ 

contract Space {

    uint256 public price;

    /// @notice sets price variable equal to the value of _price
    function setPrice (uint256 _price) public {
        price = _price;
    }

}