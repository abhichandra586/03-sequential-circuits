# 03-Sequential-Circuits

> **VLSI Design Portfolio · Step 3 of 8**
> Verilog HDL implementation of all fundamental sequential logic circuits — with individual testbenches, GTKWave simulation waveforms, and terminal output verification for every circuit.

---

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Circuits Implemented](#circuits-implemented)
- [Simulation Instructions](#simulation-instructions)
- [Waveforms](#waveforms)
- [Concepts Covered](#concepts-covered)
- [Tools Used](#tools-used)
- [What's Next](#whats-next)

---

## Overview

This is the **third repository** in my journey of building a **16-bit pipelined RISC processor from scratch** using Verilog HDL.

Sequential circuits are the foundation of memory and state in digital systems. Unlike combinational circuits where output depends only on current inputs, sequential circuits remember past values using flip-flops. This repository implements all essential sequential building blocks — flip-flops, registers, counters, shift registers, and synchronous SRAM — that directly feed into the processor pipeline.

Each circuit is implemented using structural or behavioural Verilog with its own dedicated design file, testbench, terminal output, and GTKWave waveform for complete verification.

---

## Repository Structure

```
03-sequential-circuits/
│
├── src/                        # Verilog HDL source files
│   ├── d_flipflop.v
│   ├── dff_async.v
│   ├── dff_load.v
│   ├── tff.v
│   ├── jkff.v
│   ├── srff.v
│   ├── reg_4bit.v
│   ├── reg_16bit_load.v
│   ├── counter_up_4bit.v
│   ├── counter_updown_4bit.v
│   ├── counter_bcd.v
│   ├── counter_gray_4bit.v
│   ├── siso_8bit.v
│   ├── sipo_8bit.v
│   ├── piso_8bit.v
│   ├── pipo_8bit.v
│   └── sram_256x16.v
│
├── tb/                         # Testbench files
│   ├── d_flipflop_tb.v
│   ├── dff_async_tb.v
│   ├── dff_load_tb.v
│   ├── tff_tb.v
│   ├── jkff_tb.v
│   ├── srff_tb.v
│   ├── reg_4bit_tb.v
│   ├── reg_16bit_load_tb.v
│   ├── counter_up_4bit_tb.v
│   ├── counter_updown_4bit_tb.v
│   ├── counter_bcd_tb.v
│   ├── counter_gray_4bit_tb.v
│   ├── siso_8bit_tb.v
│   ├── sipo_8bit_tb.v
│   ├── piso_8bit_tb.v
│   ├── pipo_8bit_tb.v
│   └── sram_256x16_tb.v
│
├── sim/                        # Simulation waveforms and terminal outputs
│   ├── d_flipflop_waveform.png
│   ├── d_flipflop_terminal.png
│   ├── dff_async_waveform.png
│   ├── dff_async_terminal.png
│   ├── dff_load_waveform.png
│   ├── dff_load_terminal.png
│   ├── jkff_waveform.png
│   ├── jkff_terminal.png
│   ├── srff_waveform.png
│   ├── srff_terminal.png
│   ├── tff_waveform.png
│   ├── tff_terminal.png
│   ├── reg_4bit_waveform.png
│   ├── reg_4bit_terminal.png
│   ├── reg_16bit_load_waveform.png
│   ├── reg_16bit_load_terminal.png
│   ├── counter_up_4bit_waveform.png
│   ├── counter_up_4bit_terminal.png
│   ├── counter_updown_4bit_waveform.png
│   ├── counter_updown_4bit_terminal.png
│   ├── counter_bcd_waveform.png
│   ├── counter_bcd_terminal.png
│   ├── counter_gray_4bit_waveform.png
│   ├── counter_gray_4bit_terminal.png
│   ├── siso_8bit_waveform.png
│   ├── siso_8bit_terminal.png
│   ├── sipo_8bit_waveform.png
│   ├── sipo_8bit_terminal.png
│   ├── piso_8bit_waveform.png
│   ├── piso_8bit_terminal.png
│   ├── pipo_8bit_waveform.png
│   ├── pipo_8bit_terminal.png
│   ├── sram_256x16_waveform.png
│   └── sram_256x16_terminal.png
│
└── README.md
```

---

## Circuits Implemented

| # | Circuit | File | Description |
|---|---------|------|-------------|
| 1 | D Flip-Flop (Sync Reset) | `d_flipflop.v` | Captures d on posedge clk, synchronous reset |
| 2 | D Flip-Flop (Async Reset) | `dff_async.v` | Asynchronous reset — clears immediately on posedge reset |
| 3 | D Flip-Flop with Load Enable | `dff_load.v` | Captures d when load=1, holds when load=0 |
| 4 | T Flip-Flop | `tff.v` | Toggles when T=1, holds when T=0 |
| 5 | JK Flip-Flop | `jkff.v` | Set, Reset, Toggle, Hold — no illegal state |
| 6 | SR Flip-Flop | `srff.v` | Set, Reset, Hold — S=R=1 produces illegal x state |
| 7 | 4-bit Register | `reg_4bit.v` | 4 parallel dff_async instances via generate loop |
| 8 | 16-bit Register with Load | `reg_16bit_load.v` | 16 parallel dff_load instances, load-controlled capture |
| 9 | 4-bit Up Counter | `counter_up_4bit.v` | Counts 0 to 15, wraps via 4-bit truncation |
| 10 | 4-bit Up-Down Counter | `counter_updown_4bit.v` | dir=1 counts up, dir=0 counts down |
| 11 | BCD Counter | `counter_bcd.v` | Counts 0 to 9 only, explicit reset at count==9 |
| 12 | Gray Code Counter | `counter_gray_4bit.v` | Binary counter internally, Gray output via XOR |
| 13 | SISO 8-bit | `siso_8bit.v` | Serial in serial out — 8 cycles to shift one byte |
| 14 | SIPO 8-bit | `sipo_8bit.v` | Serial in, all 8 bits available in parallel after 8 cycles |
| 15 | PISO 8-bit | `piso_8bit.v` | Parallel load in one cycle, serial shift out |
| 16 | PIPO 8-bit | `pipo_8bit.v` | Parallel load in one cycle, parallel output immediately |
| 17 | Synchronous SRAM 256x16 | `sram_256x16.v` | 256 locations x 16 bits, sync write, async read |

---

## Simulation Instructions

### Requirements
- [Icarus Verilog](http://iverilog.icarus.com/) — open-source Verilog simulator
- [GTKWave](http://gtkwave.sourceforge.net/) — waveform viewer

### How to simulate any circuit

**Step 1 — Compile**
```bash
iverilog -o module_sim module.v module_tb.v
```

**Step 2 — Run simulation**
```bash
vvp module_sim
```

**Step 3 — View waveform**
```bash
gtkwave module.vcd
```

### Quick reference — all circuits

```bash
# Flip-Flops
iverilog -o d_flipflop_sim d_flipflop.v d_flipflop_tb.v
vvp d_flipflop_sim

iverilog -o dff_async_sim dff_async.v dff_async_tb.v
vvp dff_async_sim

iverilog -o dff_load_sim dff_load.v dff_load_tb.v
vvp dff_load_sim

iverilog -o tff_sim tff.v tff_tb.v
vvp tff_sim

iverilog -o jkff_sim jkff.v jkff_tb.v
vvp jkff_sim

iverilog -o srff_sim srff.v srff_tb.v
vvp srff_sim

# Registers — dependencies must come first
iverilog -o reg_4bit_sim dff_async.v reg_4bit.v reg_4bit_tb.v
vvp reg_4bit_sim

iverilog -o reg_16bit_load_sim dff_load.v reg_16bit_load.v reg_16bit_load_tb.v
vvp reg_16bit_load_sim

# Counters
iverilog -o counter_up_4bit_sim counter_up_4bit.v counter_up_4bit_tb.v
vvp counter_up_4bit_sim

iverilog -o counter_updown_4bit_sim counter_updown_4bit.v counter_updown_4bit_tb.v
vvp counter_updown_4bit_sim

iverilog -o counter_bcd_sim counter_bcd.v counter_bcd_tb.v
vvp counter_bcd_sim

iverilog -o counter_gray_4bit_sim counter_gray_4bit.v counter_gray_4bit_tb.v
vvp counter_gray_4bit_sim

# Shift Registers — SISO and SIPO depend on dff_async
iverilog -o siso_8bit_sim dff_async.v siso_8bit.v siso_8bit_tb.v
vvp siso_8bit_sim

iverilog -o sipo_8bit_sim dff_async.v sipo_8bit.v sipo_8bit_tb.v
vvp sipo_8bit_sim

iverilog -o piso_8bit_sim piso_8bit.v piso_8bit_tb.v
vvp piso_8bit_sim

iverilog -o pipo_8bit_sim pipo_8bit.v pipo_8bit_tb.v
vvp pipo_8bit_sim

# SRAM
iverilog -o sram_256x16_sim sram_256x16.v sram_256x16_tb.v
vvp sram_256x16_sim

# View waveform
gtkwave module.vcd
```

### Expected simulation output

**Example — JK Flip-Flop:**
```
VCD info: dumpfile jkff.vcd opened for output.
Time=0,clk=0,reset=1,j=0,k=0,q=0
Time=5000,clk=1,reset=1,j=0,k=0,q=0
Time=15000,clk=1,reset=0,j=0,k=0,q=0
Time=25000,clk=1,reset=0,j=0,k=1,q=0
Time=35000,clk=1,reset=0,j=1,k=0,q=1
Time=45000,clk=1,reset=0,j=1,k=1,q=0
Time=55000,clk=1,reset=0,j=1,k=1,q=1
jkff_tb.v: $finish called at 120000 (1ps)
```

**Example — BCD Counter:**
```
VCD info: dumpfile counter_bcd.vcd opened for output.
Time=15000,clk=1,reset=0,enable=1,count=0001
Time=25000,clk=1,reset=0,enable=1,count=0010
Time=35000,clk=1,reset=0,enable=1,count=0011
Time=95000,clk=1,reset=0,enable=1,count=1001
Time=105000,clk=1,reset=0,enable=1,count=0000
counter_bcd_tb.v: $finish called at 187000 (1ps)
```

**Example — SRAM 256x16:**
```
VCD info: dumpfile sram_256x16.vcd opened for output.
Time=0,we=1,address=  0,data_in=abcd,data_out=xxxx
Time=5000,we=1,address=  0,data_in=abcd,data_out=abcd
Time=10000,we=1,address=  1,data_in=1234,data_out=xxxx
Time=15000,we=1,address=  1,data_in=1234,data_out=1234
Time=40000,we=0,address=  0,data_in=0000,data_out=abcd
Time=85000,we=1,address=  0,data_in=9999,data_out=9999
Time=90000,we=0,address=  0,data_in=0000,data_out=9999
sram_256x16_tb.v:47: $finish called at 120000 (1ps)
```

---

## Waveforms

### D Flip-Flop (Sync Reset)
![D Flip-Flop Waveform](sim/d_flipflop_waveform.png)
![D Flip-Flop Terminal](sim/d_flipflop_terminal.png)

### D Flip-Flop (Async Reset)
![DFF Async Waveform](sim/dff_async_waveform.png)
![DFF Async Terminal](sim/dff_async_terminal.png)

### D Flip-Flop with Load Enable
![DFF Load Waveform](sim/dff_load_waveform.png)
![DFF Load Terminal](sim/dff_load_terminal.png)

### T Flip-Flop
![T Flip-Flop Waveform](sim/tff_waveform.png)
![T Flip-Flop Terminal](sim/tff_terminal.png)

### JK Flip-Flop
![JK Flip-Flop Waveform](sim/jkff_waveform.png)
![JK Flip-Flop Terminal](sim/jkff_terminal.png)

### SR Flip-Flop
![SR Flip-Flop Waveform](sim/srff_waveform.png)
![SR Flip-Flop Terminal](sim/srff_terminal.png)

### 4-bit Register
![4-bit Register Waveform](sim/reg_4bit_waveform.png)
![4-bit Register Terminal](sim/reg_4bit_terminal.png)

### 16-bit Register with Load Enable
![16-bit Register Waveform](sim/reg_16bit_load_waveform.png)
![16-bit Register Terminal](sim/reg_16bit_load_terminal.png)

### 4-bit Up Counter
![Up Counter Waveform](sim/counter_up_4bit_waveform.png)
![Up Counter Terminal](sim/counter_up_4bit_terminal.png)

### 4-bit Up-Down Counter
![Up-Down Counter Waveform](sim/counter_updown_4bit_waveform.png)
![Up-Down Counter Terminal](sim/counter_updown_4bit_terminal.png)

### BCD Counter
![BCD Counter Waveform](sim/counter_bcd_waveform.png)
![BCD Counter Terminal](sim/counter_bcd_terminal.png)

### Gray Code Counter
![Gray Counter Waveform](sim/counter_gray_4bit_waveform.png)
![Gray Counter Terminal](sim/counter_gray_4bit_terminal.png)

### SISO 8-bit Shift Register
![SISO Waveform](sim/siso_8bit_waveform.png)
![SISO Terminal](sim/siso_8bit_terminal.png)

### SIPO 8-bit Shift Register
![SIPO Waveform](sim/sipo_8bit_waveform.png)
![SIPO Terminal](sim/sipo_8bit_terminal.png)

### PISO 8-bit Shift Register
![PISO Waveform](sim/piso_8bit_waveform.png)
![PISO Terminal](sim/piso_8bit_terminal.png)

### PIPO 8-bit Shift Register
![PIPO Waveform](sim/pipo_8bit_waveform.png)
![PIPO Terminal](sim/pipo_8bit_terminal.png)

### Synchronous SRAM 256x16
![SRAM Waveform](sim/sram_256x16_waveform.png)
![SRAM Terminal](sim/sram_256x16_terminal.png)

---

## Concepts Covered

### Verilog
- `always @(posedge clk or posedge reset)` — sequential always block with async reset
- Non-blocking assignment `<=` for all sequential logic
- `always @(*)` — combinational always block for output logic
- `case({j,k})` — concatenation inside case for multi-signal matching
- `generate` / `genvar` — generate loops for structural module instantiation
- `reg [15:0] mem [0:255]` — 2D register array for memory modelling
- Two always blocks in one module — sequential state + combinational output

### Digital Design
- Synchronous vs asynchronous reset — timing and priority
- Flip-flop types and their truth tables (D, T, JK, SR)
- Register building from parallel flip-flop instantiation
- Counter design — up, up-down, BCD (modulo-10), Gray code
- Gray code — only one bit changes between consecutive values, eliminates glitches
- Shift register modes — SISO, SIPO, PISO, PIPO
- SRAM architecture — synchronous write, asynchronous read, 2D array

### Processor Relevance
- `dff_async.v` → foundation of all pipeline registers
- `reg_16bit_load.v` → IF/ID, ID/EX, EX/MEM, MEM/WB pipeline latches
- `counter_up_4bit.v` → program counter increment logic
- `sram_256x16.v` → data memory in MEM stage for LW and SW instructions
- `sipo_8bit.v` → UART receiver (Repo 8)
- `piso_8bit.v` → UART transmitter (Repo 8)

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Icarus Verilog | Compilation and simulation |
| GTKWave | Waveform viewing and verification |
| VS Code | Code editor with Verilog syntax highlighting |
| Git / GitHub | Version control and portfolio documentation |

---

## What's Next

This repository is **Step 3** in an 8-step roadmap building up to a complete 16-bit pipelined RISC processor.

| Step | Repository | Status |
|------|------------|--------|
| 1 | `01-basic-logic-gates` | ✅ Complete |
| 2 | `02-combinational-circuits` | ✅ Complete |
| 3 | `03-sequential-circuits` | ✅ Complete |
| 4 | `04-finite-state-machines` | ⏳ Upcoming |
| 5 | `05-alu-16bit` | ⏳ Upcoming |
| 6 | `06-processor-components` | ⏳ Upcoming |
| 7 | `07-risc16-pipelined-processor` | ⏳ Upcoming |
| 8 | `08-protocols-and-interfaces` | ⏳ Upcoming |

---

## Author

**Abhi Chandra B** — B.Tech ECE, 3rd Year
Building a complete VLSI design portfolio from logic gates to a pipelined processor.

[![GitHub](https://img.shields.io/badge/GitHub-abhichandra586-181717?style=flat&logo=github)](https://github.com/abhichandra586)
*Part of an 8-repository VLSI learning roadmap — from AND gate to 16-bit pipelined RISC processor.*
