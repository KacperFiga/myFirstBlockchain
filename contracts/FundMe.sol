//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "./PriceConventer.sol";

contract FundMe {
    using PriceConventer for uint256;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmmountFunded;

    function fund() public payable {
        require(
            msg.value.getConversionRate() > MINIMUM_USD,
            "Didn't send enough!"
        );
        funders.push(msg.sender);
        addressToAmmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);
        // transfer currency
        //1st way - transfer
        // payable(msg.sender).transfer(address(this).balance);
        //2nd way - send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "send failed");
        //3th way - call
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "send failed");
    }

    modifier onlyOwner() {
        require(i_owner == msg.sender, "You can withdraw only your deposit!");
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
