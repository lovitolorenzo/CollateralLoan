import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();

const { API_URL, RESERVE_PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "goerli",
  networks: {
    hardhat: {},
    goerli: {
      accounts: [RESERVE_PRIVATE_KEY ? RESERVE_PRIVATE_KEY : ""], //deployer
      url: API_URL,
      //blockGasLimit: 100000000000000,
    },
  },
};

// module.exports = {
//   solidity: {
//     version: "0.8.17",
//     settings: {
//       optimizer: {
//         enabled: true,
//         runs: 200,
//       },
//     },
//   },
//   paths: {
//     sources: "./contracts",
//   },
//   defaultNetwork: "matic",
//   networks: {
//     hardhat: {},
//     matic: {
//       url: API_URL,
//       accounts: [RESERVE_PRIVATE_KEY ? RESERVE_PRIVATE_KEY : ""], //deployer
//     },
//   },
// };
