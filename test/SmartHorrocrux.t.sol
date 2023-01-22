// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/SmartHorrocrux.sol";

contract SmartHorrocruxTest is Test {
    SmartHorrocrux smartContract;

    address owner = makeAddr("OWNER");

    function setUp() external {
        vm.deal(owner, 2 wei);
        vm.prank(owner);
        smartContract = new SmartHorrocrux{value: 2 ether}();
    }

    function test_Exploit() external {
        smartContract.whatFunction();
    }
}