// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract SMC {

    string[] public planets = ['Jupiter', 'Neptune'];

    ///@notice this function will not update planets[0] = 'Mars'
    function f_memory () public {
        ///@dev this will copy the entire planets array into memory which increases in gas cost linearly with size
        string[] memory s1 = planets;
        s1[0] = 'Mars';
    }

    ///@notice this function will update planets[0] = 'Mars'
    function f_storage () public {
        string[] storage s1 = planets;
        s1[0] = 'Mars';
    }

    ///@notice this function will update planets[0] = s1[0]
    ///@dev calldata is read only, but it is cheaper than memory
    function f_calldata_param (string[] calldata s1) public {
        // s1[0] = 'Mars'; this would not work since s1 is calldata and read only
        planets[0] = s1[0];
    }

    ///@dev memory is cheaper than storage, unless the data is already in storage. In this case, this method is unoptimized
    function f_memory_param (string[] memory s1) public {
        s1[0] = 'Mars';
        planets[0] = s1[0];
    }

}