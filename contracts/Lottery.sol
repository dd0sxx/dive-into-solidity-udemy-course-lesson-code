//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
import "hardhat/console.sol";

contract Lottery {
    // declaring the state variables
    address[] public players; //dynamic array of type address payable
    address[] public gameWinners;
    address public owner;

    // declaring the constructor
    constructor() {
        // initializing the owner to the address that deploys the contract
        owner = msg.sender;
    }

    // declaring the receive() function that is necessary to receive ETH
    receive() external payable {
        // each player sends exactly 0.1 ETH
        require(msg.value == 0.1 ether);
        // appending the player to the players array
        players.push(msg.sender);
    }

    // returning the contract's balance in wei
    function getBalance() public view returns (uint256) {
        // only the owner is allowed to call it
        require(msg.sender == owner, "ONLY_OWNER");
        return address(this).balance;
    }

    // helper function that returns a big random integer
    // UNSAFE! Don't trust random numbers generated on-chain, they can be exploited! This method is used here for simplicity
    // See: https://solidity-by-example.org/hacks/randomness
    function random() internal view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }

    // selecting the winner
    function pickWinner() public {
        // only the owner can pick a winner if there are at least 3 players in the lottery
        require(msg.sender == owner, "ONLY_OWNER");
        require(players.length >= 3, "NOT_ENOUGH_PLAYERS");

        uint256 r = random();
        address winner;

        // computing an unsafe random index of the array
        uint256 index = r % players.length;

        winner = players[index]; // this is the winner
        gameWinners.push(winner);

        // transferring the entire contract's balance to the winner
        (bool success, ) = winner.call{value: getBalance()}("");
        require(success, "TRANSFER_FAILED");

        // resetting the lottery for the next round
        delete players;
    }
}
