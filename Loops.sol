// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Loops {
    uint [5] public arr;
    //Loops can not be written outside the function.
    function Loop() public {
        uint i = 0;
        //while
        while(i < arr.length){
            arr[i] = i;
            i++;
        }
        //for
        for(i = 0 ; i < arr.length;i++){
            arr[i] += i;
        }
        //do while same as c++
        i = 0;
        do{
            arr[i] += i;
            i++;
        }while(i < arr.length);
    } 
}