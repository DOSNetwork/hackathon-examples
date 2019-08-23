### Install
- `$ npm -g install truffle`
- `$ npm install -g ganache-cli`


### Compile:
- `$ truffle compile --all`


### Deploy:
- Add testnet config in truffle-config.js then `$ truffle migrate --reset`
- Or using Remix.


### Examples:
##### Connecting external data feeds to smart contracts:
- CoingeckoEthUsd.sol: Get ETH/USD spot price from Coingecko.com through DOS Network decentralized oracle. ([deployed contract](https://rinkeby.etherscan.io/address/0xe3e1b9811f64800c086257cc66e5e2d85839eeed))

##### Providing safe & distributed random numbers to smart contracts:
- SimpleDice.sol: Roll a dice using secure, unpreditable, off-chain generated distributed random numbers by DOS Network decentralized oracle. [deployed contract](https://rinkeby.etherscan.io/address/0x852ddf460a25b85b5539b584d82580440de4f07a)


### Docs:
- https://dosnetwork.github.io/docs/#/contents/blockchains/ethereum
