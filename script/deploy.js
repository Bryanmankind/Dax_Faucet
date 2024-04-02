const {ethers} = require ("hardhat");

const main = async () => {
    const Faucet = await ethers.getContractFactory("DaxFaucet");
    const faucet = await Faucet.deploy("0x93bc02D63A309F17eb08e172848304c65e2DD807");

    console.log("Contract deploy to: ", await faucet.getAddress());


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