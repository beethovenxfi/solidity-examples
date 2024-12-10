<div align="center">
    <img alt="LayerZero" src="resources/LayerZeroLogo.png"/>
</div>

---

# Deployment of Beets TestToken to goerli and optimism-goerli

```
yarn hardhat --network goerli deploy --tags BeetsTestProxyOFTV2
yarn hardhat --network goerli verifyContract --contract BeetsTestProxyOFTV2

// make sure you have the correct etherscan api key set in hardhat.config.js for the corresponding chain when verifying

yarn hardhat --network optimism-goerli deploy --tags BeetsTestOFTV2
yarn hardhat --network optimism-goerli verifyContract --contract BeetsTestOFTV2

yarn hardhat --network goerli setTrustedRemote --target-network optimism-goerli --local-contract BeetsTestProxyOFTV2 --remote-contract BeetsTestOFTV2
yarn hardhat --network optimism-goerli setTrustedRemote --target-network goerli --local-contract BeetsTestOFTV2 --remote-contract BeetsTestProxyOFTV2

yarn hardhat --network goerli oftv2Send --target-network optimism-goerli --qty 50 --local-contract BeetsTestProxyOFTV2 --remote-contract BeetsTestOFTV2
yarn hardhat --network optimism-goerli oftv2Send --target-network goerli --qty 25 --local-contract BeetsTestOFTV2 --remote-contract BeetsTestProxyOFTV2
```

Addresses:
Beets: https://goerli.etherscan.io/address/0x83cd2803e971d10d18aac3a8af4f62bb54a4a266#readContract
Beets Proxy: https://goerli.etherscan.io/address/0x3e4d7CeA259231c68A31dE6e26171175edE71303#readContract
Beets OP goerli: https://goerli-optimism.etherscan.io/address/0x67af5d428d38c5176a286a2371df691cdd914fb8

# Deployment of Beets OFTProxy to Fantom and BEETS OFT to Optimism

```
yarn hardhat --network fantom deploy --tags BeetsProxyOFTV2
yarn hardhat --network fantom verifyContract --contract BeetsProxyOFTV2

// make sure you have the correct etherscan api key set in .env for the corresponding chain when verifying

yarn hardhat --network optimism deploy --tags BeetsOFTV2
yarn hardhat --network optimism verifyContract --contract BeetsOFTV2

yarn hardhat --network fantom setTrustedRemote --target-network optimism --local-contract BeetsProxyOFTV2 --remote-contract BeetsOFTV2
yarn hardhat --network optimism setTrustedRemote --target-network fantom --local-contract BeetsOFTV2 --remote-contract BeetsProxyOFTV2

yarn hardhat --network fantom approve --token 0xF24Bcf4d1e507740041C9cFd2DddB29585aDCe1e --qty 10 --spender 0x8d038dA833b154EBcFB7965a9eE7C4Ad72671b21
yarn hardhat --network fantom oftv2Send --target-network optimism --qty 10 --local-contract BeetsProxyOFTV2 --remote-contract BeetsOFTV2

yarn hardhat --network optimism oftv2Send --target-network fantom --qty 5 --local-contract BeetsOFTV2 --remote-contract BeetsProxyOFTV2

setUseCustomAdapterParams on the ProxyOFT Contract to true (directly via etherscan)
https://ftmscan.com/tx/0x066fe65f8c829d5a98ec2fb31f474b7002a2da1147b22e9963da251fb402588a
https://optimistic.etherscan.io/tx/0xce062f2c0e416d2ea72599ade355832480c095f26ff5f2cf084a78d262a3a645

setMinDstGas (directly on etherscan)
dstChain: 111 (OP)
type: 0 (send)
minGas: 110000
https://ftmscan.com/tx/0x0a8f813e4dadb41e3dc29265ea707d750fea6db9f1dceef636bed757254137e5

dstChain: 111 (OP)
type: 1 (send and call)
minGas: 110000
https://ftmscan.com/tx/0x08176bbfb1c21d70d96cbfde7e58c713d49f369b1afe6df5898374e248c2b264

setMinDstGas (directly on etherscan)
dstChain: 112 (FTM)
type: 0 (send)
minGas: 110000
https://optimistic.etherscan.io/tx/0x4479be4e40127be3e8948684a42fb95d91c5f342c44735cfe5d72e37d7920656

dstChain: 112 (FT)
type: 1 (send and call)
minGas: 110000
https://optimistic.etherscan.io/tx/0xd0a4824acf810b8eff7b21b3c7beaa4c17151f1bc657a3c2746de4dd79660c93

```

