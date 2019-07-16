var SuryToken = artifacts.require("./SuryToken.sol");

module.exports = function(deployer) {
    deployer.deploy(SuryToken, 1000000);
};