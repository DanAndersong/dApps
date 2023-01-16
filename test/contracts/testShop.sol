// SPDX-License-Identifier: MIT
//0xd9145CCE52D386f254917e481eB44e9943F39138
pragma solidity ^0.8.17;

contract testShop {
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}