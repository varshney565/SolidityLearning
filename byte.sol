// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    //fixed size arrray
    bytes3 public c = "ABC"; //3 bytes array
    bytes2 public b; //2 bytes array

    //NOTE : byte arrays are immutable.
    //dynamic size array
    bytes public a = new bytes(6);
    constructor(){
        a = "abcdef";
    }
}