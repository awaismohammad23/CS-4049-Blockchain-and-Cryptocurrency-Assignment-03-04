const OPC = artifacts.require("./OrderProcessingContract.sol");
const menu = artifacts.require("menuManagement");
const discAPro = artifacts.require("discountsAndPromotions");
const AC = artifacts.require("AccessControl");
module.exports = function(deployer){
    deployer.deploy(OPC,menu.address,discAPro.address,AC.address);
}