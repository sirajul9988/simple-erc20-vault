// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SimpleVault
 * @dev A basic vault for depositing ERC20 tokens and receiving shares.
 */
contract SimpleVault is ERC20, Ownable {
    IERC20 public immutable token;

    constructor(address _token) ERC20("Vault Share Token", "vTKN") Ownable(msg.sender) {
        token = IERC20(_token);
    }

    /**
     * @notice Deposit tokens into the vault and receive shares.
     * @param _amount The amount of underlying tokens to deposit.
     */
    function deposit(uint256 _amount) external {
        uint256 totalAssets = token.balanceOf(address(this));
        uint256 totalShares = totalSupply();
        uint256 sharesToMint;

        if (totalShares == 0) {
            sharesToMint = _amount;
        } else {
            sharesToMint = (_amount * totalShares) / totalAssets;
        }

        token.transferFrom(msg.sender, address(this), _amount);
        _mint(msg.sender, sharesToMint);
    }

    /**
     * @notice Withdraw tokens by burning vault shares.
     * @param _shares The number of shares to burn.
     */
    function withdraw(uint256 _shares) external {
        uint256 totalAssets = token.balanceOf(address(this));
        uint256 totalShares = totalSupply();
        
        uint256 amountToWithdraw = (_shares * totalAssets) / totalShares;

        _burn(msg.sender, _shares);
        token.transfer(msg.sender, amountToWithdraw);
    }
}
