// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Script} from "forge-std/Script.sol";
import {TomsTestToken} from "../src/TomsTestToken.sol";

contract DeployTomsTestToken is Script {
    uint256 public constant initialSupply = 1000 ether;

    function run() external returns (TomsTestToken ttt) {
        vm.startBroadcast();
        ttt = new TomsTestToken(initialSupply);
        vm.stopBroadcast();
    }
}
