// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es una versión optimizada del contrato ReEntrancyVulnerable
// que elimina la operación de retiro que realiza.

contract ReEntrancyOptimized {
    mapping(address => uint256) public balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "Not enough balance");

        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");

        balance[msg.sender] -= _amount;
    }
    // end contract ReEntrancyOptimized
}
