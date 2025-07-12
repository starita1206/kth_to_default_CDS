# k-th to default CDS basket pricing using Copula and Monte Carlo Simulation

This project implements a pricing model for **k-th to default Credit Default Swaps (CDS)** using a **copula-based dependency structure** and **Monte Carlo simulation with low-discrepancy sequences**. It also models **piecewise constant hazard rates** for each reference entity, enabling flexible calibration to market spreads.

## General
- **Notebook format**: Fully self-contained with explanations, visual outputs, and numerical validation, sensitivity analysis and simple stresstesting
- Files in This Repository:
  - Folder `python` - main code (ipynb), market data and Matlab code
  - kth_to_default_CDS.html - rendered notebook for quick viewing
  - README.md - this file

## Overview

- **Instrument**: k-th to default CDS (a basket credit derivative)
- **Dependency model**: Gaussian copula and t-copula
- **Numerical method**: Monte Carlo simulation with Sobol and Halton sequences
- **Default times**: Simulated from exponential distributions with piecewise constant hazard rates
- **Risk analysis**: Includes basic sensitivity tests and stress scenarios

## Python Environment

This project was built and tested in **Python 3.13**. Key libraries include:

- `numpy` - vectorized numerical operations
- `pandas` - data manipulation
- `scipy.stats` - copula construction and distribution tools
- `sobol_seq` - low-discrepancy sequence generation
- `matplotlib` and `plotly` - for plotting and visualization
- `seaborn` - optional, for plot styling
