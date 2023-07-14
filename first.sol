// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Hello{
    string name;
    uint age;
     
    constructor() {
        name = "Ravi";
        age = 2;
    }

    function abc() public pure {
        uint t;
        t = 2;
        t = 3;
    }
    
    function getName() view public returns(string memory){
        return name;
    } 

    function getAge() view public returns(uint){
        return age;
    }

    function setAge() public {
        age = age + 1;
    }
}