//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
import "./AccessControl.sol";
contract menuManagement{
    struct Item {
        string name;
        uint price; 
        uint quantity; 
        bool availability;
    }
    mapping (string => Item)public itms;
    string [] public names;
    uint [] public prices;
    uint [] public quantities;
    address public admin;
    AccessControl public AC;
    constructor(address _accesscontroladdr){
        admin = msg.sender;
        AC = AccessControl(_accesscontroladdr);
    }

    mapping(string => bool) itemExists;

    modifier exists(string memory name) {
        require(itemExists[name], "Item does not exist");
        _;
    }

    modifier onlyCafeStaffOrAdmin() {
        require(AC.isCafeStaff(msg.sender) || AC.isCafeAdmin(msg.sender), "Only cafe staff or admin can call this function");
        _;
    }

    function addItem(string memory name , uint price, uint qty) onlyCafeStaffOrAdmin public {
        require(price > 0, "Price cannot be 0");
        names.push(name);
        prices.push(price);
        quantities.push(qty);
        itms[name].name=name;
        itms[name].price=price;
        itms[name].quantity=qty;
        itms[name].availability=qty > 0;
        itemExists[name] = true;
    }

    function getItemNames() external view returns (string [] memory){
        return names;
    }

    function setQuantity(uint qty , uint i , string memory name) external{
        quantities[i]=qty;
        itms[name].quantity = qty;
        itms[name].availability = qty > 0;
    }

    function UpdatePrice(string memory name, uint price) public onlyCafeStaffOrAdmin exists(name) {
        require(price > 0, "Price cannot be 0");
        itms[name].price=price;
        for (uint i = 0 ; i < names.length ; i++){
            if (keccak256(abi.encodePacked(names[i]))==keccak256(abi.encodePacked(name))){
                prices[i]=price;
                break;
            }
        }
    }

    function CheckAvailability(string memory name) exists(name) public view returns (bool) {
        return itms[name].availability;
    }

    function getMenuPrice() public view returns(uint [] memory){
        return prices;
    }

    function getMenuQuantity() public view returns(uint [] memory){
        /*uint [] memory qty1 = new uint[](1000);
        for (uint i = 0 ; i < names.length ; i++){ 
            qty1[i] = itms[names[i]].quantity; 
        }*/
        return quantities;
    }
}