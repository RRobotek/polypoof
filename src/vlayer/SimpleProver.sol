// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Prover} from "vlayer-0.1.0/Prover.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

contract SimpleProver is Prover {
    IERC20 immutable token;
    uint256 immutable blockNo;

    constructor(address _token, uint256 _blockNo) {
        token = IERC20(_token);
        blockNo = _blockNo;
        //token = IERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
        //blockNo = 64342531;
    }

    function balance(address _owner) public returns (Proof memory, address, uint256) {
        setBlock(blockNo);
        uint256 ownerBalance = token.balanceOf(_owner);

        return (proof(), _owner, ownerBalance);
    }
}
