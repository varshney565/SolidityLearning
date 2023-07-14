// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    //fixed size array
    uint [4] public  arr = [1,2,3,4];

    //setter
    function setter(uint ind,uint val) public {
        arr[ind] = val;
    }

    //getter for the length of array
    function GetLength() public view returns(uint){
        return arr.length;
    }
}