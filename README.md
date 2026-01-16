# FundMe

Projeto Hardhat com um contrato simples de crowdfunding (`FundMe`) e uma biblioteca de conversao de preco (`PriceConverter`) usando um feed da Chainlink.

## Contratos

- `FundMe.sol`: recebe ETH via `fund()` e permite saque apenas ao `owner` via `withdraw()`. O valor minimo e `5e18` (US$ 5 com 18 casas). `receive` e `fallback` redirecionam para `fund()`.
- `PriceConverter.sol`: consulta o feed ETH/USD da Chainlink (Sepolia: `0x694AA1769357215DE4FAC081bf1f309aDC325306`) e converte ETH para USD com 18 casas.

## Estrutura

- `contracts/`: contratos Solidity.
- `hardhat.config.ts`: Hardhat 3 com perfis de compilacao e redes (Hardhat local, OP simulado, Sepolia).
- `test/Counter.ts`: teste de exemplo do template (referencia um contrato `Counter` que nao existe neste repo).

## Requisitos

- Node.js e npm.
- Hardhat 3 (ja incluido nas dependencias).

## Instalação

```shell
npm install
```

## Compilacao

```shell
npx hardhat compile
```

## Testes

```shell
npx hardhat test
```

## Deploy e rede Sepolia

Nao ha modulos do Ignition neste repo (pasta `ignition/modules` esta vazia). Para usar a rede Sepolia, configure as variaveis no `hardhat.config.ts`:

- `SEPOLIA_RPC_URL`
- `SEPOLIA_PRIVATE_KEY`

Exemplo de comando para setar variaveis (via ambiente):

```shell
export SEPOLIA_RPC_URL="https://sepolia.infura.io/v3/SEU_ID"
export SEPOLIA_PRIVATE_KEY="SUA_CHAVE"
```

Depois, adicione um script ou modulo de deploy conforme a sua necessidade.
