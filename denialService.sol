// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es vulnerable a ataques de denial of service
// debido a la operación de retiro que realiza.
// Un atacante podría desplegar este contrato y llamar múltiples veces a la función withdraw()
// para retirar más fondos de los que tiene.

contract DenialServiceVulnerable {
    function performDos(uint256 _interations) public pure {
        for (uint256 i = 0; i < _interations; i++) {
            uint256[] memory data = new uint256[](_interations);

            for (uint256 j = 0; j < _interations; j++) {
                data[j] = j;
            }
        }
    }

    // end of the contract DenialServiceVulnerable
}
