// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract BytesAndStrings {

///@dev 0x616263
bytes public b1 = 'abc';
///@dev abc
string public s1 = 'abc';

function addElement () public {
    ///@dev result would be 0x61626378
    b1.push('x');
    // s1.push('x'); would revert as push is not a member of the string type
}

function getElement (uint i) public view returns (bytes1) {
    return b1[i];
    // return s1[i] would fail because index access for strings is not possible
}

function getLength () public view returns (uint) {
    return b1.length;
    // return s1.length would trigger an error as length is not a member of the string type
}

}