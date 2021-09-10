OPENQASM 2.0;
include "qelib1.inc";
gate grover_diffusion(param) q, r {
  h q;
  h r;
  z q;
  z r;
  cz r, q;
  h q;
  h r;
}

gate oracle(param) q, r {
  cz r, q;
  cx q, r;
}

qreg q[2];
creg c[2];

reset q[0];
reset q[1];
h q[0];
h q[1];
oracle(pi/2) q[0],q[1];
grover_diffusion(pi/2) q[0],q[1];
