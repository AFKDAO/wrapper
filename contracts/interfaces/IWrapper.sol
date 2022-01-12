// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IWrapper {

    event Deposit(address indexed caller, uint256 indexed tokenId);

    event Withdraw(address indexed caller, uint256 indexed tokenId);

    function deposit(uint256 tokenId) external;

    function withdraw(uint256 tokenId) external;

}