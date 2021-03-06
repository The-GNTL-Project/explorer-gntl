var config = {
    testnet: false, // this is adjusted page.h if needed. dont need to change manually
    stagenet: false, // this is adjusted page.h if needed. dont need to change manually
    coinUnitPlaces: 9,
    txMinConfirms: 4, // corresponds to CRYPTONOTE_DEFAULT_TX_SPENDABLE_AGE in Monero
    txCoinbaseMinConfirms: 18, // corresponds to CRYPTONOTE_MINED_MONEY_UNLOCK_WINDOW in Monero
    coinSymbol: 'GNTL',
    openAliasPrefix: "GNTL",
    coinName: 'GNTL',
    coinUriPrefix: 'GNTL:',
    addressPrefix: 0x7b2ed,
    integratedAddressPrefix: 0x1c32ed,
    subAddressPrefix: 0x20f2ed,
    addressPrefixTestnet: 0x17a76d,
    integratedAddressPrefixTestnet: 0x2ca76d,
    subAddressPrefixTestnet: 0x31276d,
    addressPrefixStagenet: 0x67ed,
    integratedAddressPrefixStagenet: 0xde7ed,
    subAddressPrefixStagenet: 0x967ed,
    feePerKB: new JSBigInt('20000'),//20^10 - for testnet its not used, as fee is dynamic.
    dustThreshold: new JSBigInt('10000'),//10^10 used for choosing outputs/change - we decompose all the way down if the receiver wants now regardless of threshold
    txChargeRatio: 0.5,
    defaultMixin: 11, // minimum mixin for hardfork v5
    txChargeAddress: '',
    idleTimeout: 30,
    idleWarningDuration: 20,
    maxBlockNumber: 500000000,
    avgBlockTime: 120,
    debugMode: false
};
