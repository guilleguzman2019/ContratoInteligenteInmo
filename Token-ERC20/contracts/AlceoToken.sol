pragma solidity ^0.4.24;

import "./StandardToken.sol";
import "./Ownable.sol";

contract AlceoToken is StandardToken, Ownable {

 	string public name = "Alceo Token";
    string public symbol = "ALT";
    uint public decimals = 8;

    uint public INITIAL_SUPPLY = 80 * (10**6) * (10 ** uint256(decimals)) ; // 35 Billion

    /// The owner of this address:
    address public TeamAddress = 0x0;
    
    /// The owner of this address:
    address public FoundersAddress = 0x0;    
    
    /// The owner of this address:
    address public ReservedAddress = 0x0;

    uint256 TeamTokens = 4 * (10**6) * (10**uint256(decimals));
    uint256 FoundersTokens = 4 * (10**6) * (10**uint256(decimals));
    uint256 ReservedTokens = 8 * (10**6) * (10**uint256(decimals));

    constructor () public {
      totalSupply_ = INITIAL_SUPPLY;
      balances[TeamAddress] = TeamTokens; //Team and Advisers
      balances[FoundersAddress] = FoundersTokens; //Private Sale
      balances[ReservedAddress] = ReservedTokens; //Reserve
      balances[msg.sender] = INITIAL_SUPPLY - TeamTokens - FoundersTokens - ReservedTokens;

    }
    //////////////// owner only functions below

    /// @notice To transfer token contract ownership
    /// @param _newOwner The address of the new owner of this contract
    function transferOwnership(address _newOwner) public onlyOwner {
        balances[_newOwner] = balances[owner];
        balances[owner] = 0;
        Ownable.transferOwnership(_newOwner);
    }
}

