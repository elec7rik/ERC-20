// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";
import "forge-std/console.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    event BobsAllowanceToAliceAfterTranser(address account, uint256 newAllowance);

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    address charlie = makeAddr("charlie");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();  

        vm.prank(address(msg.sender));      
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowanceWorks() public {
        uint256 initialAllowance = 1000;

        // bob approves alice to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);
        uint256 transferAmount = 500;
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
    }

    function testMultipleTransfers() public {
        uint256 transferAmount1 = 30;
        uint256 transferAmount2 = 20;

        // Bob approves Charlie to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(charlie, transferAmount1);

        // Charlie transfers tokens from Bob to himself
        vm.prank(charlie);
        ourToken.transferFrom(bob, charlie, transferAmount1);

        // Assertions
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount1);
        assertEq(ourToken.balanceOf(charlie), transferAmount1);

        // Bob approves Alice for another transfer
        vm.prank(bob);
        ourToken.approve(alice, transferAmount2);

        // Alice transfers tokens from Bob to herself
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount2);

        // Assertions
        assertEq(ourToken.allowance(bob, alice), transferAmount2-ourToken.balanceOf(alice));
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount1 - transferAmount2);
        assertEq(ourToken.balanceOf(alice), transferAmount2);
    }

}