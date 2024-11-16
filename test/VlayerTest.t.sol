import {VTest} from "vlayer-0.1.0/testing/VTest.sol";
import {Proof} from "vlayer-0.1.0/Proof.sol";

import {SimpleProver} from "../src/vlayer/SimpleProver.sol";
import {SimpleVerifier} from "../src/vlayer/SimpleVerifier.sol";

contract WebProverTest is VTest {
    
    SimpleProver prover = new SimpleProver(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174, 64342531);
    SimpleVerifier verifier = new SimpleVerifier(address(prover), 0xc47Fdcc4CCb5BF6C94007BEaFbD37FF36AA9fFCb);

    function test_mainProver() public {
        callProver(); // The next call will execute in the Prover

        (Proof memory _proof, address _owner, uint256 _balance) = prover.balance(0xc47Fdcc4CCb5BF6C94007BEaFbD37FF36AA9fFCb);

        //Proof memory proof = getProof();
        verifier.claimWhale(_proof, _owner, _balance);
    }
}
