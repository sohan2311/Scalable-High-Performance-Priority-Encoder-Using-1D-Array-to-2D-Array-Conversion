# Scalable High-Performance Priority Encoder Using 1D-Array to 2D-Array Conversion

[![Technology](https://img.shields.io/badge/Technology-180nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Technology](https://img.shields.io/badge/Technology-90nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Technology](https://img.shields.io/badge/Technology-45nm%20CMOS-blue.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![EDA](https://img.shields.io/badge/EDA-Cadence-red.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Tool](https://img.shields.io/badge/Tool-Genus-orange.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Tool](https://img.shields.io/badge/Tool-Innovus-orange.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)
[![Flow](https://img.shields.io/badge/Flow-Semi--Custom-green.svg)](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)

<div align="center">
  <img src="Images/PE 64.png" alt="Priority Encoder Project" width="800"/>
  <p><em>The architecture of PE64 with (a) (M, N) = (4, 16) and (b) (M, N) = (16, 4)</em></p>
</div>

## 📋 Table of Contents

- [Overview](##overview)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Design Methodology](#design-methodology)
- [Performance Results](#performance-results)
- [Implementation Results](#implementation-results)
- [Complete Design Flow](#complete-design-flow)
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
- 🔨 **Industry Standard**: 180nm/90nm/45nm CMOS technology

---

## 🏗️ Architecture

### Block Diagram

<div align="center">
  <img src="Images/Block Diagram.png" alt="Block Diagram" width="700"/>
  <p><em>Block diagram of conventional priority encoder PE64 and Parallel priority encoder of 64-bit (PE64) (Kun et al. 2004)</em></p>
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

### Architecture Diagrams

<div align="center">
  <img src="Images/Architechture 1D to 2D Array Conversion.png" alt="Architecture 1D to 2D Array Conversion" width="700"/>
  <p><em>The architecture of PE64 (a) without look-ahead signal and (b) with look-ahead signal</em></p>
</div>

<div align="center">
  <img src="Images/Architechture Scalable 4x16 to 64.png" alt="Architecture Scalable PE using 4x16 to PE_64" width="700"/>
  <p><em>The architecture of PE64 with (a) (M, N) = (4, 16) and (b) (M, N) = (16, 4) </em></p>
</div>

---

## 🔬 Design Methodology

### Semi-Custom ASIC Design Flow

This project follows a complete **RTL-to-GDS semi-custom design flow** using Cadence tools:

```
RTL Design (Verilog)
      ↓
Functional Simulation (NCLaunch/Incisive)
      ↓
Logic Synthesis (Genus)
      ↓
Physical Design (Innovus)
      ├─→ Floorplanning
      ├─→ Power Planning
      ├─→ Placement
      ├─→ Clock Tree Synthesis
      └─→ Routing
      ↓
Post-Layout Verification
      ↓
GDS II Generation
```

### Technology Specifications

| Parameter | Specification |
|-----------|--------------|
| **Process Nodes** | 180nm / 90nm / 45nm CMOS |
| **Supply Voltage** | 1.8V (180nm), 1.0V (90nm), 0.9V (45nm) |
| **Corner** | TT (Typical-Typical) |
| **Temperature** | 25°C |
| **Input Sizes** | 4-bit, 8-bit, 16-bit, 64-bit, 64-bit with mux, 256-bit |

---

## 📊 Performance Results

### Timing Performance

| Configuration | Matrix Size | Target Freq | Achieved Freq | Critical Path | Improvement |
|--------------|-------------|-------------|---------------|---------------|-------------|
| 64-bit | 16×4 | 500 MHz | 649 MHz | 1.54 ns | 1.2× |
| 256-bit | 64×4 | 400 MHz | 520 MHz | 1.92 ns | 1.5× |

### Comparison with State-of-the-Art

This implementation achieves **1.2× to 1.5× higher operating frequency** compared to conventional priority encoder designs, while maintaining scalability across different input sizes.

---

## 🎨 Implementation Results

### Schematic Design

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/gui_schematic.png" alt="Priority Encoder Scalable 180nm Schematic" width="750"/>
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

### 3D Layout Views

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
  <p><em>Functional Verification Waveform 1</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave2.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform 2</em></p>
</div>
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave3.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform 3</em></p>
</div>
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave4.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform 4</em></p>
</div>
<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 180nm)/Waveforms/wave5.png" alt="Functional Simulation" width="800"/>
  <p><em>Functional Verification Waveform 5</em></p>
</div>

### Analysis Reports

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Images/nclaunch/Genus Timing Analysis.png" alt="Timing Analysis" width="800"/>
  <p><em>Timing Analysis Report</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Innovus Reports/post_power_analysis.jpg" alt="Power Analysis" width="800"/>
  <p><em>Power Analysis Report</em></p>
</div>

<div align="center">
  <img src="Scalable PE64/scalable_PE64 (main - 90nm)/Innovus Reports/post_area_analysis.jpg" alt="Area Report" width="800"/>
  <p><em>Area Report</em></p>
</div>

---

## 🛠️ Complete Design Flow

### Prerequisites

Before starting the design flow, ensure the following:

1. **Licensing Server** is switched ON and client is connected
2. **Cadence Tools** are properly installed and licensed
3. **Technology Libraries** (180nm/90nm/45nm) are available

### Environment Setup

```bash
# Open terminal in project directory
csh
source /home/install/cshrc
# You should see: "Welcome to Cadence Tool Suite"
```

---

### Module 1: RTL Design

Create Verilog RTL code for the priority encoder design.

**Commands:**
```bash
# Create RTL file
gedit priority_encoder_64bit.v

# Create testbench file
gedit tb_priority_encoder_64bit.v
```

**Files to Create:**
- `priority_encoder_4bit.v` - 4-bit basic encoder
- `priority_encoder_8bit.v` - 8-bit encoder
- `priority_encoder_64bit.v` - 64-bit scalable encoder
- `tb_priority_encoder_64bit.v` - Comprehensive testbench

---

### Module 2: Functional Simulation Using NCLaunch/Incisive

**Step 1: Launch NCLaunch**
```bash
nclaunch -new    # First time only
nclaunch         # Subsequent runs
```

**Step 2: Create cds.lib File**
- Select **Multiple Step**
- Select **Create cds.lib**
- Choose library type based on RTL (Verilog/VHDL)
- Save the cds.lib file

**Step 3: Compilation, Elaboration, and Simulation**

The simulation runs in 3 stages:

1. **Compilation**
   - Select `.v` or `.vhdl` files
   - Click on **Verilog Compiler** or **VHDL Compiler**
   - Modules appear under "Worklib" after successful compilation

2. **Elaboration**
   - Select module under Worklib
   - Click **Launch Elaborator**
   - "Snapshots" are generated on success

3. **Simulation**
   - Select testbench under snapshots
   - Click **Launch Simulator**
   - Design Browser opens showing module hierarchy

**Step 4: Waveform Analysis**
- Right-click on signals → **Send to Waveform Window**
- Click **Run simulation** to start
- Use **pause** to stop simulation
- Analyze waveforms using zoom controls

**Verification Checklist:**
- ✓ All input combinations tested
- ✓ Priority logic verified
- ✓ Edge cases validated
- ✓ Timing behavior checked

---

### Module 3: Logic Synthesis Using Genus

**Inputs Required:**
1. RTL Code (`.v` or `.vhdl`)
2. Chip-level SDC (System Design Constraints)
3. Liberty Files (`.lib`)

**Expected Outputs:**
1. Gate-level netlist
2. Block-level netlist
3. Timing, Area, Power reports

**Synthesis Stages:**
- **Translation**: RTL codes are compiled
- **Elaboration/Mapping**: Logic replaced with gates from libraries
- **Optimization**: Cell count reduction without functionality loss

**Step 1: Create Synthesis Script**

Create `run.tcl`:
```tcl
# Set design name
set DESIGN priority_encoder_64bit

# Read Liberty files
read_libs /path/to/library.lib

# Read RTL
read_hdl priority_encoder_64bit.v

# Elaborate design
elaborate $DESIGN

# Read constraints
read_sdc constraints.sdc

# Synthesize to generic gates
syn_generic

# Synthesize to technology gates
syn_map

# Optimize design
syn_opt

# Write outputs
write_hdl > ${DESIGN}_netlist.v
write_sdc > ${DESIGN}_block.sdc

# Generate reports
report_timing > timing_report.txt
report_area > area_report.txt
report_power > power_report.txt

# Launch GUI
gui_show
```

**Step 2: Create SDC File**

Create `constraints.sdc`:
```tcl
# Clock definition
create_clock -name clk -period 2.0 [get_ports clk]

# Input/Output delays
set_input_delay -clock clk 0.5 [all_inputs]
set_output_delay -clock clk 0.5 [all_outputs]

# Load constraints
set_load 0.1 [all_outputs]
```

**Step 3: Run Synthesis**
```bash
genus -f run.tcl
```

**Step 4: Analyze Results**
- **Schematic Viewer**: Right-click on design → Schematic Viewer → In Main
- **Timing Report**: Check worst timing paths
- **Area Report**: Verify cell count and total area
- **Power Report**: Analyze power consumption

---

### Module 4: Physical Design Using Innovus

**Mandatory Inputs:**
1. Gate-level netlist (from Synthesis)
2. Block-level SDC (from Synthesis)
3. Liberty files (`.lib`)
4. LEF files (Layer Exchange Format)

**Expected Outputs:**
1. GDS II file (for fabrication)
2. Post-layout netlists
3. Timing, power, area reports
4. DRC/LVS clean layout

**Launch Innovus:**
```bash
innovus
```

---

### Module 4.1: Import Design

**Step 1: Create Globals File**

Create `design.globals`:
```tcl
# Set design name
set DESIGN priority_encoder_64bit

# Read LEF files
read_lef /path/to/tech.lef
read_lef /path/to/cells.lef

# Read netlist
read_netlist ${DESIGN}_netlist.v

# Initialize design
init_design
```

**Step 2: Create View File**

Create `design.view`:
```tcl
# Read Liberty files
read_libs /path/to/library.lib

# Read SDC
read_sdc ${DESIGN}_block.sdc
```

**Step 3: Import in Innovus**
```tcl
source design.globals
```

The design is imported and core area is calculated automatically.

---

### Module 4.2: Floorplanning

**GUI Method:**
- Select **Floorplan → Specify Floorplan**
- Set parameters:
  - **Aspect Ratio**: 1.0 (square) or custom
  - **Core Utilization**: 70-80%
  - **Core to I/O Spacing**: 10-20 µm

**Script Method:**
```tcl
floorPlan -r 1.0 0.7 10 10 10 10
```

**Parameters:**
- `-r`: Aspect ratio and core utilization
- Last 4 values: Left, Bottom, Right, Top spacing

---

### Module 4.3: Power Planning

**Step 1: Connect Global Nets**

```tcl
# GUI: Power → Connect Global Nets
# Add connections:
globalNetConnect VDD -type pgpin -pin VDD -inst * -override
globalNetConnect VSS -type pgpin -pin VSS -inst * -override
globalNetConnect VDD -type tiehi -inst * -override
globalNetConnect VSS -type tielo -inst * -override
```

**Step 2: Add Power Rings**

```tcl
# GUI: Power → Power Planning → Add Rings
addRing -nets {VDD VSS} \
        -type core_rings \
        -layer {top METAL9 bottom METAL9 left METAL8 right METAL8} \
        -width 5 \
        -spacing 2 \
        -offset 2
```

**Parameters:**
- Use highest metals (METAL8/METAL9) for lowest resistance
- Width: 5 µm (or as per design requirements)
- Spacing: 2 µm (minimum spacing)

**Step 3: Add Power Stripes**

```tcl
# GUI: Power → Power Planning → Add Stripes
addStripe -nets {VDD VSS} \
          -layer METAL8 \
          -direction vertical \
          -width 2 \
          -spacing 2 \
          -set_to_set_distance 20
```

**Step 4: Special Route (Add Vias)**

```tcl
# GUI: Route → Special Route
sroute -connect {corePin} \
       -layerChangeRange {METAL1 METAL9} \
       -blockPinTarget {nearestTarget} \
       -allowJogging 1 \
       -crossoverViaLayerRange {METAL1 METAL9} \
       -nets {VDD VSS} \
       -allowLayerChange 1
```

This connects power mesh from highest metal to METAL1 (standard cells).

---

### Module 4.4: Pre-Placement Steps

**Step 1: Add End Caps**

```tcl
# GUI: Place → Physical Cell → Add End Caps
addEndCap -preCap ENDCAP -postCap ENDCAP -prefix ENDCAP
```

End caps prevent standard cells from moving beyond core boundaries.

**Step 2: Add Well Taps**

```tcl
# GUI: Place → Physical Cell → Add Well Tap
addWellTap -cell WELLTAP \
           -cellInterval 30 \
           -prefix WELLTAP
```

Well taps prevent latch-up effects (typical interval: 30-45 µm).

---

### Module 4.5: Placement

**Step 1: Run Placement**

```tcl
# GUI: Place → Place Standard Cell → Run Full Placement
# Enable "Place I/O Pins" option
place_design -concurrent_macros
```

**Step 2: Generate Reports**

```tcl
# Timing Report (Pre-CTS Setup)
report_timing -late > reports/preCTS_setup_timing.rpt

# Area Report
report_area > reports/preCTS_area.rpt

# Power Report
report_power > reports/preCTS_power.rpt
```

**Step 3: Optimize Design (Pre-CTS)**

```tcl
# GUI: ECO → Optimize Design
# Select: Design Stage = PreCTS, Optimization Type = Setup
optDesign -preCTS -setup
```

**Step 4: Generate Post-Optimization Reports**

```tcl
report_timing -late > reports/preCTS_setup_timing_opt.rpt
report_area > reports/preCTS_area_opt.rpt
report_power > reports/preCTS_power_opt.rpt
```

---

### Module 4.6: Clock Tree Synthesis (CTS)

**Step 1: Create CTS Script**

Create `cts_spec.tcl`:
```tcl
create_ccopt_clock_tree_spec -file ccopt.spec
source ccopt.spec
ccopt_design
```

**Step 2: Build Clock Tree**

```tcl
# Source CTS script
source cts_spec.tcl

# View clock tree
# GUI: Clock → CCOpt Clock Tree Debugger
```

The clock tree uses buffers and inverters to distribute clock signal with minimal skew.

**Step 3: Generate CTS Reports**

```tcl
# Setup Analysis
report_timing -late > reports/postCTS_setup_timing.rpt

# Hold Analysis
report_timing -early > reports/postCTS_hold_timing.rpt

# Area Report
report_area > reports/postCTS_area.rpt

# Power Report
report_power > reports/postCTS_power.rpt
```

**Step 4: Optimize Design (Post-CTS)**

```tcl
# Setup Optimization
optDesign -postCTS -setup

# Hold Optimization
optDesign -postCTS -hold
```

**Step 5: Generate Post-Optimization Reports**

```tcl
report_timing -late > reports/postCTS_setup_timing_opt.rpt
report_timing -early > reports/postCTS_hold_timing_opt.rpt
report_area > reports/postCTS_area_opt.rpt
report_power > reports/postCTS_power_opt.rpt
```

---

### Module 4.7: Routing

**Step 1: Run Nano Route**

```tcl
# GUI: Route → Nano Route → Route
# Enable: Timing Driven, SI Driven
routeDesign -globalDetail
```

**Options:**
- **Timing Driven**: Optimizes routing for timing
- **SI Driven**: Reduces signal integrity issues (crosstalk)

**Step 2: Generate Post-Route Reports**

```tcl
# Setup Analysis
report_timing -late > reports/postRoute_setup_timing.rpt

# Hold Analysis
report_timing -early > reports/postRoute_hold_timing.rpt

# Area Report
report_area > reports/postRoute_area.rpt

# Power Report
report_power > reports/postRoute_power.rpt

# DRC Report
verify_drc -report reports/drc.rpt
```

**Step 3: Optimize Design (Post-Route)**

```tcl
# Post-route optimization
optDesign -postRoute -setup
optDesign -postRoute -hold
```

**Step 4: Generate Final Reports**

```tcl
report_timing -late > reports/postRoute_setup_timing_final.rpt
report_timing -early > reports/postRoute_hold_timing_final.rpt
report_area > reports/postRoute_area_final.rpt
report_power > reports/postRoute_power_final.rpt
```

---

### Module 4.8: Save Outputs

**Step 1: Save Design Database**

```tcl
# Save Innovus database
saveDesign design.enc
```

**Step 2: Save Netlist**

```tcl
# Save gate-level netlist with parasitics
saveNetlist priority_encoder_64bit_final.v -excludeLeafCell
```

**Step 3: Generate GDS II File**

```tcl
# Save GDS for fabrication
streamOut priority_encoder_64bit.gds \
          -mapFile streamOut.map \
          -libName DESIGN_LIB \
          -units 1000 \
          -mode ALL
```

**Step 4: Extract SDF for Simulation**

```tcl
# Extract delay information
write_sdf -version 3.0 priority_encoder_64bit.sdf
```

**Step 5: Generate Final Reports**

```tcl
# Summary report
summaryReport -outFile reports/summary.rpt

# Connection report
report_connectivity -file reports/connectivity.rpt

# Geometry report
report_geometry -file reports/geometry.rpt
```

---

### Post-Layout Verification

**Step 1: DRC (Design Rule Check)**
```tcl
verify_drc -report reports/drc_final.rpt
```

**Step 2: LVS (Layout vs Schematic)**
```tcl
verifyConnectivity -report reports/lvs.rpt
```

**Step 3: Timing Verification**
- Use extracted SDF with gate-level netlist
- Run post-layout simulation with NCLaunch
- Verify setup and hold timing



---

## 🚀 Getting Started

### Prerequisites

```bash
# Required Tools
- Cadence Incisive/NCLaunch (RTL Simulation)
- Cadence Genus (Logic Synthesis)
- Cadence Innovus (Place & Route)
- Technology Libraries (180nm/90nm/45nm CMOS)
```

### Environment Setup

```bash
# Clone Repository
git clone https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion.git
cd Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion

# Setup Cadence environment
csh
source /home/install/cshrc
```

### Quick Start Guide

**1. Run RTL Simulation:**
```bash
cd simulation/nclaunch
nclaunch -new         # First time
# Or
nclaunch              # Subsequent runs
```

**2. Run Synthesis:**
```bash
cd synthesis/scripts
genus -f rc_script.tcl -log ../logs/genus.log
```

**3. Run Physical Design:**
```bash
cd pnr/scripts
innovus
# In Innovus prompt:
source run.tcl
```

**4. Complete Automated Flow:**
```bash
# Run entire flow from RTL to GDS
./scripts/run_all.sh
```

---

## 🔧 Tools and Technologies

| Tool/Technology | Purpose | Version |
|----------------|---------|---------|
| **Cadence Incisive/NCLaunch** | RTL Simulation | 21.09 |
| **Cadence Genus** | Logic Synthesis | 21.1 |
| **Cadence Innovus** | Physical Design | 21.1 |
| **GPDK 180nm** | Technology Library | 180nm CMOS |
| **GPDK 90nm** | Technology Library | 90nm CMOS |
| **GPDK 45nm** | Technology Library | 45nm CMOS |

### File Formats

- **RTL**: `.v` (Verilog), `.vhdl` (VHDL)
- **Testbench**: `.v`, `.sv`
- **Scripts**: `.tcl` (Tool Command Language)
- **Constraints**: `.sdc` (Synopsys Design Constraints)
- **Libraries**: `.lib` (Liberty), `.lef` (Layer Exchange Format)
- **Netlist**: `.v` (Gate-level Verilog)
- **Layout**: `.gds` (GDSII)
- **Timing**: `.sdf` (Standard Delay Format)
- **Database**: `.enc` (Innovus Database)

---

## 📈 Design Optimization Tips

### For Better Timing:
- Use appropriate clock period constraints
- Optimize critical paths during synthesis
- Enable timing-driven placement and routing
- Balance clock tree for minimal skew

### For Lower Power:
- Use clock gating where applicable
- Select low-power cells from library
- Optimize switching activity
- Use power-aware synthesis options

### For Smaller Area:
- Increase core utilization (75-85%)
- Use area optimization during synthesis
- Remove redundant logic
- Share common sub-circuits

---

## 📚 References

1. **Huang, W.-C., & Oklobdzija, V. G.** (2017). "A Scalable High-Performance Priority Encoder Using 1D-Array to 2D-Array Conversion." *IEEE Transactions on Circuits and Systems—II: Express Briefs*.

2. **Cadence Design Systems** - Genus Synthesis User Guide

3. **Cadence Design Systems** - Innovus Implementation User Guide

4. **Weste, N. H. E., & Harris, D.** (2011). *CMOS VLSI Design: A Circuits and Systems Perspective* (4th ed.).


---

## 👤 Author

**Vikramaditya Singh**
Roll Number - 123EC0042

- GitHub: [@vikramzw-max)](https://github.com/vikramzw-max)
- Project Link: [Priority Encoder Repository](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)


**Sohan Maity**
Roll Number - 523EC0001

- GitHub: [@sohan2311](https://github.com/sohan2311)
- Project Link: [Priority Encoder Repository](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion)

---

## 📞 Contact

For questions or collaboration:
- **GitHub Issues**: [Open an Issue](https://github.com/sohan2311/Scalable-High-Performance-Priority-Encoder-Using-1D-Array-to-2D-Array-Conversion/issues)
- **Email**: [sohan.maity2311@gmail.com] [vikramzw@gmail.com]

---

<div align="center">
  <p><strong>⭐ If you find this project useful, please give it a star! ⭐</strong></p>
  <p>© 2025 | IIITDM Kurnool - All Rights Reserved.</p>
</div>
