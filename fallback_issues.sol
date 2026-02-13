// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableFallback {
    mapping(address => uint256) private payments;

    fallback() external payable {
        payments[msg.sender] += msg.value;
        (bool success, ) = msg.sender.call{value: msg.value}("");
        require(success, "Withdrawal failed");
    }

    function withdraw() public {
        uint256 amount = payments[msg.sender];
        require(amount > 0, "No balance to withdraw");
        payments[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    receive() external payable {}
    // end contract VulnerableFallback
}
