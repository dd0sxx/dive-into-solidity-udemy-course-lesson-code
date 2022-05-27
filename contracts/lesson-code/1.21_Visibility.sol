//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.13;

contract A {

    int public x = 10; //will create a getter function on the contract interface that can be called by EOAs, other contracts, etc
    int y = 20; //can be accessed via getter only inside of this function or functions that inherit this contract

    function f1 () private view returns (int) {
        return y;
    }

    function f2 () public view returns (int) {
        int a = f1();
        return a;
    }

    function f3 () internal view returns (int) {
        return x;
    }

    function f4 () external view returns (int) {
        return x * y;
    }

}

contract B is A {

    int public xx = f3();
    // int public yy = f1(); f1 is private and cannot be called from derived contracts
    int public yy = f2(); // this works since f2 is public, and can access f1 from within the A contract
    // int public xy = f4(); this will fail since f4 is external, and cannot be called within the contract it is defined in or any inheriting contracts
}