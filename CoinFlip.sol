// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//https://sepolia.etherscan.io/address/0x07502f6a30ddb8c4da168553ebe340243cbc09b4
contract CoinFlip{
    string Side = "Coin not flipped yet !";
    uint private secreatNumber = 37;
    //Logic for generating a random number
    function Logic() private view returns(uint){
        uint time = block.timestamp; 
        uint val = 0;
        while(time > 0){
            uint rem = time%10;
            val = val*secreatNumber+rem;
            time = time/10;
        }
        return val;
    }

    function FlipCoin() public{
        uint randomNumber = Logic();
        if(randomNumber%2 == 0) Side = "HEAD";
        else Side = "TAIL";
    }

    function SeeResult() public view returns(string memory){
        return Side;
    }
}