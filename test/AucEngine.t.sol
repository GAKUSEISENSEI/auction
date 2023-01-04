// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {AucEngine} from "../src/AucEngine.sol";

contract CounterTest is Test {
    AucEngine public auc;

    function setUp() public {
        auc = new AucEngine();
        auc.createAuction(10000,10,'bicycle', 2 days);
        console.log(auc.createAuction());
    }

    
}
