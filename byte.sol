// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    //fixed size arrray
    bytes3 public c = "ABC"; //3 bytes array
    bytes2 public b; //2 bytes array

    //dynamic size array
    bytes public a = new bytes(6);
    bytes public d;
    constructor(){
        a = "abcdef";
    }

    function setter() public{
       d = "fsjdfjhfajhf";
       d[0] = 'm';
       a[0] = 'p';
    }
}