// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

enum month {
    jan,feb,march,april,may,june,july,aug,sept,oct,nov,dec
}

contract Demo{
    month public currentMonth = month.july;

    function sayIt() public view returns(string memory){
        if(currentMonth == month.feb){
            return "yes it is lovers day";
        }
        return "back to work";
    }

    function changeMonth(month changed_month) public{
        currentMonth = changed_month;
    }
}