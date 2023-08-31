// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/oft/v2/OFTV2.sol";

/// @title A LayerZero OmnichainFungibleToken example of BasedOFT for Beets on OP-goerli
/// @notice Use this contract only on the BASE CHAIN. It locks tokens on source, on outgoing send(), and unlocks tokens when receiving from other chains.
contract BeetsTestOFTV2 is OFTV2 {
    constructor() OFTV2("BeethovenxToken", "BEETS", 6, 0xae92d5aD7583AD66E49A0c67BAd18F6ba52dDDc1) { }
}
