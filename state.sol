// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract demo{
    function getter() public view returns(uint,uint,address){
        return (block.number,block.timestamp,msg.sender);
    }
}