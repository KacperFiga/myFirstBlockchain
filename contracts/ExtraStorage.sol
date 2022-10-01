//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }
}
