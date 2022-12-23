## Supplementary Materials

## Installation

This project use yarn, so it is recommended to not use npm.
Proceed with install yarn (This installs all dependencies):

```bash
$ yarn add
```

To go further with a backend integration could be useful to
create a .env file and insert the following keys:
MNEMONIC="****\*\*****\*****\*\*****"
PRIVATE_KEY="**\*\***\*\*\*\***\*\***"
INFURA_API_KEY="**\*\***\***\*\***"
INFURA_API_SECRET="**\*\***\*\***\*\***"
ALCHEMY_API_KEY="**\*\*\*\***\*\***\*\*\*\***"
ETHERSCAN_API_KEY="****\*\*****\*****\*\*****"

run the following to deploy the contracts and be able to have artifacts, their abis and bytescode:

```bash
$ yarn hardhat compile
```

## Purpose

Target of these code is actually let an address take eth in return for ERC20 tokens.
Of course this is uncompleted, further adds to do could be a backend and a frontend,
also could be added interests on the loans and a Chain Link oracle to fetch
ERC20 tokens' price feed.
