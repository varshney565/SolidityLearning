// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Calculator {
    function addition(int a,int b) public pure returns(int){
        return a+b;
    }
    function subtraction(int a,int b) public pure returns(int){
        return a-b;
    }

    function multiplication(int a,int b) public pure returns(int){
        return a*b;
    }

    //and a and b should be positive
    function power(int a,int b) public pure returns(int){
        if(b == 0){
            return 1;
        }
        int smallAns = power(a,b/2);
        int ans = smallAns*smallAns;
        if(b%2 == 1){
            ans *= a;
        }
        return ans;
    }
}