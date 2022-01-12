// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IERC4610 is IERC721 {

    /**
     * @dev Emitted when `owner` or `approved account` enables `setDelegator` to manage the `tokenId` token.
     */
    event SetDelegator(address indexed caller, address indexed delegator, uint256 indexed tokenId);

    /**
     * @dev Set or remove `delegator` for the owner.
     * The delegator has no direct permission, just an additional attribute.
     *
     * Requirements:
     *
     * - The `delegator` cannot be the caller.
     * - `tokenId` must exist.
     *
     * Emits an {SetDelegator} event.
     */
    function setDelegator(address delegator, uint256 tokenId) external;

    /**
     * @dev Returns the delegator of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function delegatorOf(uint256 tokenId) external view returns (address);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`
     * `delegator` won't be cleared if `reserved` is true.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     * - If `reserved` is true, it won't clear the `delegator`.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bool reserved
    ) external;

}