import hre from "hardhat";
import { expect } from "chai";

describe("Basic Deployment", function () {
  it("Should deploy AirdropNFT contract", async function () {
    const contract = await hre.viem.deployContract("AirdropNFT");

    expect(contract.address).to.be.properAddress;
  });
});
