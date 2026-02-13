// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es una versión optimizada del contrato CarreraVulnerable
// que elimina la operación costosa que realiza.

contract CarreraOptimizado {
    uint256 public balance;
    mapping(address => uint256) public balances;
    mapping(address => bool) public isTransferring;

    function depositar() public payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(balances[msg.sender] >= _cantidad, "No hay fondos");
        require(
            !isTransferring[msg.sender],
            "Ya se esta realizando una transferencia"
        );

        isTransferring[msg.sender] = true;

        (bool success, ) = payable(msg.sender).call{value: _cantidad}("");
        require(success, "Error al realizar la transferencia");

        balances[msg.sender] -= _cantidad;

        isTransferring[msg.sender] = false;
    }
}
