// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Mothership.sol";

contract MothershipTest is Test {
    Mothership motherShip;
    SpaceShip spaceShip;
    CleaningModule cleaningModule;
    RefuelModule refuelModule;
    LeadershipModule leadershipModule;

    address captain = makeAddr("captain");
    function setUp() external {
        motherShip = new Mothership();
        cleaningModule = new CleaningModule();
        refuelModule = new RefuelModule();
        leadershipModule = new LeadershipModule();

        // spaceShip = new SpaceShip(
        //     captain,
        //     address(motherShip),
        //     address(cleaningModule),
        //     address(refuelModule),
        //     address(leadershipModule),
        // );
    }
}