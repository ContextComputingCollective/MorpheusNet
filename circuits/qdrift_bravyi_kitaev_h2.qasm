// qDRIFT randomized Hamiltonian simulation after Bravyi-Kitaev mapping.
//
// Model: 4-qubit active-space H2-style fermionic Hamiltonian after an offline
// Bravyi-Kitaev transform. OpenQASM receives the mapped Pauli Hamiltonian and
// implements one sampled qDRIFT trajectory as Pauli product evolutions.
//
// Mapped Pauli terms, excluding the identity energy offset:
//   +0.171201 ZIII
//   +0.171201 IZII
//   -0.222796 IIZI
//   -0.222796 IIIZ
//   +0.168623 ZZII
//   +0.120546 ZIZI
//   +0.165868 ZIIZ
//   +0.165868 IZZI
//   +0.120546 IZIZ
//   +0.174349 IIZZ
//   -0.045322 XXYY
//   +0.045322 XYYX
//   +0.045322 YXXY
//   -0.045322 YYXX
//
// qDRIFT parameters:
//   lambda = sum_j |coeff_j| = 1.885082
//   evolution_time = 0.4
//   samples = 8
//   gamma = lambda * evolution_time / samples = 0.0942541
//   RZ angle = 2 * signed_gamma = +/-0.1885082

OPENQASM 3.0;
include "stdgates.inc";

// Custom gates for different Pauli product evolutions
// Single-qubit Z rotation
gate pauli_z(theta) a {
  rz(theta) a;
}

// Two-qubit ZZ interaction
gate pauli_zz(theta) a, b {
  cx a, b;
  rz(theta) b;
  cx a, b;
}

// Four-qubit XYYX interaction
// Transforms basis using Hadamard and S-dagger gates
// Applies controlled-Z rotations through CNOT ladder
// Returns to original basis
gate pauli_xyyx(theta) a, b, c, d {
  h a;
  sdg b;
  h b;
  sdg c;
  h c;
  h d;
  cx a, d;
  cx b, d;
  cx c, d;
  rz(theta) d;
  cx c, d;
  cx b, d;
  cx a, d;
  h a;
  h b;
  s b;
  h c;
  s c;
  h d;
}

// Four-qubit YXXY interaction
// Y-basis transformations
gate pauli_yxxy(theta) a, b, c, d {
  sdg a;
  h a;
  h b;
  h c;
  sdg d;
  h d;
  cx a, d;
  cx b, d;
  cx c, d;
  rz(theta) d;
  cx c, d;
  cx b, d;
  cx a, d;
  h a;
  s a;
  h b;
  h c;
  h d;
  s d;
}

// Four-qubit YYXX interaction
// Combination of S-dagger and Hadamard gates
gate pauli_yyxx(theta) a, b, c, d {
  sdg a;
  h a;
  sdg b;
  h b;
  h c;
  h d;
  cx a, d;
  cx b, d;
  cx c, d;
  rz(theta) d;
  cx c, d;
  cx b, d;
  cx a, d;
  h a;
  s a;
  h b;
  s b;
  h c;
  h d;
}

qubit[4] q;

// Bravyi-Kitaev encoded Hartree-Fock seed state |1100>.
// This prepares the Hartree-Fock state in the BK encoding
x q[0];
x q[1];

// Sample 0: coeff=-0.222796, Pauli=IIZI, signed_gamma=-0.0942541
pauli_z(-0.1885082) q[2];

// Sample 1: coeff=+0.168623, Pauli=ZZII, signed_gamma=+0.0942541
pauli_zz(0.1885082) q[0], q[1];

// Sample 2: coeff=+0.045322, Pauli=XYYX, signed_gamma=+0.0942541
pauli_xyyx(0.1885082) q[0], q[1], q[2], q[3];

// Sample 3: coeff=-0.222796, Pauli=IIIZ, signed_gamma=-0.0942541
pauli_z(-0.1885082) q[3];

// Sample 4: coeff=+0.174349, Pauli=IIZZ, signed_gamma=+0.0942541
pauli_zz(0.1885082) q[2], q[3];

// Sample 5: coeff=-0.045322, Pauli=YYXX, signed_gamma=-0.0942541
pauli_yyxx(-0.1885082) q[0], q[1], q[2], q[3];

// Sample 6: coeff=+0.165868, Pauli=ZIIZ, signed_gamma=+0.0942541
pauli_zz(0.1885082) q[0], q[3];

// Sample 7: coeff=+0.045322, Pauli=YXXY, signed_gamma=+0.0942541
pauli_yxxy(0.1885082) q[0], q[1], q[2], q[3];
