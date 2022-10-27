// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Splitwise {

    struct IOweYou{

        address debtor;
        address creditor;
        uint32 amount;
        uint256 date;

    }

    IOweYou[] public listIOweYou;

    function getIOUsArray() public view returns (IOweYou[] memory){
        return listIOweYou;
    }


    function lookup(address debtor, address creditor) public view returns(uint32 ret){
        for (uint i = 0; i<listIOweYou.length ; i++){
            if (listIOweYou[i].debtor == debtor && listIOweYou[i].creditor == creditor){
                ret += listIOweYou[i].amount;
            }
        }
    }

    function add_IOU(address creditor, uint32 amount, uint256 date)public{

        IOweYou memory newIOweYou;
        newIOweYou.debtor = msg.sender;
        newIOweYou.creditor = creditor;
        newIOweYou.amount = amount;
        newIOweYou.date = date;
        listIOweYou.push(newIOweYou);
    }
}
