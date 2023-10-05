// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CounterContract {
    address owner;

    struct Counter {
        uint number;
        string description;
    }

    Counter counter;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }

    constructor(uint initial_number, string memory initial_description) {
        owner = msg.sender;
        counter = Counter(initial_number, initial_description);
    }

    function increment() external onlyOwner {
        counter.number += 1;
    }

    function decrement() external onlyOwner {
        counter.number -= 1;
    }

    function getDescription() external view returns (string memory) {
        return counter.description;
    }

    function setDescription(string calldata newDescription) external onlyOwner {
        counter.description = newDescription;
    }

    function current() external view returns (uint) {
        return counter.number;
    }
}
