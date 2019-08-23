pragma solidity ^0.5.0;

import "./Ownable.sol";
import "./DOSOnChainSDK.sol";
import "./utils.sol";

contract CoinGeckoEthUsd is Ownable, DOSOnChainSDK {
    using utils for *;

    // Struct to hold parsed floating string "123.45"
    struct ethusd {
        uint integral;
        uint fractional;
    }
    uint public queryId;
    string public priceStr;
    uint public updatedTime;
    ethusd public prices;

    event GetPrice(uint integral, uint fractional);
    
    modifier auth {
        // Filter out malicious __callback__ callers.
        require(msg.sender == fromDOSProxyContract(), "Unauthenticated response");
        _;
    }
    
    function getEth2USD() public {
        queryId = DOSQuery(30, "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd", "$.ethereum.usd");
    }

    function __callback__(uint id, bytes calldata result) external auth {
        require(queryId == id, "Unmatched response");

        updatedTime = now;
        priceStr = string(result);
        prices.integral = priceStr.str2Uint();
        int delimit_idx = priceStr.indexOf('.');
        if (delimit_idx != -1) {
            prices.fractional = priceStr.subStr(uint(delimit_idx + 1)).str2Uint();
        }
        emit GetPrice(prices.integral, prices.fractional);
    }
}

