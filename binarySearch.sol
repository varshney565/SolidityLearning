// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract BS {
    int [10] private arr = [-1,2,3,4,5,6,7,8,9,10]; 
    function BiSe(int target,uint s,uint e) private view returns(bool){
        if(s > e) return false;
        if(s == e) return target == arr[s]; 
        uint mid = s+(e-s)/2;
        if(arr[mid] < target){
            return BiSe(target,mid+1,e);
        }else if(arr[mid] > target){
            return BiSe(target,s,mid-1);
        }else{
            return true;
        }
    }

    function BiS(int target) public view returns(bool){
        return BiSe(target,0,arr.length-1);
    }
}