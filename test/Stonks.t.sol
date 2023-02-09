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

    function test_CheckStonksInAccount() external {
        uint256 tesla = stonks.balanceOf(player, 0);
        uint256 gme = stonks.balanceOf(player, 1);

        assertEq(tesla, 20);
        assertEq(gme, 1_000);
    }

    function test_TakeOutEverything() external {
        vm.startPrank(player);
        stonks.sellTSLA(20, 1_000);
        for(uint256 i; i < 50;) {
            stonks.buyTSLA(40, 0);
            unchecked {
                i++;
            }
        }
        vm.stopPrank();

        uint256 tesla = stonks.balanceOf(player, 0);
        uint256 gme = stonks.balanceOf(player, 1);
        console.log(tesla);
        assertEq(tesla, 0);
        assertEq(gme, 0);
    }
}