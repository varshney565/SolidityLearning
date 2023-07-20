// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract voting{
    address private owner;
    mapping(address=>uint) candidateVotes;
    mapping(address=>bool) candidateExist;
    mapping(address=>address) votes;
    mapping(address=>bool) voterExist;
    address[] candidates;
    //event to be triggred in case of any error
    event ErrorEvent(string);

    //set the owner of the voting contract
    constructor(){
        owner = msg.sender;
    }

    //Logic to check if a candidate is already present or not
    function checkCandidate(address cnd) private view returns(bool){
        if(candidateExist[cnd]){
            return true;
        }
        return false;
    }

    //update the array of candidates standing in the election.
    function InsertCandidate(address cnd) public returns(bool){
        if(msg.sender != owner){
            emit ErrorEvent("Not autherized");
            return false;
        }
        bool res = checkCandidate(cnd);
        if(res){
            emit ErrorEvent("Candidate already exists !");
            return false;
        }
        candidateVotes[cnd] = 0;
        candidateExist[cnd] = true;
        candidates.push(cnd);
        return true;
    }

    //Logic to check whether user has voted or not
    function checkVoted() private view returns(bool){
        if(voterExist[msg.sender]) {
            return true;
        }
        return false;
    }

    //voting function
    function vote(address cnt) public returns(bool){
        bool res = checkVoted();
        if(res){
            emit ErrorEvent("You have already voted !");
            return false;
        }
        voterExist[msg.sender] = true;
        votes[msg.sender] = cnt;
        candidateVotes[cnt]++;
        return true;
    }

    //result
    function result() public returns(address add,uint val){
        if(owner != msg.sender){
            emit ErrorEvent("Not autherized");
        }else{
            address winner;
            uint cnt = 0;
            for(uint i = 0 ; i < candidates.length ; i++){
                if(candidateVotes[candidates[i]] > cnt){
                    winner = candidates[i];
                    cnt = candidateVotes[winner];
                }
            }
            return (winner,cnt);
        }
    }
}