var CoingeckoEthUsd = artifacts.require("./CoingeckoEthUsd.sol");

module.exports = function(deployer, network) {
  deployer.deploy(CoingeckoEthUsd);
}

