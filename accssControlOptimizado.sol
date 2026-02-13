// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureAccessControl {
    uint256 private secretNumber;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setSecretNumber(uint256 _secretNumber) public onlyOwner {
        secretNumber = _secretNumber;
    }

    function getSecretNumber() public view returns (uint256) {
        return secretNumber;
    }
    // end contract AccessControlOptimized
}
