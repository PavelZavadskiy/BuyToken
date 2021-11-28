pragma solidity 0.8.10;

import "./Token.sol";

interface I_Agregator{
    function decimals() external view returns (uint8);
    function latestRoundData() external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract Exchange is Token {
    address agregator = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;    

    function getPrice() public view returns (uint256) {
        ( , int256 _price, , , ) = I_Agregator(agregator).latestRoundData();
        return uint256(_price);
    }

    function getPriceDecimals() public view returns (uint256) {
        return uint256(I_Agregator(agregator).decimals());
    }

    function buyTokens() public payable{
        uint256 _numberTokens = (msg.value * getPrice()) / (10**getPriceDecimals());
        if(balanceOf(address(this)) < _numberTokens)
        {
            (bool sent, bytes memory data) = msg.sender.call{value: msg.value}("Sorry, there is not enough tokens to buy");
            return;
        }
        _transfer(address(this), msg.sender, _numberTokens);
    }
}