Addresses:
Beets on Fantom: https://ftmscan.com/address/0xF24Bcf4d1e507740041C9cFd2DddB29585aDCe1e
LZ Fantom endpoint: https://ftmscan.com/address/0xb6319cC6c8c27A8F5dAF0dD3DF91EA35C4720dd7#code

LZ Optimism endpoint: https://optimistic.etherscan.io/address/0x3c2269811836af69497E5F486A85D7316753cf62
LZ Sonic endpoint: https://explorer.soniclabs.com/address/0xb6319cC6c8c27A8F5dAF0dD3DF91EA35C4720dd7

BeetsProxyOFT on Fantom: https://ftmscan.com/address/0x8d038dA833b154EBcFB7965a9eE7C4Ad72671b21
BeetsOFT on Optimism: https://optimistic.etherscan.io/address/0xb4Bc46bc6cB217B59ea8F4530BaE26Bf69F677f0
BeetsOFT on Sonic https://146.routescan.io/address/0x1E5fe95fB90ac0530F581C617272cd0864626795/contract/146/writeContract

Txns:
Sending Beets from Fantom: https://ftmscan.com/tx/0xe21c9e4384ed9179b32a55d79e57fd4856fec773c9deb37431e337850d4c03ac
Receiving Beets on OP: https://optimistic.etherscan.io/tx/0x7c7680428b0ec38597bde1791e23fb5d0f6896aac4380dab0f831d7f8d3eabfc

Sending Beets from OP: https://optimistic.etherscan.io/tx/0x941d94268f29805d14383711afeabc9e11f63fca530c99c3f5265d0267e4d6d4
Receiving Beets on Fantom: https://ftmscan.com/tx/0xb64d009bf16c6d5ecc4b8fc616837a4bec9c341856d6c6b549f8e73ec77cdf44

# LayerZero Omnichain Contract Examples

* Formal audit(s) (May 21, 2022) can be found in /audit

 ### Install & Run tests
```shell
yarn install
npx hardhat test 
```

* The code in the `/contracts` folder demonstrates LayerZero behaviours.
* `NonblockingLzApp` is a great contract to extend. Take a look at how `OmniCounter` overrides `_nonblockingLzReceive` and `_LzReceive` to easily handle messaging. There are also example for `OFT` and `ONFT` which illustrate erc20 and erc721 cross chain functionality.
* Always audit your own code and test extensively on `testnet` before going to mainnet 🙏

> The examples below use two chains, however you could substitute any LayerZero supported chain! 

# OmnichainFungibleToken (OFT)

## About OFTV2
```shell
NOTE: the OFTV2 uses uint64 to encode value transfer for compatability of aptos and solana. 

The deployer is expected to set a lower decimal points like 6 or 8. 

If the decimal point is 18, then uint64 can only represent approximately 18 tokens (uint64.max ~= 18 * 10^18).
```

## Deploy Setup
1. Add a .env file (to the root project directory) with your MNEMONIC="" and fund your wallet in order to deploy!
2. Follow any of the tutorials below

## OFTV2.sol - an omnichain ERC20

> WARNING: **You must perform the setTrustedRemote() (step 2).**

1. Deploy two contracts:
```angular2html
npx hardhat --network goerli deploy --tags ExampleOFTV2
npx hardhat --network fuji deploy --tags ExampleOFTV2
```
2. Set the "trusted remotes" (ie: your contracts) so each of them can receive messages from one another, and `only` one another.
```angular2html
npx hardhat --network goerli setTrustedRemote --target-network fuji --contract ExampleOFTV2
npx hardhat --network fuji setTrustedRemote --target-network goerli --contract ExampleOFTV2
```
3. Send tokens from goerli to fuji
```angular2html
npx hardhat --network goerli oftv2Send --target-network fuji --qty 42 --contract ExampleOFTV2
```
 Pro-tip: Check the ERC20 transactions tab of the destination chain block explorer and await your tokens!

# OmnichainNonFungibleToken721 (ONFT721)

This ONFT contract allows minting of `nftId`s on separate chains. To ensure two chains can not mint the same `nfId` each contract on each chain is only allowed to mint`nftIds` in certain ranges.
Check `constants/onftArgs.json` for the specific test configuration used in this demo.
## UniversalONFT.sol 

