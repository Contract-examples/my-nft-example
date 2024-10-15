// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract DeployMyNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("WALLET_PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        MyNFT nft = new MyNFT(deployerAddress);

        vm.stopBroadcast();

        console.log("MyNFT deployed to:", address(nft));
        console.log("Contract name:", nft.name());
        console.log("Contract symbol:", nft.symbol());
        console.log("Max supply:", 1000);
        console.log("Initial user mint supply:", nft.MintSupplyForUsers());
    }
}
