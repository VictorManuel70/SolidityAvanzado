// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es una versión optimizada del contrato DenialServiceVulnerable
// que elimina la operación costosa que realiza.

contract DenialServiceOptimizado {
    uint256 constant MAX_ITERATIONS = 100;

    function performDos(uint256 _interations) public pure {
        require(_interations <= MAX_ITERATIONS, "Demasiadas iteraciones");
        for (uint256 i = 0; i < _interations; i++) {
            uint256[] memory data = new uint256[](_interations);

            for (uint256 j = 0; j < _interations; j++) {
                data[j] = j;
            }
        }
    }

    // end of the contract DenialServiceOptimizado
}
