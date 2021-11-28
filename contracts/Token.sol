pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20("Sigma Software Token", "SST") {
    constructor() {
        _mint(address(this), 1000 ether);
    }
}
