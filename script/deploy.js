const {ethers} = require ("hardhat");

const main = async () => {
    const Faucet = await ethers.getContractFactory("DaxFaucet");
    const faucet = await Faucet.deploy();

    await faucet.deployed();

    console.log("Contract deploy to: ", faucet.getAddress());


}

const runMain = async () => {
    try {
        await main ();
        process.exit(0);
    } catch (error) {
        console.log (error);
        process.exit(1);
    }
}


runMain();