// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    function doIt() public pure{
        bytes memory a = new bytes(4);
        for(uint i = 0 ; i < 4 ; i++){
            a[i] = 's';
            //or a[i] = 0xff
        }
    }
}