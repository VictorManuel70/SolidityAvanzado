// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Este contrato es una versión optimizada del contrato CostlyOperationVulnerable
// que elimina la operación costosa que realiza.

contract CostlyOperationOptimized {
    uint256 constant MAX_INTERACTIONS = 1600;

    function performCostlyOperation() external pure returns (uint256 result) {
        result = sumNumbers(MAX_INTERACTIONS);
    }

    function sumNumbers(uint256 n) internal pure returns (uint256) {
        return (n * (n + 1)) / 2;
    }

    // end contract CostlyOperationOptimized
}
