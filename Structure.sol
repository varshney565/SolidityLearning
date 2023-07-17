// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

struct Student{
    uint roll;
    string name;
}

contract Demo{
    Student public s1;
    constructor(uint _roll,string memory _name){
        s1.roll = _roll;
        s1.name = _name;
    }

    function change(uint _roll,string memory _name) public{
        // s1.roll = _roll;
        // s1.name = _name;

        Student memory newStudent = Student({
            roll : _roll,
            name : _name
        });
        s1 = newStudent;
    }
}