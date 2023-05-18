module DC32_tb;
	// Inputs
	reg clk;
	reg reset;
	// Outputs
	wire [3:0] sec_unit;
	wire [2:0] sec_ten;
	wire [3:0] min_unit;
	wire [2:0] min_ten;
	wire [3:0] hour_unit;
	wire [1:0] hour_ten;
// Instantiate the Unit Under Test (UUT)
	DC32 uut (
		.clk(clk), 
		.reset(reset), 
		.sec_unit(sec_unit), 
		.sec_ten(sec_ten), 
		.min_unit(min_unit), 
		.min_ten(min_ten), 
		.hour_unit(hour_unit), 
		.hour_ten(hour_ten)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#10 reset = 0;        
		// Add stimulus here
	end
	always #5 clk = ~clk;      
endmodule
