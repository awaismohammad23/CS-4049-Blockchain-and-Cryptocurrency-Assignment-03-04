const menuManagement = artifacts.require("./menuManagement.sol");

module.exports = function(deployer){
    deployer.deploy(menuManagement);
}