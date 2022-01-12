// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./AToken.sol";
import "../Wrapper.sol";
import "../interfaces/IERC4610.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @dev ATokenWrapper is the AToken after wrappering
 */
contract ATokenWrapper is Wrapper {

    constructor(address underlyingToken_, string memory name_, string memory symbol_) Wrapper(underlyingToken_,name_,symbol_) {
    }

    // add READ function to get ratity property value from AToken
    function rarity() external view returns (uint256) {
        return AToken(_underlyingToken).rarity();
    }

    // add READ function to get data property value from AToken
    function getData(uint256 tokenId) external view returns (string memory, uint256) {
        return AToken(_underlyingToken).getData(tokenId);
    }

}