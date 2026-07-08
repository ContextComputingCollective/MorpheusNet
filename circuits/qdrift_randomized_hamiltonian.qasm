// qDRIFT Randomized Hamiltonian Simulation

OPENQASM 3.0;
include "stdgates.inc";

// Sampled j=0: coeff=+0.550000, Pauli=ZZI, effective_gamma=+0.25333333

qubit[3] q;
cx q[0], q[1];
rz(0.506666666667) q[1];
cx q[0], q[1];

// Sampled j=1: coeff=-0.420000, Pauli=XIX, effective_gamma=-0.25333333
h q[0];
h q[2];
cx q[0], q[2];
rz(-0.506666666667) q[2];
cx q[0], q[2];
h q[0];
h q[2]; 

// Sampled j=5: coeff=-0.150000, Pauli=YIY, effective_gamma=-0.25333333
sdg q[0];
h q[0];
sdg q[2];
h q[2];
cx q[0], q[2];
rz(-0.506666666667) q[2];
cx q[0], q[2];
h q[0];
s q[0];
h q[2];
s q[2];

// Sampled j=0: coeff=+0.550000, Pauli=ZZI, effective_gamma=+0.25333333
cx q[0], q[1];
rz(0.506666666667) q[1];
cx q[0], q[1];

// Sampled j=1: coeff=-0.420000, Pauli=XIX, effective_gamma=-0.25333333
h q[0];
h q[2];
cx q[0], q[2];
rz(-0.506666666667) q[2];
cx q[0], q[2];
h q[0];
h q[2];

// Sampled j=5: coeff=-0.150000, Pauli=YIY, effective_gamma=-0.25333333
sdg q[0];
h q[0];
sdg q[2];
h q[2];
cx q[0], q[2];
rz(-0.506666666667) q[2];
cx q[0], q[2];
h q[0];
s q[0];
h q[2];
s q[2];
