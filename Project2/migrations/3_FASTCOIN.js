const FASTCOIN = artifacts.require("FASTCOIN");

module.exports = function(deployer){
    const initialoffering = 1000000;
    deployer.deploy(FASTCOIN , initialoffering);
}