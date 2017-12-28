namespace Quantum.HelloWorld
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Set (desired: Result, q1: Qubit) : ()
    {
        body
        {
		
		// This operation may now be called to set a qubit in a known state (Zero or One). We measure the qubit, if it's in the state we want, we leave it alone, otherwise, we flip it with the X gate.
		
            let current  = M(q1);
			if(desired != current)
			{
				X(q1);
			}
        }
    }

	operation BellTest(count: InT, initial: Result) : (Int,Int)
	{
		body
		{
			mutable numOnes = 0;
			using (qubits = Qubit[1])
			{
				for(test in 1..count)
				{
					Set(initial, qubits[0]);
					let res = M(qubits[0]);
					if(res == One)
					{
						set numOnes = numOnes+1
					}
				}
			}
			Set(Zero, qubits[0])
		}
		return (count-numOnes, numOnes);
	}
}
