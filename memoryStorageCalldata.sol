// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract local {
    string S = "fsdf";
    function doIt() public view returns(uint){

        //a) ---> STRING
        string memory s = "abc"; //by default string will be storage 
        //as abc is in memory and s is in storage so conflict.
        string storage t = S;   //both lhs and rhs are in storage so no conflict

        //we can store a variable of storage type in both memory and storage.

        //b) ---> BYTE ARRAY
        bytes memory b1 = new bytes(12); //right is in memory
        bytes storage b2 = bytes(t);     //as t is of storage type both memory and storage supported.
        bytes memory b3 = new bytes(23);

        //c) ---> ARRAY

        //uint[] memory a1 = [1,2,3]; //why it is giving error it is because [1,2,3] is in memory
        //also all are of type uint8 and we are specifing uint256 so to avoid it we can specify 
        //those elements on the next line itself.

        uint[5] memory a1;
        a1[0] = 1;
        a1[1] = 2;
        a1[2] = 3;
        a1[3] = 4;
        a1[4] = 5;
        return a1.length;
    }
}