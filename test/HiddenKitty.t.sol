// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/HiddenKitty.sol";

contract HiddenKittyCatTest is Test {
    // the identifiers of the forks
    uint256 polygonFork;

    //Access variables from .env file via vm.envString("varname")
    //Replace ALCHEMY_KEY by your alchemy key or Etherscan key, change RPC url if need
    //inside your .env file e.g:
    string POLYGON_RPC_URL = vm.envString("POLYGON_RPC_URL");

    // HiddenKittyCat hiddenKittyCat;
    House house;

    address hacker = makeAddr("HACKER");

    function setUp() external {
        polygonFork = vm.createSelectFork(POLYGON_RPC_URL);
        // hiddenKittyCat = new HiddenKittyCat();
        house = new House();
    }

    function test_Exploit() external {
        bytes32 slot = keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 69)));

        house.isKittyCatHere(slot);
        assertEq(house.catFound(), true);
    }
}