const OPC = artifacts.require("./OrderProcessingContract.sol");

module.exports = function(deployer){
    deployer.deploy(OPC);
}