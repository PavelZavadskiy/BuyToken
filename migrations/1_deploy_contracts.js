require('dotenv').config();

const BN = require('bn.js');

let Exchange = artifacts.require("./Exchange.sol");

module.exports = async function (deployer) {
    await deployer.deploy(Exchange);
}