//SPDX-License-Identifier:MIT
pragma solidity >=0.8.10 <0.8.20;
import "./rewardsAndLoyalty.sol";
interface ERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address from, address to, uint256 value);
    event Approval(address owner, address spender, uint256 value);
}

contract FASTCOIN is ERC20 {
    uint numTokens;
    mapping(address=>uint) balance;
    mapping(address=>uint) paymenttime;
    mapping(address=> mapping(address=>uint)) approvalLimit;
    mapping(address=>uint)daystreak;
    rewardsAndLoyalty public RAL;
    constructor (uint _numTokens) {
        numTokens = _numTokens;
        balance[msg.sender] = numTokens;
    }


    function totalSupply() external view returns (uint256){
        return numTokens;
    }

    function balanceOf(address account) external view returns (uint256){
        return balance[account];
    }

    function transfer(address recipient, uint256 amount) external returns (bool){
        require (balance[msg.sender] >= amount) ;
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
    }

    function approve(address spender, uint256 value) external returns (bool){
        require (balance[msg.sender] >= value);
        approvalLimit[msg.sender][spender] = value;
    }

    function allowance(address owner, address spender) external view returns
    (uint256){
        return approvalLimit[owner][spender];
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns
    (bool){
        require (amount <= balance[sender]);
        require (amount <= approvalLimit[sender][msg.sender]);
        paymenttime[sender]=(block.timestamp - paymenttime[sender]) ;
        if (paymenttime[sender] > 24 hours){
            daystreak[sender]=0;
        } else {
            uint [] memory stamt = RAL.getsentamount();
            uint [] memory rwd = RAL.getreward();
            uint [] memory bdystk = RAL.getbuydaysstreak();
            uint [] memory rwdbdystk = RAL.getrewardforbuydays();
            for (uint i = 0 ; i < stamt.length ; i++){
                if (amount > stamt[i]){
                    balance[sender]+=rwd[i];
                    break;
                }
            }

            for (uint i = 0 ; i < bdystk.length ; i++){
                if (daystreak[sender] > bdystk[i]){
                    balance[sender]+=rwdbdystk[i];
                    break;
                }
            }
        }
        balance[sender] -= amount;
        balance[recipient] += amount;
        approvalLimit[sender][msg.sender] -= amount;
        paymenttime[sender]=block.timestamp;
        daystreak[sender]+=1;
    }

}