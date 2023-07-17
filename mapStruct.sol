// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract map{
    struct Student{
        string name;
        uint class;
    }
    mapping(int=>Student) public myMap;
    function setter(int roll,string memory name,uint class) public{
        myMap[roll] = Student(name,class);
    }
}