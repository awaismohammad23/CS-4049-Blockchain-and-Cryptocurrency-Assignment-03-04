const DiscPro = artifacts.require("discountsAndPromotions");
const AC = artifacts.require("AccessControl");
const menu = artifacts.require("menuManagement");
module.exports=function(deployer){
    deployer.deploy(DiscPro,menu.address,AC.address);
}