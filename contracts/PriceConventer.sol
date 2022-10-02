//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@chainlink/contracts/src/v0.8/interfaces/aggregatorv3interface.sol";


library PriceConventer{

    function getPrice() internal view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);

    }

    function getConversionRate(uint256 _ethAmount) view internal returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 amountInUSD = (ethPrice*_ethAmount) / 1e18;
        return amountInUSD;
    }

    function getVersion() internal view returns(uint256){ 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }
}
