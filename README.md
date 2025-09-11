# Synchronous FIFO (First-In-First-Out) in Verilog
---
## Description
This project implements a **Synchronous FIFO (First-In-First-Out)** buffer using Verilog. FIFO structures are widely used in digital systems to manage data flow between modules operating on the same clock. This design ensures efficient and reliable data transfer by managing data flow in a queue-like manner, where the first data written in is the first one read out.

This project is a good resource for understanding the fundamental principles of FIFO design in a synchronous environment.

---

## Key Features:

- Synchronous design: The entire clock works on a single clock
- Parameterized Design: Data width and depth in this design are configurable for different use 
- Status Flags: The design includes full and empty flags to provide real-time status, preventing data overflow and underflow.  
- Simple RTL structure  
- Verification: Includes testbench for simulation to verify the functionality

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
## Signals (IO)
- clk: System clock
- reset: Active-low reset
- w_en: Write enable
- r_en: Read enable
- dwrite: Data input to FIFO
- dread: Data output from FIFO
- full_indicate: FIFO full indicator
- empty_indicate: FIFO empty indicator

---
## Reference
- https://www.chipverify.com/verilog/synchronous-fifo
