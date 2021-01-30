const { ethers, upgrades } = require("hardhat");

async function main() {
  const FontERC777 = await ethers.getContractFactory("FontERC777");
  console.log("Deploying $FONT ERC777 Contract...");

  const init_values = [
    [], "0xC19D2811365571b9876865181DE2c607A6b5dc49"
  ];
  
  const font = await upgrades.deployProxy(FontERC777, init_values, {unsafeAllowCustomTypes: true });
  await font.deployed();
  console.log("$FONT ERC777 contract deployed to:", font.address);
}

main();
