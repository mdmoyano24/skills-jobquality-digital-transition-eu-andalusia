# Skills & Job Quality in the Digital Transition (Andalusia vs EU)

Reproducible **MVP (one week)** aligned with **JRC.B.6 – Employment & Skills**.  
Live dashboard + notebook + fixed-effects baseline (robust SE for a tiny synthetic sample; full NUTS2 coming).

**Live demo:** https://skills-jobquality-andalusia.streamlit.app  
**Notebook:** [notebooks/00_quickstart.ipynb](notebooks/00_quickstart.ipynb)  
**Results (MVP):** [outputs/stata/fe_results_python_HC1.txt](outputs/stata/fe_results_python_HC1.txt) · [figure](outputs/figures/telework_andalucia.png)

---

## Overview
- Goal: explore **telework trends** and **job-quality proxies** and set up a clean pipeline for later Eurostat NUTS2 data.
- Why MVP: fast public proof-of-work for CV; structure, methods and outputs that scale to EU-wide data.

## Quickstart (local)
### Windows
```bash
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
streamlit run dashboard/app_streamlit.py

### macOS / Linux
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
streamlit run dashboard/app_streamlit.py
```
## Methods (baseline)

OLS with **region & year dummies** (FE-equivalent) + **HC1 robust SE** given the tiny sample (2 regions × 6 years).  
When the full **NUTS2** dataset is added, we will use **cluster-robust SE by region** (and optional Stata replication).

**Model**
```text
telework_share ~ temp_share + broadband + C(region) + C(year)
```

**Current sample (demo):** synthetic panel with Andalucía vs EU-27, 2019–2024.

---

## Replication

- **Python / statsmodels**  
  See the quickstart notebook and `code/python/` for scripts.

- **Stata (optional)**  
  `.do` files in `code/stata/` replicate the FE specification (`xtreg, fe`).  
  For the MVP sample we report **HC1** in Python; with NUTS2 we will switch to  
  `vce(cluster region)` in both Python and Stata.

---

## Project structure
```text
project root
├─ code/
│  ├─ python/                 # scripts (fetch, clean, descriptives, FE)
│  └─ stata/                  # 01_setup.do, 02_panel_fe.do  (optional)
├─ dashboard/
│  └─ app_streamlit.py        # minimal Streamlit app
├─ data/
│  └─ processed/
│     └─ panel_sample.csv     # synthetic sample for the demo
├─ notebooks/
│  └─ 00_quickstart.ipynb     # baseline analysis
├─ outputs/
│  ├─ figures/
│  │  └─ telework_andalucia.png
│  └─ stata/
│     └─ fe_results_python_HC1.txt
├─ README.md
├─ requirements.txt
├─ LICENSE
└─ CITATION.cff
```

---

## Roadmap
- Replace synthetic sample with **Eurostat** pulls (telework, temporary contracts, broadband/education) → build **NUTS2 panel**.
- FE with **cluster by region** + sensitivity checks; optional **Stata** replication.
- 2–3 page **policy brief** and dashboard update.
- (Stretch) Add ESCO/skills lens and simple job-quality composite.

---

## License & Citation
**License:** MIT (see `LICENSE`).  
**Cite as:** *M.D. Moyano (2025). Skills & Job Quality in the Digital Transition (Andalusia vs EU).*

---

## Contact
Issues and suggestions via **GitHub Issues**. For collaboration inquiries: *mdmoyano@gmail.com*.

