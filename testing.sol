// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract yes{
    uint t = block.timestamp;
    function sample() public view returns(uint){
        return t;
    }
}