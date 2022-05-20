// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

///@dev declared outside of the contract
///@notice this is optional. Structs are often declared inside of the contract itself as well
struct Planet {
    uint age;
    string name;
    address addr;
}

contract Universe {
    Planet public universePlanet;

    ///@notice don't need to end enums with a ;
    enum State {Inhabited, Uninhabited, Unknown}
    State public universeState;

    constructor(uint _age, string memory _name) {
        universePlanet.age = _age;
        universePlanet.name = _name;
        universePlanet.addr = msg.sender;
    }

    function changePlanet(uint _age, string memory _name, address _addr) public {
        ///@notice enum conditional statement
        if(universeState == State.Inhabited) {
            ///@notice syntax for creating a new struct
            Planet memory newPlanet = Planet({
                age: _age,
                name: _name,
                addr: _addr
            });
            universePlanet = newPlanet;
        }
    }
    
}

contract Galaxy {
    Planet public galaxyPlanet;
}