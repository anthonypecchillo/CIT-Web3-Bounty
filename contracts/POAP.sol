// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "./interfaces/ITicketNFT.sol";

contract POAP is ERC721 {
    ITicketNFT public ticketNFT;
    uint256 public poapCounter;

    constructor(
        ITicketNFT _ticketNFT,
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {
        ticketNFT = ITicketNFT(_ticketNFT);
    }

    function mint(uint256 ticketId, address ticketOwner) external {
        require(ticketNFT.ownerOf(ticketId) == msg.sender, "Only the ticket holder can claim the POAP.");
        poapCounter++;
        ticketNFT.burn(ticketId, ticketOwner);
        _safeMint(msg.sender, poapCounter);
    }
}
