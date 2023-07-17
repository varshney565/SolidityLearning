// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract map{
    mapping(int=>string) public myMap;
    function setter(int key,string memory value) public{
        myMap[key] = value;
    }
    
}