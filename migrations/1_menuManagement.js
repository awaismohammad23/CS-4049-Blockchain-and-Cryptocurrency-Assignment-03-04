const menuManagement = artifacts.require("./menuManagement.sol");
const AC = artifacts.require("AccessControl");
module.exports = function(deployer){
    deployer.deploy(menuManagement,AC.address);
}