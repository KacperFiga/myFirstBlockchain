//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavNumber;

    People public person = People({favoriteNumber: 47, name: "Kacper"});

    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function setFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({
            favoriteNumber: _favoriteNumber,
            name: _name
        });

        people.push(newPerson);

        nameToFavNumber[_name] = _favoriteNumber;
    }

}
