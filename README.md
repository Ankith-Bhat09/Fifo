# 🧠 Synchronous FIFO (Verilog)

This project implements a **Synchronous FIFO (First-In-First-Out)** buffer using Verilog. FIFO structures are widely used in digital systems to manage data flow between modules operating on the same clock.

---

## 🔧 Features

- Single-clock synchronous design  
- Parameterized data width and depth  
- Full and empty status flags  
- Simple RTL structure  
- Includes testbench for simulation  

---

## 🛠️ Module Interface

```verilog
module fifo
(	input [3:0] dwrite,
	input r_en,w_en,clk,reset,
	output reg [3:0] dread,
	output full_indicate,empty_indicate
);
```
## 🔄 Signals
- clk: System clock
- reset: Active-low reset
- w_en: Write enable
- r_en: Read enable
- dwrite: Data input to FIFO
- dread: Data output from FIFO
- full_indicate: FIFO full indicator
- empty_indicate: FIFO empty indicator
