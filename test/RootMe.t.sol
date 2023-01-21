// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/RootMe.sol";

contract RootMeTest is Test {
    RootMe root;

    address admin = makeAddr("ADMIN");
    address hacker = makeAddr("HACKER");

    function setUp() external {
        vm.prank(admin);
        root = new RootMe();
    }

    function test_CheckRegisteredUserName() external {
        assertEq(root.usernames("ROOT"), true);
    }

    function test_RegisterHacker() external {
        vm.startPrank(hacker);
        root.register("ROO", "TROOT");
        root.write(
            0x0000000000000000000000000000000000000000000000000000000000000000, 
            0x0000000000000000000000000000000000000000000000000000000000000001
        );
        assertEq(root.victory(), true);
        vm.stopPrank();
    }
}