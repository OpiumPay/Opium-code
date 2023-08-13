// scripts/deploy.js
async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const USDC_TOKEN_ADDRESS = "0xcbce2891F86b69b3eF61dF8CE69e3522a0483FB3"; // Replace with the actual USDC token address
  const AAVE_LENDING_POOL_ADDRESS = "0x437F428930669cd06ADaB2dF4A8D4B203AC729C6"; // Replace with the actual Aave Lending Pool address
  const GNOSIS_SAFE_ADDRESS = "0x3c2Bb3614Eba02F9897Bc40F2c612851CBC5A025"; // Replace with the actual Gnosis Safe address

  const GnosisAaveInteractor = await ethers.getContractFactory("GnosisAaveInteractor");
  const gnosisAaveInteractor = await GnosisAaveInteractor.deploy(
    USDC_TOKEN_ADDRESS,
    AAVE_LENDING_POOL_ADDRESS,
    GNOSIS_SAFE_ADDRESS
  );

  console.log("GnosisAaveInteractor address:", gnosisAaveInteractor.address);

  const user1 = "0x92660986CD0313448A68558B13984a02D80fC762";

  await gnosisAaveInteractor.addUser(user1, "0x3c2Bb3614Eba02F9897Bc40F2c612851CBC5A025");

  console.log("Users added to GnosisSafeInteractor");

}

// Run the deployment script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

