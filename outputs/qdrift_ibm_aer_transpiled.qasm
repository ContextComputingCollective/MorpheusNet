OPENQASM 3.0;
include "stdgates.inc";
gate rzz(p0) _gate_q_0, _gate_q_1 {
  cx _gate_q_0, _gate_q_1;
  rz(p0) _gate_q_1;
  cx _gate_q_0, _gate_q_1;
}
gate unitary _gate_q_0, _gate_q_1 {
  U(pi, -1.8157749899217608, -0.24497866312686423) _gate_q_0;
  U(pi/4, -pi/2, 0) _gate_q_1;
  cx _gate_q_0, _gate_q_1;
  U(2.634925986922793, -pi, -pi/2) _gate_q_0;
  U(1.633654255039299, 1.9217712382441858, -1.9217712382441856) _gate_q_1;
  cx _gate_q_0, _gate_q_1;
  U(pi/2, 0, -pi) _gate_q_0;
  U(3*pi/4, -pi, pi/2) _gate_q_1;
}
gate unitary_0 _gate_q_0, _gate_q_1 {
  U(pi, -pi, -pi/2) _gate_q_0;
  U(3*pi/4, -pi/2, -pi) _gate_q_1;
  cx _gate_q_0, _gate_q_1;
  U(2.634925986922793, -pi, -pi/2) _gate_q_0;
  U(1.6336542550392987, 1.921771238244185, -1.921771238244185) _gate_q_1;
  cx _gate_q_0, _gate_q_1;
  U(pi/2, 0, -pi) _gate_q_0;
  U(3*pi/4, -pi, -pi/2) _gate_q_1;
}
qubit[3] q;
u3(pi, pi/2, -pi/2) q[0];
rzz(-0.5066666666669999) q[0], q[1];
u2(-pi, -pi) q[0];
unitary q[0], q[2];
u3(pi, pi/2, -pi/2) q[0];
rzz(-0.5066666666669999) q[0], q[1];
u2(-pi, -pi) q[0];
unitary_0 q[0], q[2];
