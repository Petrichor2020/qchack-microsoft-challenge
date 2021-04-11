namespace QCHack.Task3 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 3 (5 points). f(x) = 1 if at least two of three input bits are different - hard version
    //
    // Inputs:
    //      1) a 3-qubit array "inputs",
    //      2) a qubit "output".
    // Goal: Implement a marking oracle for function f(x) = 1 if at least two of the three bits of x are different.
    //       That is, if both inputs are in a basis state, flip the state of the output qubit 
    //       if and only if the three bits written in the array "inputs" have both 0 and 1 among them,
    //       and leave the state of the array "inputs" unchanged.
    //       The effect of the oracle on superposition states should be defined by its linearity.
    //       Don't use measurements; the implementation should use only X gates and its controlled variants.
    //       This task will be tested using ToffoliSimulator.
    // 
    // For example, the result of applying the operation to state (|001⟩ + |110⟩ + |111⟩)/√3 ⊗ |0⟩
    // will be 1/√3|001⟩ ⊗ |1⟩ + 1/√3|110⟩ ⊗ |1⟩ + 1/√3|111⟩ ⊗ |0⟩.
    //
    // In this task, unlike in task 2, you are not allowed to use 4-qubit gates, 
    // and you are allowed to use at most one 3-qubit gate.
    // Warning: some library operations, such as ApplyToEach, might count as multi-qubit gate,
    // even though they apply single-qubit gates to separate qubits. Make sure you run the test
    // on your solution to check that it passes before you submit the solution!
    operation Task3_ValidTriangle (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // //Setting bitstrings for flipping
        let pattern1 = [false, false, true];
        let pattern2 = [false, true, false];
        let pattern3 = [false, true, true];
        let pattern4 = [true, false, false];
        let pattern5 = [true, false, true];
        let pattern6 = [true, true, false];
        let pattern7 = [false, false, false];
        let numElements = Length(inputs);

        within {
            for (index in 0 .. numElements - 1){
                if (not pattern1[index]) {
                    X(inputs[index]);
                }
                elif (not pattern2[index]) {
                    X(inputs[index]);
                }
                elif (not pattern3[index]) {
                    X(inputs[index]);
                }
                elif (not pattern4[index]) {
                    X(inputs[index]);
                }
                elif (not pattern5[index]) {
                    X(inputs[index]);
                }
                elif (not pattern6[index]) {
                    X(inputs[index]);
                }
                elif (not pattern7[index]) {
                    X(inputs[index]);
                }
                else{
                    //X(inputs[index]);
                    //do nothing
                }
                
            }
        } apply {

            use anc = Qubit();
            CCNOT(inputs[0],inputs[1],output);
            //CNOT(anc,output);
            //CCNOT(inputs[0],inputs[1],anc);
        }



        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern1[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //      //Controlled X(Most(inputs), Tail(inputs));

        //     //  use anc1 = Qubit();
        //     //  use anc2 = Qubit();
        //     //  CNOT(inputs[0],anc1);
        //     //  CNOT(inputs[1],anc2);
        //     //  X(anc2);
        //     //  CNOT(anc1,anc2);
        //     //  CNOT(anc2, output);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);



        //     //  let m = Most(inputs);
        //     //  let t = Tail(inputs);
        //     //  CNOT(m,t);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern2[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     //CNOT(Most(inputs), Tail(inputs));
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
            
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern3[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     //CNOT(Most(inputs), Tail(inputs));
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern4[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern5[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     //CNOT(Most(inputs), Tail(inputs));
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern6[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     //CNOT(Most(inputs), Tail(inputs));
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }

        // within {
        //     for (index in 0 .. numElements - 1){
        //         if (not pattern7[index]) {
        //             X(inputs[index]);
        //         }
        //     }
        // } apply {
        //     //Controlled X(Most(inputs), Tail(inputs));
        //     //CNOT(inputs[0], output);
        //     //CNOT(Most(inputs), Tail(inputs));
        //     // let m = Most(inputs);
        //     // let t = Tail(inputs);
        //     // CNOT(m,t);

        //     use anc = Qubit();
        //     CCNOT(inputs[0],inputs[1],anc);
        //     CNOT(anc,output);
        //     CCNOT(inputs[0],inputs[1],anc);

        //     // use anc1 = Qubit();
        //     // CNOT(inputs[0],anc1);
        //     // CNOT(inputs[0],output);
        //     // CNOT(inputs[1],output);
        //     // CNOT(anc1,output);
        //     // CNOT(inputs[0],anc1);
        // }
    }
}
