// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    uint [] public arr;

    //pushing the element

    function Insert(uint x) public{
        arr.push(x);
    }

    //get the length of the array

    function getLength() public view returns(uint){
        return arr.length;
    }

    //pop the element from the array
    function popELement() public {
        arr.pop();
    }
}