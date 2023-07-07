// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

/**
 * @title A simple Raffle Contract
 * @author Kcpele
 */
contract Raffle {
    error Raffle__NotEnoughEthSent();
    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /** Events */
    event EnterRaffle(address indexed player);

    constructor(uint256 enntranceFee, uint256 interval) {
        i_entranceFee = enntranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnterRaffle(msg.sender);
    }

    //get a random number
    // use random number to pick a winner
    // be automatically called
    function pickWinner() public {
        //checl to see if there is enouch time passed
        if (block.timestamp - s_lastTimeStamp > i_interval) {
            revert();
        }
    }

    /** Getter function */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
