const main = async () => {
    const dexTokenContractFactory = await ether.getContractFactory("faucetToken");
    const dexTokenDeploy = await dexTokenContractFactory.deploy();

    await dexTokenDeploy.deployed();

    console.log("Contract deployed on ", await dexTokenDeploy.getAddress() )
}

const runMain = async () => {
    try {
        await main();
        process.exit(1);

    }catch (error) {
        process.exit(1);
        console.log(error);
    }
}

runMain()