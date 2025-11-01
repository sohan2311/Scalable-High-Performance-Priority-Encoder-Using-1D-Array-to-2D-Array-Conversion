# Scalable High-Performance Priority Encoder Using 1D-Array to 2D-Array Conversion

[![Technology](https://img.shields.io/badge/Technology-180nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Technology](https://img.shields.io/badge/Technology-90nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Technology](https://img.shields.io/badge/Technology-45nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![EDA Software](https://img.shields.io/badge/EDA-Software-Cadence-red.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Tool](https://img.shields.io/badge/Tool-Genus-orange.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Tool](https://img.shields.io/badge/Tool-Innovus-orange.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Flow](https://img.shields.io/badge/Flow-Semi--Custom-green.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)

<div align="center">
  <img src="Images/PE 64.png" alt="Priority Encoder Project" width="800"/>
</div>

## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Design Methodology](#design-methodology)
- [Performance Results](#performance-results)
- [Implementation Results](#implementation-results)
- [Directory Structure](#directory-structure)
- [Design Flow](#design-flow)
- [Getting Started](#getting-started)
- [References](#references)
- [Author](#author)

---

## 🎯 Overview

This project implements a **scalable high-performance priority encoder** using an innovative **1D-to-2D array conversion technique**. The design demonstrates significant improvements in operating frequency and scalability through a semi-custom ASIC design flow using **Cadence tools**.

### What is a Priority Encoder?

A priority encoder is a combinational circuit that outputs the binary representation of the highest-priority active input. Applications include:
- Interrupt handling in processors
- Data compression algorithms
- Network packet classification
- TCAM (Ternary Content Addressable Memory)
- Arbitration circuits

### Innovation: 1D-to-2D Conversion

Traditional priority encoders face scalability challenges. This design converts L-bit linear input into an M×N matrix, enabling:
- Parallel processing of row and column priority detection
- Reduced critical path delay
- Better scalability for large input sizes
- Optimized (M, N) pairing for maximum performance

---

## ✨ Key Features

- 🚀 **High Performance**: Operating frequency up to 649 MHz for 64-bit encoder
- 📊 **Scalable Design**: Supports 4-bit to 4096-bit configurations
- ⚡ **Superior Speed**: 1.2× to 1.5× faster than state-of-the-art designs
- 🔧 **Semi-Custom Flow**: Complete RTL-to-GDS implementation
- 💡 **Optimized Architecture**: Smart matrix dimension selection
- 🎯 **Verified Design**: Comprehensive functional and timing verification
- 🔨 **Industry Standard**: 180nm CMOS technology

---

## 🏗️ Architecture

### Block Diagram

<div align="center">
  <img src="Images/Block Diagram.png" alt="Block Diagram" width="700"/>
</div>

### 1D-to-2D Conversion Method

The design transforms L-bit linear input into a 2D matrix structure:

```
L-bit Input Array
      ↓
M × N Matrix Formation
      ↓
├─→ Row Priority Encoder (N-bit)
└─→ Column Priority Encoder (M-bit)
      ↓
Index Combination Logic
      ↓
Final Priority Index Output
```

### Key Components

1. **Input Conversion Module**: Arranges L-bit input into M×N matrix
2. **Row Priority Encoder**: Detects highest priority in each row
3. **Column Priority Encoder**: Determines active row with highest priority
4. **Output Logic**: Combines row and column indices for final output

<div align="center">
  <img src="Images/Architechture 1D to 2D Array Conversion.png" alt="Architechture 1D to 2D Array Conversion" width="700"/>
</div>

<div align="center">
  <img src="Images/Architechture Scalable 4x16 to 64.png" alt="Architechture Scalable PE using 4x16 to PE_64" width="700"/>
</div>

---

## 🔬 Design Methodology

### Semi-Custom ASIC Design Flow

This project follows a complete **RTL-to-GDS semi-custom design flow** using Cadence tools:

```
Verilog RTL Design
      ↓
Functional Simulation (NCLaunch)
      ↓
Logic Synthesis (Genus)
      ↓
Place & Route (Innovus)
      ↓
Post-Layout Simulation
      ↓
Timing & Power Analysis
```

### Technology Specifications

| Parameter | Specification |
|-----------|--------------|
| **Process Node** | 180nm CMOS |
| **Supply Voltage** | 1.8V |
| **Corner** | TT (Typical-Typical) |
| **Temperature** | 25°C |
| **Input Sizes** | 4-bit, 8-bit, 16-bit, 64-bit, 256-bit, 2048-bit |

---

## 📊 Performance Results

### Timing Performance

| Configuration | Matrix Size | Target Freq | Achieved Freq | Critical Path | Improvement |
|--------------|-------------|-------------|---------------|---------------|-------------|
| 64-bit | 8×8 | 500 MHz | 649 MHz | 1.54 ns | 1.2× |
| 256-bit | 16×16 | 400 MHz | 520 MHz | 1.92 ns | 1.5× |

### Comparison with State-of-the-Art

This implementation achieves **1.2× to 1.5× higher operating frequency** compared to conventional priority encoder designs, while maintaining scalability across different input sizes.

---

## 🎨 Implementation Results

### Schematic Design

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/gui_schematic.png" alt="Priority Encoder -scalable 180nm Schematic" width="750"/>
  <p><em>Complete Schematic Design</em></p>
</div>

### Floorplan

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/innovus/post_nano_optimisation_without_layer.png" alt="Floorplan" width="650"/>
  <p><em>Scalable Floorplan - Optimized for Performance</em></p>
</div>

### Layout

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/innovus/post_nano_optimisation_layout.png" alt="Final Layout" width="650"/>
  <p><em>Final Layout after Place and Route</em></p>
</div>

### 3D Layout 
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/innovus/3d_layout_design.jpg" alt="Layout 3D View Front" width="650"/>
  <p><em>Final Layout 3D View Front</em></p>
</div>
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/innovus/3d_layout_back.jpg" alt="Layout 3D View Back" width="650"/>
  <p><em>Final Layout 3D View Back</em></p>
</div>

### Simulation Waveforms

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave1.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform1</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave2.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform2</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave3.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform3</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave4.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform4</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave5.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform5</em></p>
</div>

### Timing Analysis

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/nclaunch/Genus Timing Analysis.png" alt="Timing Analysis" width="800"/>
  <p><em>Timing Analysis</em></p>
</div>

### Power Analysis
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Innovus Reports/post_power_analysis.jpg" alt="Power Analysis" width="800"/>
  <p><em>Power Analysis</em></p>

### Area Report
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Innovus Reports/post_area_analysis.jpg" alt="Report - Area" width="800"/>
  <p><em>Area Report</em></p>

  
### Area Report
  
---

## 📂 Directory Structure
.............................................................................

## 🛠️ Design Flow

### Step 1: RTL Design

All Verilog RTL modules are located in [`rtl/`](./rtl) directory:
- **[4-bit Priority Encoder](./rtl/priority_encoder_4bit.v)** - Basic module
- **[8-bit Priority Encoder](./rtl/priority_encoder_8bit.v)** - Extended version
- **[64-bit Priority Encoder](./rtl/priority_encoder_64bit.v)** - Full implementation
- **[Top Module](./rtl/priority_encoder_top.v)** - Top-level design

### Step 2: Functional Simulation

Simulate using NCLaunch with testbenches in [`testbench/`](./testbench):
- Comprehensive test patterns
- Corner case verification
- Functional correctness validation

Simulation scripts: [`simulation/nclaunch/`](./simulation/nclaunch)

### Step 3: Logic Synthesis

Synthesize using **Cadence Genus**:
- Scripts: [`synthesis/scripts/`](./synthesis/scripts)
- Constraints: [`synthesis/scripts/constraints.sdc`](./synthesis/scripts/constraints.sdc)
- Reports: [`synthesis/reports/`](./synthesis/reports)
- Netlist: [`synthesis/netlist/`](./synthesis/netlist)

### Step 4: Place and Route

Implement using **Cadence Innovus**:
- Floorplan: [`pnr/scripts/floorplan.tcl`](./pnr/scripts/floorplan.tcl)
- Placement: [`pnr/scripts/placement.tcl`](./pnr/scripts/placement.tcl)
- CTS: [`pnr/scripts/cts.tcl`](./pnr/scripts/cts.tcl)
- Routing: [`pnr/scripts/routing.tcl`](./pnr/scripts/routing.tcl)
- Final Output: [`pnr/output/`](./pnr/output)

### Step 5: Verification

- **Timing Analysis**: Using Innovus timing engine
- **DRC/LVS**: Design rule and layout vs schematic checks
- **Post-Layout Simulation**: Gate-level simulation with SDF backannotation

---

## 🚀 Getting Started

### Prerequisites

```bash
# Required Tools
- Cadence Genus (Logic Synthesis)
- Cadence Innovus (Place & Route)
- Cadence NCLaunch/Xcelium (RTL Simulation)
- 180nm / 90nm / 45nm CMOS Technology Library
```

### Clone Repository

```bash
git clone https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion.git
cd Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion
```

### Run RTL Simulation

```bash
cd simulation/nclaunch
nclaunch -gui -f run_sim.tcl
```

Or for batch mode:
```bash
ncverilog -f filelist.f +define+SIM +define+FUNCTIONAL
```

### Run Synthesis

```bash
cd synthesis/scripts
genus -f synthesis.tcl -log ../logs/genus.log
```

### Run Place and Route

```bash
cd pnr/scripts
innovus -init innovus_run.tcl -log ../logs/innovus.log
```

### Complete Flow

Run the entire flow using automation script:
```bash
./scripts/run_all.sh
```

---

## 🔧 Tools Used

| Tool | Purpose | Version |
|------|---------|---------|
| **Cadence Genus** | Logic Synthesis | 21.1 |
| **Cadence Innovus** | Place & Route | 21.1 |
| **Cadence NCLaunch/Xcelium** | RTL Simulation | 21.09 |
| **Technology** | GPDK 180nm | 180nm CMOS |

### File Formats

- **RTL**: `.v` (Verilog)
- **Testbench**: `.v` (Verilog)
- **Scripts**: `.tcl` (TCL)
- **Constraints**: `.sdc` (Synopsys Design Constraints)
- **Netlist**: `.v` (Gate-level Verilog)
- **Layout**: `.gds` (GDSII)
- **Timing**: `.sdf` (Standard Delay Format)

---

## 📚 References

1. **Huang, W.-C., & Oklobdzija, V. G.** (2017). "A Scalable High-Performance Priority Encoder Using 1D-Array to 2D-Array Conversion." *IEEE Transactions on Circuits and Systems—II: Express Briefs*.

2. **Cadence Design Systems** - Genus Synthesis User Guide

3. **Cadence Design Systems** - Innovus Implementation User Guide

4. **Weste, N. H. E., & Harris, D.** (2011). *CMOS VLSI Design: A Circuits and Systems Perspective* (4th ed.).


---

## 👤 Author

**Sohan Maity**

- GitHub: [@sohan2311](https://github.com/sohan2311)
- Project Link: [Priority Encoder Repository](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)

---

## 📞 Contact

For questions or collaboration:
- **GitHub Issues**: [Open an Issue](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion/issues)
- **Email**: [sohan.maity2311@gmail.com]

---

<div align="center">
  <p><strong>⭐ If you find this project useful, please give it a star! ⭐</strong></p>
  <p>© 2025 | IIITDM Kurnool - All Rights Reserved.</p>
</div>