> WARNING: **You must perform the setTrustedRemote() (step 2).**

1. Deploy two contracts:
```angular2html
 npx hardhat --network bsc-testnet deploy --tags ExampleUniversalONFT721
 npx hardhat --network fuji deploy --tags ExampleUniversalONFT721
```
2. Set the "trusted remotes", so each contract can send & receive messages from one another, and `only` one another.
```angular2html
npx hardhat --network bsc-testnet setTrustedRemote --target-network fuji --contract ExampleUniversalONFT721
npx hardhat --network fuji setTrustedRemote --target-network bsc-testnet --contract ExampleUniversalONFT721
```
3. Set the min gas required on the destination
```angular2html
npx hardhat --network bsc-testnet setMinDstGas --target-network fuji --contract ExampleUniversalONFT721 --packet-type 1 --min-gas 100000
npx hardhat --network fuji setMinDstGas --target-network bsc-testnet --contract ExampleUniversalONFT721 --packet-type 1 --min-gas 100000
```
4. Mint an NFT on each chain!
```angular2html
npx hardhat --network bsc-testnet onftMint --contract ExampleUniversalONFT721
npx hardhat --network fuji onftMint --contract ExampleUniversalONFT721
```
5. [Optional] Show the token owner(s)
```angular2html
npx hardhat --network bsc-testnet ownerOf --token-id 1 --contract ExampleUniversalONFT721
npx hardhat --network fuji ownerOf --token-id 11 --contract ExampleUniversalONFT721
```
6. Send ONFT across chains
```angular2html
npx hardhat --network bsc-testnet onftSend --target-network fuji --token-id 1 --contract ExampleUniversalONFT721
npx hardhat --network fuji onftSend --target-network bsc-testnet --token-id 11 --contract ExampleUniversalONFT721 
```
7. Verify your token no longer exists in your wallet on the source chain & wait for it to reach the destination side.
```angular2html
npx hardhat --network bsc-testnet ownerOf --token-id 1 --contract ExampleUniversalONFT721
npx hardhat --network fuji ownerOf --token-id 1 --contract ExampleUniversalONFT721
```


# OmniCounter.sol

OmniCounter is a simple contract with a counter. You can only *remotely* increment the counter!

1. Deploy both OmniCounters:

```
npx hardhat --network bsc-testnet deploy --tags OmniCounter
npx hardhat --network fuji deploy --tags OmniCounter
````

2. Set the remote addresses, so each contract can receive messages
```angular2html
npx hardhat --network bsc-testnet setTrustedRemote --target-network fuji --contract OmniCounter
npx hardhat --network fuji setTrustedRemote --target-network bsc-testnet --contract OmniCounter
```
3. Send a cross chain message from `bsc-testnet` to `fuji` !
```angular2html
npx hardhat --network bsc-testnet incrementCounter --target-network fuji
```

Optionally use this command in a separate terminal to watch the counter increment in real-time.
```
npx hardhat --network fuji ocPoll    
```

# Check your setTrustedRemote's are wired up correctly
Just use our checkWireUpAll task to check if your contracts are wired up correctly. You can use it on the example contracts deployed above.
1) ExampleBasedOFT and ExampleOFT
```angular2html
npx hardhat checkWireUpAll --e testnet --contract ExampleOFT --proxy-contract ExampleBasedOFT --proxy-chain goerli
```
2) UniversalONFT
```angular2html
npx hardhat checkWireUpAll --e testnet --contract ExampleUniversalONFT721
```
3) OmniCounter
```angular2html
npx hardhat checkWireUpAll --e testnet --contract OmniCounter
```

### See some examples in `/contracts`  🙌

Many of the example contracts make use of LayerZeroEndpointMock.sol which is a nice way to test LayerZero locally!

### For further reading, and a list of endpoint ids and deployed LayerZero contract addresses please take a look at the Gitbook here: https://layerzero.gitbook.io/


# See testnet and mainnet chainIds and addresses, and the format for connecting contracts on different chains:
 https://github.com/LayerZero-Labs/set-trusted-remotes 
 https://layerzero.gitbook.io/docs/technical-reference/testnet/testnet-addresses
 https://layerzero.gitbook.io/docs/technical-reference/mainnet/supported-chain-ids


## Most recently tested with node version `16.13.1` 

