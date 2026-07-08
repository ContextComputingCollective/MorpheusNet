# MorpheusNet
The qDRIFT (quantum stochastic drift) algorithm is a randomized Hamiltonian simulation technique that approximates time evolution under a Hamiltonian by sampling Pauli terms according to their coefficient magnitudes.

## qDRIFT OpenQASM 3 simulation

This checkout includes qDRIFT randomized Hamiltonian simulations as OpenQASM
3.0 and a runner that compiles them with IBM Qiskit, transpiles them for Qiskit
Aer, and submits them to the local Aer simulator.

```bash
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

### Bravyi-Kitaev mapped qDRIFT run

`circuits/qdrift_bravyi_kitaev_h2.qasm` contains a four-qubit qDRIFT trajectory
for a Bravyi-Kitaev mapped active-space Hamiltonian. Run it with:

```bash
python scripts/run_qdrift_ibm_aer.py \
  --qasm circuits/qdrift_bravyi_kitaev_h2.qasm \
  --output outputs/qdrift_bravyi_kitaev_ibm_aer_result.json \
  --compiled-qasm outputs/qdrift_bravyi_kitaev_ibm_aer_transpiled.qasm
```
