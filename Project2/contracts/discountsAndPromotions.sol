//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
import "./menuManagement.sol";
contract discountsAndPromotions {
    menuManagement public mn;
    string [] names ;
    uint [] prices;
    uint [] quantities;
    function setMenu(address _addrmenu) public{
        mn=menuManagement(_addrmenu);
    }
    struct PromAndDisc {
        string name;
        uint types;
        uint quantity;
        uint pricepercentagededuction;
        uint duration;
    }
    mapping(string=> PromAndDisc) public PromotionsandDiscounts;

    //The Quantity here is the quantity 
    //after which the customer will be eligible for free meal.
    function AddBuyAndGetFreePromotion (string [] memory items , uint quantity , uint _duration) public {
        require(quantity > 0 && _duration > 0 , "Quantity or duration cannot be zero.");
        names = mn.getItemNames();
        prices = mn.getMenuPrice() ;
        quantities = mn.getMenuQuantity();//OPC.getMenuItems();//Tuples in solidity
        uint j = 0;
        for (uint i = 0 ; i < names.length ; i++){
            if (keccak256(abi.encodePacked(names[i])) == keccak256(abi.encodePacked(items[j]))){
                PromotionsandDiscounts[names[i]].quantity=quantity;
                PromotionsandDiscounts[names[i]].name=names[i];
                PromotionsandDiscounts[names[i]].types=1;
                PromotionsandDiscounts[names[i]].duration= block.timestamp + _duration;
                j++;
            }
        }
    }

    function AddSimpleDiscount(string [] memory items , uint percentage , uint _duration) public {
        require(percentage <= 90 , "Percentage cannot exceeed 90");
        names = mn.getItemNames();
        prices = mn.getMenuPrice() ;
        quantities = mn.getMenuQuantity();//OPC.getMenuItems();//Tuples in solidity
        uint j = 0;
        for (uint i = 0 ; i < names.length ; i++){
            if (keccak256(abi.encodePacked(names[i])) == keccak256(abi.encodePacked(items[j]))){
                PromotionsandDiscounts[names[i]].name=names[i];
                PromotionsandDiscounts[names[i]].types=2;
                PromotionsandDiscounts[names[i]].pricepercentagededuction=percentage;
                PromotionsandDiscounts[names[i]].duration= block.timestamp + _duration;
                j++;
            }
        }
    }
}