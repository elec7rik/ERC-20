##ERC20-Token
This project consists a basic implementation of a basic ERC20 token.
It DOES NOT have all the functionality and I have only created it for learning purpose.
ManualToken.sol is the manual implementation.
OurToken.sol makes use of OpenZeppelin contracts ->
Installation:
# $forge install OpenZeppelin/openzeppelin-contracts --no-commit
Importing OpenZeppelin's ERC20.sol to OurToken.sol
# $import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
DeployOurToken.s.sol is the deploy script for the project.
OurTokenTest.t.sol contains basic tests for the project.