// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";


error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant minimumUsd = 5e18; //5 usd
    address[] funders;
    mapping(address funder => uint256 amountFunded) public amountEachFunderGave;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() > minimumUsd, "Unsufficient amount");
        funders.push(msg.sender);
        amountEachFunderGave[msg.sender] += msg.value;
    }


    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            amountEachFunderGave[funder] = 0;
        }
        funders = new address[](0);

        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    modifier onlyOwner() {
        if(msg.sender != owner){revert NotOwner();}
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}