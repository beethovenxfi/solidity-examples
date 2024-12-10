// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/oft/v2/OFTV2.sol";

/// @title A LayerZero OmnichainFungibleToken for Beets on Sonic
contract BeetsOFTV2 is OFTV2 {
    constructor() OFTV2("BeethovenxToken", "BEETS", 6, 0xb6319cC6c8c27A8F5dAF0dD3DF91EA35C4720dd7) { }
}
