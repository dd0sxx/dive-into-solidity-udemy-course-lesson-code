// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Space {

    bool public sold;

    // uint8 initialized with the maximum value for the type
    uint8 public price = 255;
    int8 public location = -10;

    // the first call to f1() will return 0
    function f1 () public returns (uint8) {
        unchecked {
        price += 1;
        }
    }

    // will revert since solc version ^0.8.0 has built in overflow/underflow checks
    function f2 () public returns (uint8) {
        price += 1;
    }
}