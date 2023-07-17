// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Demo{
    address payable user = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    function payEther() public payable {
        //payable mean that we want to send money to that address.
    }

    function getBalence() public view returns(uint){
        return address(this).balance;
    }

    function sendEtherAccount() public{
        user.transfer(1 ether);
    }
}
