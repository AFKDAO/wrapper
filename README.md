## Abstract

Wrapper is a contract where you can wrap or transform an existing ERC-721 token into a new wrapped token with ERC-4610 standard.

## Design

User deposit ERC721 token to the wrapper contract and get the new wrapped token based on ERC4610 standard. The tokenId of wrapped token is the same as the tokenId of the deposited token.

Notice that, a `mint` is performed for each `deposit`, and a `burn` is performed for each `withdraw`.

When we need to view the attribute value of the token, the `get method` of the original token will eventually be called.

### Deposit

![deposit](https://github.com/AFKDAO/wrapper/blob/main/docs/deposit.png)

### Withdraw

![withdraw](https://github.com/AFKDAO/wrapper/blob/main/docs/withdraw.png)

### TokenURI

![tokenuri](https://github.com/AFKDAO/wrapper/blob/main/docs/read.png)

## Implement

Logically, the Wrapper contract consists of two parts. In the first part, the transmission and reading of ERC721 basic parameters, like `tokenURI`, have been implemented. 

Developers need to develop the second part according to their specific needs of wrapping tokens. When the ERC721 token has properties beyond the ERC721 standard, such as rarity, then the developer needs to develop the interface to obtain these properties separately in the second part.

You can see the example in contracts/example.

