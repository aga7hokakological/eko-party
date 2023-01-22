// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Stonks.sol";

contract StonksTest is Test {
    Stonks stonks;
    address player = makeAddr("player");

    function setUp() external {
        stonks = new Stonks(player);
    }

    // function test_CheckStonksInAccount() external {
    //     uint256 tesla = stonks.balanceOf(player, 0);
    //     uint256 gme = stonks.balanceOf(player, 1);

    //     assertEq(tesla, 20);
    //     assertEq(gme, 1_000);
    // }

    // function test_TakeOutEverything() external {
    //     vm.startPrank(player);
    //     stonks.buyTSLA(1_000, 20);
    //     stonks.sellTSLA(41, 2_050);
    //     vm.stopPrank();

    //     uint256 tesla = stonks.balanceOf(player, 0);
    //     uint256 gme = stonks.balanceOf(player, 1);
    //     assertEq(tesla, 0);
    //     assertEq(gme, 2_050);
    // }
}