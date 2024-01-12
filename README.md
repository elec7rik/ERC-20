# ERC20-Token
This project contains a basic implementation of a basic `ERC20` token.\
It **DOES NOT** have all the functionality and I have only created it for learning purpose.\
\
`ManualToken.sol` is the manual implementation.\
\
`OurToken.sol` uses the **OpenZeppelin contracts**
`DeployOurToken.s.sol` is the deploy script for the project.
\
\
`OurTokenTest.t.sol` contains basic tests for the project.

#### OpenZeppelin contracts installation:
```$forge install OpenZeppelin/openzeppelin-contracts --no-commit```

#### Importing OpenZeppelin's `ERC20.sol` to `OurToken.sol`
```$import "@openzeppelin/contracts/token/ERC20/ERC20.sol"```

