//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.13;

contract EventsAndErrors {

    event Transfer (address from, address to, uint value, bool success, bytes indexed data);

    error InsufficientBalance(uint256 available, uint256 required);

    function sendEth (address to, uint value) public payable {
        require(msg.value == value, "not enough ETH");
        if (address(this).balance < value) {
            ///@dev we need to add the revert keyword to use the error
           revert InsufficientBalance(address(this).balance, value);
        }
        (bool success, bytes memory data) = to.call{value: value}("");
        
        ///@dev we need to add the emit keyword to use the event
        emit Transfer(msg.sender, to, value, success, data);
    }

    receive () external payable {

    }

}