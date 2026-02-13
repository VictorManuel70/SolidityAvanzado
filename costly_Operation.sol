// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es vulnerable a ataques de denegación de servicio (DoS)
// debido a la operación tan costosa que realiza.
// Un atacante podría desplegar este contrato y llamar a la función performCostlyOperation()
// para agotar el gas disponible en un bloque.

contract CostlyOperationVulnerable {
    uint256 constant MAX_INTERACTIONS = 1600;

    function performCostlyOperation() external pure returns (uint256 result) {
        result = 0;
        for (uint256 i = 0; i < MAX_INTERACTIONS; i++) {
            result += 1;
        }
        return result;
    }

    // end contract CostlyOperationVulnerable
}
