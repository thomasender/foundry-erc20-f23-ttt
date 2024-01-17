// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployTomsTestToken} from "../script/DeployTomsTestToken.s.sol";
import {TomsTestToken} from "../src/TomsTestToken.sol";

contract TomsTestTokenTest is Test {
    TomsTestToken public ttt;
    DeployTomsTestToken public deployer;

    address andi = makeAddr("andi");
    address bill = makeAddr("bill");

    uint256 public constant STARTING_BALANCE = 100 ether;
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function setUp() public {
        deployer = new DeployTomsTestToken();
        ttt = deployer.run();

        vm.prank(msg.sender);
        ttt.transfer(andi, STARTING_BALANCE);
    }

    function testAndisBalance() public {
        assertEq(ttt.balanceOf(andi), STARTING_BALANCE);
    }

    function testAllowancesWork() public {
        uint256 testAllowance = 1000;
        uint256 transferAmount = testAllowance / 2;

        vm.prank(andi);
        ttt.approve(bill, testAllowance);

        vm.prank(bill);
        ttt.transferFrom(andi, bill, transferAmount);

        assertEq(ttt.balanceOf(bill), transferAmount);
        assertEq(ttt.balanceOf(andi), STARTING_BALANCE - transferAmount);
    }

    function testInitialSupply() public {
        assertEq(ttt.totalSupply(), INITIAL_SUPPLY);
    }

    function testSymbolAndName() public {
        assertEq(ttt.symbol(), "TTT");
        assertEq(ttt.name(), "TomsTestToken");
    }

    function testDecimals() public {
        assertEq(ttt.decimals(), 18);
    }

    function testTransfer() public {
        uint256 transferAmount = 100;

        vm.prank(andi);
        ttt.transfer(bill, transferAmount);

        assertEq(ttt.balanceOf(bill), transferAmount);
        assertEq(ttt.balanceOf(andi), STARTING_BALANCE - transferAmount);
    }

    function testTransferToZeroAddress() public {
        // Ensure that transferring to the zero address fails
        vm.prank(msg.sender);
        vm.expectRevert();
        ttt.transfer(address(0), 10);
        assertEq(ttt.balanceOf(address(0)), 0);
    }

    function testTransferWithInsufficientBalance() public {
        // Ensure that transferring more than the balance fails
        uint256 initialBalance = ttt.balanceOf(andi);
        vm.prank(andi);
        vm.expectRevert();
        ttt.transfer(bill, initialBalance + 1);
        assertEq(ttt.balanceOf(andi), initialBalance);
    }

    function testTransferFromWithInsufficientAllowance() public {
        // Ensure that transferring more than the allowed amount fails
        uint256 testAllowance = 1000;

        vm.prank(andi);
        ttt.approve(bill, testAllowance);

        vm.prank(bill);
        vm.expectRevert();
        ttt.transferFrom(andi, bill, testAllowance + 1);

        // Ensure the balance and allowance remain unchanged
        assertEq(ttt.balanceOf(bill), 0);
        assertEq(ttt.balanceOf(andi), STARTING_BALANCE);
        assertEq(ttt.allowance(andi, bill), testAllowance);
    }
}
