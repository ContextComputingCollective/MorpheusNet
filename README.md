# MorpheusNet

Hamiltonian Simulations of Sublime Kind

## qDRIFT OpenQASM 3 simulation

This checkout includes the provided qDRIFT randomized Hamiltonian simulation as
OpenQASM 3.0 and a runner that compiles it with IBM Qiskit, transpiles it for
Qiskit Aer, and submits it to the local Aer simulator.

```bash
/Users/gokulalex/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python scripts/run_qdrift_ibm_aer.py
```

The default run writes:

- `outputs/qdrift_ibm_aer_transpiled.qasm` with the compiled OpenQASM 3.0
  circuit emitted after Qiskit transpilation.
- `outputs/qdrift_ibm_aer_result.json` with the source circuit metrics,
  compiled simulator circuit metrics, statevector probabilities, and sampled
  shot counts.
