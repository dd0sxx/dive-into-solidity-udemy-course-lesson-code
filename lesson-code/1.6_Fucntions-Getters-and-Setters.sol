// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Space {

    ///@dev notice how the price variable is public. This will automatically create a getter function on the contract abi that cna be invoked to get the current value
    uint256 public price = 100;
    string public constant TYPE = "outer";

    ///@dev setPrice is a setter function. Notice how it changes the value of the price variable when it is invoked
    function setPrice (uint256 _price) public {
        price = _price;
    }

}