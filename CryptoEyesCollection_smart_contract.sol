// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CryptoEyes is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter; 
    uint MAX_SUPPLY = 20;// to prevent people to mint more NFT than present in the collection
    uint ownerSupply = 3; // Saving at least 3 NFTs for the owner
   


    constructor() ERC721("CryptoEyes", "EYES") {
        _tokenIdCounter.increment();  // start minting at 1 and not 0
    } 
    

    function safeMint(address to, string memory uri) public { //public accessible from anywhere, everybody have access to the mint function
                                                             
        uint256 tokenId = _tokenIdCounter.current(); // declaring a variable to store the token_id + current() --> give us the current token_id number
        require(balanceOf(msg.sender) == 0, "Max Mint per wallet reached"); //to make sure only 1 mint is done per address
        require(_tokenIdCounter.current() <= (MAX_SUPPLY -ownerSupply),"I am sorry, all NFTs have been minted");  // to avoid to mint too much NFT
        _tokenIdCounter.increment(); // making sure that the next NFT that will be created will have an incremental number
        _safeMint(to, tokenId); // we mint the NFT with the _safemint() 
        _setTokenURI(tokenId, uri); // we assigne the token URI to the NFT to link NFT to metadata
        
    }

    //function for the owner to mint
    function mintOwner(address to, string memory uri) public onlyOwner{
        require(_tokenIdCounter.current() <= MAX_SUPPLY, "I'm sorry we reached the cap");
        // require(balanceOf(owner) <= 3, "Max Mint per owner reached");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    //we want to reserve 3 NFTs for the Owner


    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal 
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) // function that OpenSea and Rarible will call to get the URI of your token
        public                          // the nft market place will pass the tokenId o , 1, 2 and the function will return the tokenURI associated with the token ID
        view   // if you mark a function as view and you are calling this function from your wallet, not from another SC, you won't pay any gas
                // if a SC calls this function then, it will have to pay some gas
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}