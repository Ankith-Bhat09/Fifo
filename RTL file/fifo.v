module fifo_test;
	reg [3:0] dwrite;
	reg r_en,w_en,clk,reset;
	wire [3:0] dread;
	wire fill_indicate,empty_indicate;
	// ***********************************************
	fifo uut(
		.dwrite(dwrite),
		.r_en(r_en),
		.w_en(w_en),
		.clk(clk),
		.reset(reset),
		.dread(dread),
		.full_indicate(full_indicate),
		.empty_indicate(empty_indicate)
	);
	// ***********************************************
	initial
	begin
 		$dumpfile("fifo_test.vcd");
  		$dumpvars(0, fifo_test);
	end
	// ***********************************************
	initial
	begin 
		clk=0;
		r_en=0;
		w_en=0;
		reset=1;
		#5 reset =0;
	end
	// ***********************************************
	always #5 clk=~clk;
	// ***********************************************
	initial
	begin
	w_en=1;
	#10 dwrite = 4'b1001;
	#10 dwrite = 4'b1011;
	#10 dwrite = 4'b0011;
	w_en=0;
	#2 r_en=1;
	#40 r_en=0;
	reset=1;
	end
endmodule

module fifo
(	input [3:0] dwrite,
	input r_en,w_en,clk,reset,
	output reg [3:0] dread,
	output full_indicate,empty_indicate
);
	reg [7:0] write_ptr;	// clog provide a log of depth
	reg [7:0] read_ptr;
	reg [3:0] mem [0:7];
	always @(reset)
		begin
			write_ptr <= 0;
			read_ptr <= 0;
	end
	always @(posedge clk)
	begin
		// write if write enabled and if not full
		if(w_en && !full_indicate)
		begin
			mem[write_ptr] <= dwrite;
			write_ptr <= write_ptr+1;
		end
	end
	always @(posedge clk)
	begin
		// read if read enabled and if not empty
		if(r_en && !empty_indicate)
		begin
			dread <= mem[read_ptr];
			read_ptr <= read_ptr +1;
		end
	end
	assign full_indicate = (write_ptr+1==read_ptr);
	assign empty_indicate = (write_ptr==read_ptr);
endmodule
