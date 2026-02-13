// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es vulnerable a ataques de re-entrancy
// debido a la operación de retiro que realiza.
// Un atacante podría desplegar este contrato y llamar a la función withdraw()
// para retirar más fondos de los que tiene.

contract ReEntrancyVulnerable {
    mapping(address => uint256) public balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(_amount <= balance[msg.sender], "Not enough balance");

        // Vulnerable to re-entrancy attack
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");

        balance[msg.sender] -= _amount;
    }
    // end contract ReEntrancyVulnerable
}
