//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
 
contract FundMe{

    function fund() public payable{
         require(msg.value > 1e18, "Didn't send enough!");
    }

}