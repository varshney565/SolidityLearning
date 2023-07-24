// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

struct Tenant{
    string name;
    uint JoiningTimestamp;
    uint aadharNumber;
    uint roomNumber;
    uint lastPayTimeStamp;
    string status;
}

contract Aggrement{
    uint capacity = 10;
    uint public totalRoomsAvailable = 10;
    address [] Rooms;
    bool [] public RoomsState;
    address payable owner;
    uint public depositFee;
    uint public monthlyFee;
    mapping(address=>Tenant) TenantDetails;
    address[] public Tenants;

    //Evene that will be triggered in case of any error.
    event Trigger(string);
    event sayThankYou(string);

    //create a function to assign a room to the Tenant
    constructor(){
        owner = payable(msg.sender);
        Rooms = new address[](totalRoomsAvailable);
        RoomsState = new bool[](totalRoomsAvailable);
        depositFee = 9000;
        monthlyFee = 9000;
    }

    //registration of user and this function is also responsible of taking the payments
    function Registration(string memory name,uint aadhar,uint roomNumber) payable public returns(bool){

        //check whether the entered room is within the range of available rooms
        if(roomNumber >= capacity){
            emit Trigger("No such room exists !");
            return false;
        }

        //check whether that room is present or not
        if(RoomsState[roomNumber]){
            emit Trigger("Room is already occupied");
            return false;
        }

        //check if that user has already occupied a room or not
        if(TenantDetails[msg.sender].aadharNumber > 0){
            emit Trigger("You already have one room,you can't take another room !");
            return false;
        }

        //make sure user has deposited the "deposit fee"
        uint payment = 0.0000065 ether * 9000;
        if(msg.value < payment){
            emit Trigger("insufficient balence to make the registration !");
            return false;
        }else if(msg.value > payment){
            //return the remaining amount to the sender
            uint ret = msg.value-payment;
            payable(msg.sender).transfer(ret);
        }

        //creating a new Tenant
        Tenant memory t;
        t.name = name;
        t.aadharNumber = aadhar;
        t.roomNumber = roomNumber;
        t.JoiningTimestamp = block.timestamp;
        t.lastPayTimeStamp = t.JoiningTimestamp;
        t.status = "JOINED";
        //creating mapping of the Tenant
        TenantDetails[msg.sender] = t;
        RoomsState[t.roomNumber] = true;
        Rooms[t.roomNumber] = msg.sender;
        Tenants.push(msg.sender);
        totalRoomsAvailable--;
        return true;
    }

    //Logic for calculating the money in rs.
    function Logic(address user) private view returns(uint){
        uint currentTime = block.timestamp;
        uint totalTime = currentTime-TenantDetails[user].lastPayTimeStamp;
        uint totalDays = totalTime/86400;
        uint toPay = (monthlyFee/30)*totalDays;
        return toPay;
    }

    //leaving the room
    function Leave() public returns(bool){

        // check whether that person is associated with any room or not.
        if(TenantDetails[msg.sender].aadharNumber == 0){
            emit Trigger("Sorry, You are not associated with any room here !");
            return false;
        }

        //make the payment of extra days he was in the pg and return the deposit fee to the user accordingly.
        uint moneyToPay = (depositFee-Logic(msg.sender))*0.0000065 ether;
        //now take the money from the landlord and pay it to the user
        address payable user = payable(msg.sender);
        user.transfer(moneyToPay);

        //updating rooms and that person's history.
        totalRoomsAvailable++;
        uint roomNumber = TenantDetails[msg.sender].roomNumber;
        Rooms[roomNumber] = address(0);
        RoomsState[roomNumber] = false;
        TenantDetails[msg.sender].status = "LEFT";
        TenantDetails[msg.sender].lastPayTimeStamp = block.timestamp;

        //removing that Tenant from the Tenant array
        uint found = Tenants.length;
        for(uint i = 0 ; i < Tenants.length ; i++){
            if(Tenants[i] == msg.sender){
                found = i;
                break;
            }
        }
        while(found < Tenants.length-1){
            Tenants[found] = Tenants[found+1];
            found++;
        }
        Tenants.pop();
        return true;
    }

    //checking whether there is any empty room or not and giving the list of all such rooms
    function availableRooms() public view returns(uint[] memory){
        uint[] memory available = new uint[](totalRoomsAvailable);
        uint l = 0;
        for(uint i = 0 ; i < RoomsState.length ; i++){
            if(!RoomsState[i]){
                available[l] = i;
                l++;
            }
        }
        return available;
    }

    //changing the rent
    function changeRent(uint amount) public returns(bool){
        if(msg.sender != owner){
            emit Trigger("Not autherized !");
            return false;
        }
        monthlyFee = amount;
        return true;
    }

    //changing the deposit fee
    function changeDeposite(uint amount) public returns(bool){
        if(msg.sender != owner){
            emit Trigger("Not autherized !");
            return false;
        }
        depositFee = amount;
        return true;
    }

    //creating any new room
    function creatingNewRoom() public returns(bool){
        capacity++;
        totalRoomsAvailable++;
        RoomsState.push(false);
        Rooms.push(address(0));
        return true;
    }

    //function that landlord will click for receiving the payments
    function TakeFare() public payable returns(bool){
        address payable user = payable(msg.sender);
        uint day = (block.timestamp-TenantDetails[user].lastPayTimeStamp)/86400;
        if(day < 30){
            emit Trigger("Month is not completed Yet !");
            //give him his payment back
            if(msg.value > 0)
                user.transfer(msg.value);
            return false;
        }

        //user has to pay this amount   
        uint amount = ((monthlyFee/30)*day)*0.0000065 ether;
        if(amount > msg.value){
            emit Trigger("Insufficient balence");
            return false;
        }else if(amount < msg.value){
            uint ret = msg.value-amount;
            user.transfer(ret);
        }

        //transfer this amount to the Landowner
        owner.transfer(amount);
        //update the tenant's history that he has paid his payment
        TenantDetails[user].lastPayTimeStamp = block.timestamp;
        return true;
    }
}