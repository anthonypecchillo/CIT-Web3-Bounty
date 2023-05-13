// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface ITicketNFT is IERC721 {
    function mint(address to) external;
    // function updateTicketPrice(uint256 newPrice) external;
    // function withdraw(uint256 amount) external;
    function burn(uint256 tokenId, address ticketOwner) external;
}
