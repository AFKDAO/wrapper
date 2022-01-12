// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @dev AToken is the token that needs to be wrapped
 */
contract AToken is ERC721 {

    struct Data {
        string name;
        uint256 generation;
    }

    mapping(uint256 => Data) private _data;
    uint256 private _rarity;

    constructor(string memory name_, string memory symbol_) ERC721(name_,symbol_) {
    }

    function mint(string memory name) external {
        uint256 tokenId = uint256(keccak256(abi.encodePacked(block.timestamp, block.number)));
        Data memory data = Data(name,block.number);
        _data[tokenId] = data;
        _mint(_msgSender(), tokenId);
    }

    function setRarity(uint256 rarity_) external {
        _rarity = rarity_;
    }

    // read ratity property value
    function rarity() external view returns (uint256) {
        return _rarity;
    }

    // read data property value
    function getData(uint256 tokenId) external view returns (string memory, uint256) {
        return (_data[tokenId].name, _data[tokenId].generation);
    }

}