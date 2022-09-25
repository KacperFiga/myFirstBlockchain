//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;
import "./SimpleStorage.sol";

contract StorageFactory {
  
  SimpleStorage[] public simpleStorageArray;

  function createSimpleStorage() public {

    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
  }

  function sfStore(uint256 _simpleStorageNumber, uint256 _indexSimpleStorage) public {
    SimpleStorage simpleStorage = simpleStorageArray[_indexSimpleStorage];
    simpleStorage.store(_simpleStorageNumber);
  }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrive();
    }

}
