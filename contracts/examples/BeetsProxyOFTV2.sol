// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/oft/v2/ProxyOFTV2.sol";

/// @title A LayerZero OmnichainFungibleToken for Beets on FANTOM
contract BeetsProxyOFTV2 is ProxyOFTV2 {
    constructor() ProxyOFTV2(0xF24Bcf4d1e507740041C9cFd2DddB29585aDCe1e, 6, 0xb6319cC6c8c27A8F5dAF0dD3DF91EA35C4720dd7) {
    }
}
