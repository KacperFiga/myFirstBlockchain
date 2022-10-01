//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
 
contract FundMe{

    uint256 minimumUSD = 50;

    function fund() public payable{
         require(msg.value > minimumUSD, "Didn't send enough!");
    }

}