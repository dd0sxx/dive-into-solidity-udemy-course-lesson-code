pragma solidity ^0.8.13;

contract FixedSizeArrays {

    // default value: 0x00
    bytes1 public b1;
    // default value: 0x0000
    bytes2 public b2;
    // default value: 0x000000
    bytes3 public b3;
    //... up to bytes 32
    
    // intialized as [0, 0, 0]
    uint[3] public three_zeros;
    uint[3] public numbers = [2, 3, 4];

    function setElement (uint index, uint value) public {
        numbers[index] = value;
    }

    function getLength () public view returns (uint) {
        return numbers.length;
    }

    function setBytesArray() public {
        // 0x61
        b1 = 'a';
        // 0x6162
        b2 = 'ab';
        // 0x616263
        b3 = 'abc';
        // 0x7a0000, notice the padding
        b3 = 'z';
        
        // b3[0] = ‘a’; will not compile since you cannot edit single bytes in a bytes array

        //byte is an alias for bytes1 in solidity prior to version 0.8.0
    }
}