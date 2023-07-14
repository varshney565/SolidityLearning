// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    string s;
    int[] arr = new int[](10);
    /**

    for fixed size array or byte array(means we have declared it in stack) we don't need to 
    specify memory for that inside the function.
    but for dynamic size array we have to specify that keyword.

    **/
    function doIt() public view{
        //fixed size array
        /**
        bytes1 a = 0xac;
        uint x = 5;

        **/
        
        // bytes a = new bytes(23);
        int [4] memory t = [1,-2,3,4];
        // string t = s;
        // int[] memory arr = new int[](10);
        // int [] memory arr;
        // a[0];
    }
}