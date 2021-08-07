// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "../uniswapv2/interfaces/IUniswapV2Pair.sol";
import "./IMaidCoin.sol";
import "./IRNG.sol";

interface IGachaHousekeeper is IERC721, IERC721Metadata, IERC721Enumerable {
    event ChangeLPTokenToHousekeeperPower(uint256 value);
    event ChangePrice(uint256 mintPrice, uint256 destroyReturn);
    event Support(uint256 indexed id, uint256 lpTokenAmount);
    event Desupport(uint256 indexed id, uint256 lpTokenAmount);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external view returns (bytes32);

    function PERMIT_ALL_TYPEHASH() external view returns (bytes32);

    function nonces(uint256 id) external view returns (uint256);

    function noncesForAll(address owner) external view returns (uint256);
    
    function maidCoin() external view returns (IMaidCoin);

    function lpToken() external view returns (IUniswapV2Pair);
    
    function rng() external view returns (IRNG);

    function lpTokenToHousekeeperPower() external view returns (uint256);

    function mintPrice() external view returns (uint256);

    function destroyReturn() external view returns (uint256);

    function housekeepers(uint256 id) external view returns (uint256 originPower, uint256 supportedLPTokenAmount, uint256 destroyReturn);

    function powerOf(uint256 id) external view returns (uint256);

    function support(uint256 id, uint256 lpTokenAmount) external;

    function supportWithPermit(
        uint256 id,
        uint256 lpTokenAmount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function desupport(uint256 id, uint256 lpTokenAmount) external;

    function permit(
        address spender,
        uint256 id,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function permitAll(
        address owner,
        address spender,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function mint() external returns (uint256 id);
    function mintWithPermit(
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 id);
}
