// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackOptimized {
    mapping(address => uint256) public balance;

    fallback() external payable {
        revert("Fallback function not implemented");
    }

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amount = balance[msg.sender];
        require(amount > 0, "No balance to withdraw");
        balance[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    receive() external payable {}
    // end contract FallbackOptimized
}
