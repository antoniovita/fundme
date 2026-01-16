# FundMe

Hardhat project with a simple crowdfunding contract (`FundMe`) and a price conversion library (`PriceConverter`) that uses a Chainlink price feed.

## Contracts

- `FundMe.sol`: receives ETH via `fund()` and allows withdrawals only by the `owner` via `withdraw()`. The minimum is `5e18` (US$ 5 with 18 decimals). `receive` and `fallback` forward to `fund()`.
- `PriceConverter.sol`: reads the Chainlink ETH/USD feed (Sepolia: `0x694AA1769357215DE4FAC081bf1f309aDC325306`) and converts ETH to USD with 18 decimals.

## Structure

- `contracts/`: Solidity contracts.
- `hardhat.config.ts`: Hardhat 3 with compilation profiles and networks (local Hardhat, simulated OP, Sepolia).
- `test/Counter.ts`: template example test (references a `Counter` contract that does not exist in this repo).

## Requirements

- Node.js and npm.
- Hardhat 3 (already included in dependencies).

## Installation

```shell
npm install
```

## Compilation

```shell
npx hardhat compile
```

## Tests

```shell
npx hardhat test
```

## Deploy and Sepolia network

There are no Ignition modules in this repo (`ignition/modules` is empty). To use Sepolia, configure these variables in `hardhat.config.ts`:

- `SEPOLIA_RPC_URL`
- `SEPOLIA_PRIVATE_KEY`

Example of setting environment variables:

```shell
export SEPOLIA_RPC_URL="https://sepolia.infura.io/v3/YOUR_ID"
export SEPOLIA_PRIVATE_KEY="YOUR_KEY"
```

Then, add a deploy script or module as needed.