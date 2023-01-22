// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Valve.sol";

contract ValveTest is Test, INozzle {
    Valve valve;
    StopValve stopValve;

    function setUp() external {
        valve = new Valve();
        stopValve = new StopValve(address(valve));
    }

    function testOpenValve() external {
        bool val = stopValve.insert();
    }
}