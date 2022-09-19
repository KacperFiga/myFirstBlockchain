//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    
    People public person = People({favoriteNumber:47, name:"Kacper"});

    function setFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }
}
