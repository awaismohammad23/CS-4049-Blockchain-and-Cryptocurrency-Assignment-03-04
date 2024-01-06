//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
contract rewardsAndLoyalty {
    uint [] public sentamount = [10 , 50 , 100 , 200 , 250 , 500 , 750 , 1000 , 1500 , 2000 , 3000 , 5000 , 7500 , 10000];
    uint [] public reward = [3 , 5 , 10 , 15 , 20 , 30 , 40 , 70 , 150 , 180 , 220 , 350 , 500 , 800];
    uint [] public buydaysstreak = [3 , 5 , 10 , 30 , 60 , 90 , 180 , 365];
    uint [] public rewardforbuydays = [1 , 2 , 3 , 10 , 30 , 50 , 70 , 100];
    function getreward() public view returns(uint[] memory){
        return reward;
    }
    function getsentamount() public view returns(uint[] memory){
        return sentamount;
    }
    function getbuydaysstreak() public view returns(uint[] memory){
        return buydaysstreak;
    }
    function getrewardforbuydays() public view returns(uint[] memory){
        return rewardforbuydays;
    }
}