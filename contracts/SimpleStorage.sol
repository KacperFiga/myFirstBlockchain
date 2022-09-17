//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract SimpleStorage{
    uint256 public favoriteNumber;

    function setFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}