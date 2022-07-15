//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.6.8;

interface IAuctionModified {
    function createBid(uint256 tokenId, uint256 amount) external payable;
}

contract ETHReceiver {
    uint256 counter = 0;

    function relayBid(
        address auction,
        uint256 tokenId,
        uint256 amount
    ) external payable {
        IAuctionModified(auction).createBid{value: amount}(tokenId, amount);
    }

    function test() external payable{
        for (uint256 i = 0; i < 10; i++) {
            counter += 3;
        }
    }
    
    receive() external payable {
        for (uint256 i = 0; i < 3; i++) {
            counter += 2;
        }
    }
    
}
