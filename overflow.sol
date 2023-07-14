// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract local {
    uint8 public t = 255;
    function setter() public{
        //it will give error when overflow happen.
        t = t+1;
    }
}

