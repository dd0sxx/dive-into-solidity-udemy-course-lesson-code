// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract DynamicArrays {
    
    uint[] public numbers;

    ///@notice returns length of numbers array
    function getLength () public view returns(uint) {
        return numbers.length;
    }

    ///@notice adds element to the end of numbers array
    function addElement (uint item) public {
        numbers.push(item);
    }

    ///@notice removes element from the end of numbers array
    function popElement () public {
        numbers.pop();
    }

    ///@notice equivalent to numbers[index] = 0
    function deleteElement (uint index) public {
        delete numbers[index];
    }

    ///@notice we can use the pure keyword since it doesn't write to the blockchain
    function memoryArray () public pure {
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 2;
        x[2] = 3;
    }

}