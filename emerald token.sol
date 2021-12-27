// SPDX-License-Identifier: MIT;


pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract emrld is ERC20 { //the is helps the token inherit the features of the openzeppline erc20
    address public admin;
    constructor() ERC20('emerald', 'ERT') {
        _mint(msg.sender, 10000 *10 **18);
        admin =msg.sender;

    }
   
//in order to enable access control and prevent just anyone from creating a token, we'd initiate an admin instance

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }

    function burn(uint amount ) external {
        _burn(msg.sender, amount);
    }
}