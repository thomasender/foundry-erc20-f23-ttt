# TTT ERC20 Token - TomsTestToken

This is a simple ERC20 token that I created to learn how to create a token on the EVM. It is based of the OpenZeppelin ERC20 contract. 
The initial Supply is 1000 TTT and the token has 18 decimals. This token has been deployed to the Mumbai Testnet. You can find the verified
contract on the Mumbai Testnet here: https://mumbai.polygonscan.com/address/0x78059263BBb12b2ebA47Cb1a872f8e5223B24D79
contract Address: 0x78059263BBb12b2ebA47Cb1a872f8e5223B24D79

send me your Ethereum Address per e-mail if you want some TTT: freisingen@yahoo.com

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
