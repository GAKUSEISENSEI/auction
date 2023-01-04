// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Auction {
    address public owner;
    uint constant duration = 2 days;
    uint constant fee = 10;
    struct Parametrs{
        address payable seller;
        uint startPrice;
        uint finalPrice;
        uint startAt;
        uint discountRate;
        string item;
        bool stopped;
    }
     Parametrs[] public auctions;

    event AuctionCreated(uint index, string itemName, uint startPrice, uint duration);
    constructor {
        owner = msg.sender;
    }


    modifier onlyOwner {
        require(msg.sender == owner, "go away!")   
    }

    function withdrawAll() external payable () {

    
        
    }
    function createAuction(uint _startPrice, uint _discountRate, string calldata _item, uint _duration) external {
        uint duration = _duration == 0 ? duration : _duration;

        require(_startPrice >= _descountRate * duration, "incorrect start price");

        Auction memory newAuction = Auction({
            seller: payable(msg.sender),
            startPrice: _startPrice, 
            finalPrice: _startPrice, 
            discountRate: _discountRate,
            startAt: block.timestamp,
            endsAt: block.timestamp + duration,
            item: _item,
            stopped: false
        });

        auctions.push(newAuction);

        emit AuctionCreated(auctions.length - 1, _items, _startPrice, duration)
    }
    function getPriceFor(uint index) public view  returns (uint) {
        Auction memory cAuction = auctions[index];
        require(!cAuction.stopped, "stopped!");
        uint elapsed = block.timestamp - cAuction.startAt;
        uint discount = cAuction.discountRate * elapsed;
        return cAuction.startingPrice - discount;       
    }


    function buy(uint index) external payable{
        Auction memory cAuction = auctions[index];
        
    }
}