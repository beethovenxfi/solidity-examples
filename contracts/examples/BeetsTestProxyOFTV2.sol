// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/oft/v2/ProxyOFTV2.sol";

/// @title A LayerZero OmnichainFungibleToken example of for BeetsTest on GOERLI
/// @notice Use this contract only on the BASE CHAIN. It locks tokens on source, on outgoing send(), and unlocks tokens when receiving from other chains.
contract BeetsTestProxyOFTV2 is ProxyOFTV2 {
    constructor() ProxyOFTV2(0x83cd2803e971D10D18aAC3A8aF4F62bB54A4a266, 6, 0xbfD2135BFfbb0B5378b56643c2Df8a87552Bfa23) {
    }
}
