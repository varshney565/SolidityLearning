// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract payment{
    address payable [2] users = [payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4),payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db)];
    event Transfer(address _from,uint value);
    
    receive() payable external{
        uint share = msg.value/2;
        for(uint i = 0 ; i < 2 ; i++){
            users[i].transfer(share);
        }
        emit Transfer(msg.sender,msg.value);
    }
}