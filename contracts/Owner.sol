//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Ownable {
    address public owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor(address _owner) {
        console.log("Deploying a Ownable with owner:", _owner);
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "It's not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        address previousOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(previousOwner, newOwner);
    }
}
