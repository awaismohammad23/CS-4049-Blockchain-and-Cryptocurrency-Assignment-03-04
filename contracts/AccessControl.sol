//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
contract AccessControl {
    address public universityAdmin;
    address [] public cafeAdmin; 
    mapping(address => bool) public isCafeAdmin;
    mapping(address => bool) public isCafeStaff;

    constructor(address _universityAdmin) {
        universityAdmin = _universityAdmin;
    }

    modifier onlyUniversityAdmin() {
        require(msg.sender == universityAdmin, "Only university admin can call this function.");
        _;
    }

    modifier onlyCafeAdmin() {
        require(isCafeAdmin[msg.sender], "Only cafe admin can call this function.");
        _;
    }

    function addCafeAdmin(address admin) public onlyUniversityAdmin {
        isCafeAdmin[admin] = true;
        cafeAdmin.push(admin);
    }

    function removeCafeAdmin(address admin) public onlyUniversityAdmin {
        isCafeAdmin[admin] = false;
        for  (uint i = 0 ; i < cafeAdmin.length ; i++){
            if (cafeAdmin[i]==admin){
                delete cafeAdmin[i];
                break;
            }
        }
    }

    function addCafeStaff(address staff) public onlyCafeAdmin {
        isCafeStaff[staff] = true;
    }

    function removeCafeStaff(address staff) public onlyCafeAdmin {
        isCafeStaff[staff] = false;
    }
}