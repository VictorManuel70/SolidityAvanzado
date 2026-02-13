// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomnessVulnerable {
    uint256 private seed;
    uint256 public randomNumber;

    constructor() {
        seed = block.timestamp;
    }

    function generateRandomNumber() public {
        randomNumber = uint256(
            keccak256(abi.encodePacked(block.prevrandao, block.timestamp, seed))
        );
    }

    // end contract RandomnessVulnerable
}
