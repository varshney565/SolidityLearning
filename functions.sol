// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract local{
    uint age = 10;
    function getAge() public view returns(uint){
        return age;
    }
    function setAge(uint newage) public {
        age = newage;
    }
}