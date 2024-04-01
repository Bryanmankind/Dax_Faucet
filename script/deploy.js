const {ethers} = require ("hardhat");

const main = async () => {
    const Faucet = await ethers.getContractFactory("DaxFaucet");
    const faucet = await Faucet.deploy("0x5FbDB2315678afecb367f032d93F642f64180aa3");

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