const hre = require("hardhat");

async function main() {
  const TOKEN_ADDRESS = "0x..."; // Replace with your ERC20 address

  console.log("Deploying Vault...");
  const Vault = await hre.ethers.getContractFactory("SimpleVault");
  const vault = await Vault.deploy(TOKEN_ADDRESS);

  await vault.waitForDeployment();

  console.log(`Vault deployed to: ${await vault.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
