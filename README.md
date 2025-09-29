⚡ ECSE 563 – Assignment 1: Network Analysis






📌 Overview

This repository contains my solutions for Assignment 1 of ECSE 563: Power System Operation and Planning (Fall 2025) at McGill University.

The project covers:

✅ Y-matrix (admittance) construction

✅ Z-matrix (impedance) without explicit inversion

✅ Balanced 3-phase fault analysis

✅ Generalized Thévenin equivalents

✅ Generalized fault/interconnection studies (IEEE-9 & IEEE-24 bus)

📂 Structure
├── src/                # MATLAB functions
│   ├── admittance.m
│   ├── impedance.m
│   ├── fault.m
│   ├── genthevenin.m
│   └── genfault.m
│
├── data/               # IEEE test systems
│   ├── ieee9_A1.m
│   └── ieee24_A1.m
│
├── report/             # Final PDF report
│   └── DT_A1.pdf
│
├── figs/               # Exported figures (optional)
│
└── README.md

🚀 Quick Start

Clone:

git clone https://github.com/<your-username>/ECSE563-A1.git
cd ECSE563-A1


MATLAB setup:

addpath('src');
addpath('data');


Examples:

% Q1: Build Y-matrix
ieee9_A1; Y9 = admittance(nfrom, nto, r, x, b);

% Q2: Build Z-matrix
Z9 = impedance(nfrom, nto, r, x, b);

% Q3: Bolted fault at bus 3
[If, Vf] = fault(Y9, Iint, 3, 0);

% Q4: Thévenin (buses 3 & 5)
[Eeq, Zeq] = genthevenin(Y9, Iint, [3 5]);

% Q5: Generalized fault (connect node 1 ↔ 5)
[IT, VNF] = genfault(Y9, Y9, Iint, Iint, 1, 5);

📊 Features

Sparse Y-matrix with symmetry & residual checks

Z-matrix computed without inversion (using \)

Automated bolted fault analysis across all buses

Multi-port Thévenin equivalents (numeric + schematic)

Generalized fault modeling: outages & interconnections

Clean plots: bus voltages, fault currents, impedance heatmaps

📖 Report

Full write-up: report/DT_A1.pdf

Includes derivations, validation evidence, figure captions with numerical notes, and physical interpretations.

🧪 Validation Highlights

Residuals ~ 1e-14 to 1e-16 (machine precision)

Voltage profiles act as expected (normal vs. fault vs. interconnection)

Tie-line currents align with ΔV magnitude/angle theory

📌 Lessons Learned

Sparsity = efficiency

Avoiding inversion = stability

Fault severity depends on Thevenin impedance

Thévenin simplifies subsystem studies

Generalized faults model real-world interconnections

⚖️ License

MIT — see LICENSE
.
