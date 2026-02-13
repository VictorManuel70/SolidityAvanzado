// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface RandonessOracle {
    function getRandomNumber() external returns (uint256);
}

contract RandomnessOptimized {
    uint256 public randomNumber;
    address public oracle;

    constructor(address _oracleAddress) {
        oracle = _oracleAddress;
    }

    function generateRandomNumber() public {
        require(oracle != address(0), "Oracle address not set");
        randomNumber = RandonessOracle(oracle).getRandomNumber();
    }

    // end contract RandomnessOptimized
}
