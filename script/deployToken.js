const {ethers} = require ("hardhat");

const main = async () => {
    const dexTokenContractFactory = await ethers.getContractFactory("faucetToken");
    const dexTokenDeploy = await dexTokenContractFactory.deploy();

    console.log("Contract deployed to: ", await dexTokenDeploy.getAddress() )
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);

    }catch (error) {
        console.log(error);
        process.exit(1);
    }
}

runMain();