//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
 
import "./PriceConventer.sol";

contract FundMe{
    using PriceConventer for uint256;

    uint256 minimumUSD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmmountFunded;

    function fund() public payable{
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough!");
        funders.push(msg.sender);
        addressToAmmountFunded[msg.sender] = msg.value;
    }

}