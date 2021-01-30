// SPDX-License-Identifier: MIT
pragma solidity ^0.7.2;

import "openzeppelin-solidity/contracts/token/ERC777/ERC777Upgradeable.sol";
import "openzeppelin-solidity/contracts/proxy/Initializable.sol";


/**
 * @dev {ERC777} token, including:
 *
 *  - Preminted initial supply
 *  - No access control mechanism (for minting/pausing) and hence no governance
 */
contract FontERC777 is Initializable, ERC777Upgradeable {
    function initialize(
        address[] memory defaultOperators,
        address owner
    ) public virtual initializer {
        __ERC777PresetFixedSupply_init("Font", "FONT", defaultOperators, 2000000000000000000000000, owner);
    }
    /**
     * @dev Mints `initialSupply` amount of token and transfers them to `owner`.  
     *
     * See {ERC777-constructor}.
     */
    function __ERC777PresetFixedSupply_init(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply,
        address owner
    ) internal initializer {
        __Context_init_unchained();
        __ERC777_init_unchained(name, symbol, defaultOperators);
        __ERC777PresetFixedSupply_init_unchained(name, symbol, defaultOperators, initialSupply, owner);
    }

    function __ERC777PresetFixedSupply_init_unchained(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply,
        address owner
    ) internal initializer {
        _mint(owner, initialSupply, "", "");
    }
    uint256[50] private __gap;
}

