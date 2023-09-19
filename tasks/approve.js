const CHAIN_ID = require("../constants/chainIds.json")

module.exports = async function (taskArgs, hre) {
    const token = taskArgs.token;
    const amount = ethers.utils.parseEther(taskArgs.qty)
    const spender = taskArgs.spender;

    if(!token || !amount || !spender) {
        console.log("Must pass token, amount and spender")
        return
    }
    const tokenContract = await ethers.getContractAt([
        'function approve(address spender, uint256 amount) external returns (bool)',
    ], token)

    let tx = await (
        await tokenContract.approve(
            spender,
            amount,
        )
    ).wait()
    console.log(` tx: ${tx.transactionHash}`)
}
