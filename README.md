# NFT_Collection_with_Generative_Art and IPFS

## Tools used 

1. IPFS (Interplanetary Files System)  = a distributed cloud storage
>< amazon that is centralized
CID = content identifier
CID is useful to store the NFTs metadata
Metadata contains all the information about the NFT (traits, characteristics,..)
Metadata are very important for Market places as OpenSea because they allow to reference the data see [opensea metadata standard documentation]https://docs.opensea.io/docs/metadata-standards()

2. [Pinata](https://www.pinata.cloud/)  = IPFS node as a Service 
rk: you could also run your own IPFS node on your computer

3. HashLips Art Engine (located in HashLips Art Engine Repository on Github)
To generate our NFTs collection and the NFTs metadata 

4. Visual Studio Code 

5. Terminal command Line 

6. Node JS

7. Openzeppeling Contract Wizard --> ERC721 standard format




## Process

### 1. Generate NFTs

+ Go on [HashLips Art Engine Github repository](https://github.com/HashLips/hashlips_art_engine/releases/tag/v1.1.2_patch_v6) and download the latest version
+ Open the folder on your VSC
+ Install dependencies on your Terminal --> **npm install**    &   **npm install -g yarn**
+ In **config.js** select the number of images you want
+ In terminal type npm **node.js** you generate the images and the metadata related to these images in two differents folders



### 2. Create the CID for each image that we have 
+ Go on Pinata and upload the CryptoEyes NFT images folder 
+ The folder is reference with a CID --> ipfs://<CID>
+ Copy the CID 
+ Go on VSC in config.js and paste the CID --> ipfs://QmNfq9qcdKHg2qfFsdHfBAbTrapcdQNkFPv8iundbXCqKa
+ update all the json file automatically : Terminal **node utils/generate_metadata.js**
+ Upload your json files in pinata under the name CrytoEyesMeta

![]()
--> the CID of the Metadata will be our BaseURI for our Smart contract 


### 3. Deploying the smart contract (+allow people to mint NFTs)


### 4. Have a look at OpenSea Testnet













