//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract ManualToken {
    
    mapping(address => uint256) s_balances;

    function name() public pure returns(string memory) {
        //retuns the name of the token
        return "ERC20";
    }

    function decimals() public pure returns(uint8) {
        // returns the number of decimals the token uses
        // 18 means to divide the token amount by 10^18
        return 18;
    }

    function totalSupply() public pure returns(uint256) {
        // returns the total supply of the token
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns(uint256) {
        // retuns the account balance of another account with address _owner
        return s_balances[_owner];
        // return address(_owner).balance;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        // transfer _value amount of tokens to addr _to
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] = s_balances[msg.sender] - _value;
        s_balances[_to] = s_balances[_to] + _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
        return true;

    }

}