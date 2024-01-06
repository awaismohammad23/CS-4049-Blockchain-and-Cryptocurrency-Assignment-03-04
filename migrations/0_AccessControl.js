const AC = artifacts.require("AccessControl");

module.exports=function(deployer , network , accounts){
    const universityAdmin = accounts[0];
    deployer.deploy(AC , universityAdmin);
}