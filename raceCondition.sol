// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es vulnerable a ataques de race condition
// debido a la operación de retiro que realiza.
// Un atacante podría desplegar este contrato y llamar múltiples veces a la función withdraw()
// para retirar más fondos de los que tiene.

contract CarreraVulnerable {
    uint256 public balance;
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function withdraw(uint256 _cantidad) public {
        require(balances[msg.sender] > 0, "No hay fondos");

        uint256 saldoAnterior = balances[msg.sender];

        balances[msg.sender] -= _cantidad;

        (bool success, ) = payable(msg.sender).call{value: _cantidad}("");
        require(success, "Error al realizar la transferencia");

        require(
            balances[msg.sender] == saldoAnterior,
            "Race condition detectada"
        );
    }
}
