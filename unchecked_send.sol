// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncheckedSend {
    mapping(address => uint256) public balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "Not enough balance");

        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");

        // Usando send, no es seguro porque no verifica si la transferencia fue exitosa
        // require(payable(msg.sender).send(_amount), "Transfer failed");

        balance[msg.sender] -= _amount;
    }
    // end contract UncheckedSend
}
