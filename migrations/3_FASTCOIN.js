const FASTCOIN = artifacts.require("FASTCOIN");
const AC = artifacts.require("AccessControl");
module.exports = function(deployer){
    const initialoffering = 1000000;
    deployer.deploy(FASTCOIN , initialoffering , AC.address);
}