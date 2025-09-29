# ⚡ ECSE 563 – Assignment 1: Network Analysis  

[![MATLAB](https://img.shields.io/badge/MATLAB-R2025b-blue?logo=mathworks)](https://www.mathworks.com/)  
![Power Systems](https://img.shields.io/badge/Topic-Power%20Systems-green)  


---

## 📌 Overview  
Solutions for **Assignment 1** of *ECSE 563: Power System Operation and Planning (Fall 2025)* at McGill University.  

This project covers:  
- ✅ Y-matrix (admittance) construction  
- ✅ Z-matrix (impedance) without explicit inversion  
- ✅ Balanced 3-phase fault analysis  
- ✅ Generalized Thévenin equivalents  
- ✅ Generalized fault/interconnection studies (IEEE-9 & IEEE-24 bus)  

---

## 📂 Structure  
src/ → MATLAB functions (admittance, impedance, fault, genthevenin, genfault)  
data/ → IEEE test systems (ieee9_A1.m, ieee24_A1.m)  
report/ → Final PDF report (DT_A1.pdf)  
README.md → This file  

---

## 🚀 Quick Start  

Clone the repo:  
```bash
git clone https://github.com/<your-username>/ECSE563-A1.git
cd ECSE563-A1
```

Set up MATLAB paths:  
```matlab
addpath('src');
addpath('data');
```

Run examples:  
```matlab
% Build Y-matrix
ieee9_A1; Y9 = admittance(nfrom, nto, r, x, b);

% Build Z-matrix
Z9 = impedance(nfrom, nto, r, x, b);

% Fault at bus 3
[If, Vf] = fault(Y9, Iint, 3, 0);

% Thevenin equivalent (buses 3 & 5)
[Eeq, Zeq] = genthevenin(Y9, Iint, [3 5]);

% Generalized fault (connect node 1 ↔ 5)
[IT, VNF] = genfault(Y9, Y9, Iint, Iint, 1, 5);
```

---

## 📊 Features  
- Sparse Y-matrix with symmetry & residual checks  
- Z-matrix via backslash (`\`), no explicit inversion  
- Automated bolted fault analysis at all buses  
- Multi-port Thévenin equivalents (numeric + schematic)  
- Generalized fault modeling: outages & interconnections  
- Clean plots: voltages, fault currents, impedance heatmaps  

---

## 📖 Report  
Full write-up: [report/DT_A1.pdf](report/DT_A1.pdf)  

---

## 🧪 Validation Highlights  
- Residuals ~ **1e-14 to 1e-16** (machine precision)  
- Voltage profiles: stable normally, collapse under faults, shift with interconnections  
- Tie-line currents: match ΔV theory  

---

## 📌 Lessons Learned  
- Sparsity = efficiency 🚀  
- Avoiding inversion = stability 🔒  
- Fault severity ↔ Thevenin impedance ⚡  
- Thévenin simplifies subsystem studies 🔍  
- Generalized faults ≈ real-world interconnections 🔗  

---



---

Thanks for reading
