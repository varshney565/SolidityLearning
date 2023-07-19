// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyTOken{
    address public owner;
    string public name = "tt";
    uint private totalTokensGenerated = 0;
    mapping(address=>uint) Balance;

    constructor(){
        owner = msg.sender;
    }

    //event which will be triggred in case of any error in the transaction.
    event TransactionError(string message);

    //logic to Minting tokens
    function LogicforMinting(uint amount) private pure returns(uint){
        uint tokens = amount*500000;
        return tokens;
    }

    //Minting the tokens
    function MintTokens() public payable{
        uint amount = msg.value;
        uint tokens = LogicforMinting(amount);
        Balance[msg.sender] += tokens;
        totalTokensGenerated += tokens;
    }

    //logic for burning the tokens
    function LogicforBurning(uint tokens) private pure returns(uint){
        uint ethers = tokens/500000;
        return ethers;
    }
    // Burn Tokens
    function BurnTokens(uint tokens,address whom) public returns(bool){
        if(owner != msg.sender){
            emit TransactionError("Not autherized");
            return false;
        }

        if(tokens > Balance[whom]){
            emit TransactionError("insufficient balence");
            return false;
        }
        
        uint ethers = LogicforBurning(tokens);
        Balance[whom] -= tokens;
        totalTokensGenerated -= tokens;
        address payable user = payable(whom);
        user.transfer(ethers);
        return true;
    }
    // function Pay
    function payTokens(address to,uint amount) public returns(bool){
        address sender = msg.sender;
        if(Balance[sender] < amount) {
            emit TransactionError("insufficient balence");
            return false;
        }

        Balance[sender] -= amount;
        Balance[to] += amount;
        return true;
    }

    //find the balence
    function Balence() public view returns(uint){
        return Balance[msg.sender];
    }
}