// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CarRegistry {
    constructor(){

    }

    struct Car {
        uint256 id;
        address owner;
    }

    mapping(uint256 => Car) public cars;

    event OwnershipTransferred(uint256 indexed carId, address indexed oldOwner, address indexed newOwner);

    function assignOwnership(uint256 carId, address ownerA, address ownerB) external {
        require(cars[carId].owner == ownerA, "Ownership verification failed");

        cars[carId].owner = ownerB;

        emit OwnershipTransferred(carId, ownerA, ownerB);
    }
}
