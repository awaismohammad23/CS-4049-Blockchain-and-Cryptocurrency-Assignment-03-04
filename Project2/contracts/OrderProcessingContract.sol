//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
import "./menuManagement.sol";
import "./discountsAndPromotions.sol";
contract OrderProcessingContract{
    menuManagement public mn;
    discountsAndPromotions public discAPro;

    function setmenuanddiscountsandpromotions(address _addrmenu , address _addrdiscandpro)public{
        mn=menuManagement(_addrmenu);
        discAPro=discountsAndPromotions(_addrdiscandpro);
    }

    function CheckinAvailability()public view returns(bool){
        return mn.CheckAvailability("Pizza");
    }

    function getMenuItems() public view returns(string [] memory , uint [] memory, uint [] memory){
        string [] memory names = mn.getItemNames();
        uint [] memory price = mn.getMenuPrice();
        uint [] memory quantity = mn.getMenuQuantity();
        return (names , price , quantity);
    }

    function CalculateOrderAmount(string [] memory itemnames , uint [] memory quantities) external returns(uint){
        uint totalAmount;
        string [] memory names = mn.getItemNames();
        uint [] memory price = mn.getMenuPrice();
        uint [] memory quantity = mn.getMenuQuantity();
        uint j = 0;
        for (uint i = 0 ; i < names.length ; i++){
            if (keccak256(abi.encodePacked(names[i])) == keccak256(abi.encodePacked(itemnames[j]))) {
                    string memory nm;
                    uint typs; uint qt ; uint prcper ; uint dur;
                    (nm , typs , qt , prcper , dur) = discAPro.PromotionsandDiscounts(names[i]);
                    if (typs == 1){
                        mn.setQuantity(quantity[i] - quantities[j] - quantities[j]/qt, i);
                        totalAmount += quantities[j] * price[i];
                    } else if (typs == 2) {
                        mn.setQuantity(quantity[i] - quantities[j] - quantities[j]/qt, i);
                        totalAmount += quantities[j] * (prcper / 100 * price[i]);
                    }
                    j++;
            }
        }
        return totalAmount;
    }
}