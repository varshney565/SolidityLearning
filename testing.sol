// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    //fixed size array
    uint [4] public  arr = [1,2,3,4];
    string t = "shivam";
    function go() view public returns(uint){
        // calculate the length of the string 
        string memory s = t;
        bytes memory t = bytes(s);
        return t.length;
    }
} 