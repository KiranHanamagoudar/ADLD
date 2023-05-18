module tb;
  reg clk;
  reg reset;
  reg [1:0]select;
  reg [4:0]coin_in;
  wire [3:0]product_out;
  wire [4:0]coin_out;
  
  vending_machine dut(clk,reset,select,coin_in,product_out,coin_out);
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor($time," reset=%b select=%d coin_in=%d product_out=%d coin_out=%d coins_inserted=%d ",reset,select,coin_in,product_out,coin_out,dut.coins_inserted);
   
    
    #5 reset=1;
    #10 reset=0;
    #10 select=2'b00;    
        coin_in=5'd10;
    
    #30 select=2'b00;   
        coin_in=5'd5;
    
     #50 select=2'b01;   
        coin_in = 5'd10;
    
    #40 select=2'b01;   
         coin_in=5'd5;
    #40  coin_in=5'd5;
    
   
    
    #20 select=2'b10;    
        coin_in=5'd5;
    #20 coin_in=5'd5;
    #20 coin_in=5'd5;
    
    #20 select=2'b10;     
        coin_in=5'd5;
    #20 coin_in=5'd10;
    
    #20 select=2'b10;     
        coin_in=5'd10;
    #20 coin_in=5'd10;
    
    #20 select=2'b11;     
        coin_in=5'd5;
    #20 coin_in=5'd5;
    #20 coin_in=5'd5;
    #20 coin_in=5'd5;
    
    #20 select=2'b11;     
        coin_in=5'd10;
    #20 coin_in=5'd5;
    #20 coin_in=5'd5;
    
    #20 select=2'b11;    
        coin_in=5'd5;
    #20 coin_in=5'd5;
    #20 coin_in=5'd5;
    #20 coin_in=5'd10;
    
    
    #20 select=2'b11;    
        coin_in=5'd10;
    #20 coin_in=5'd10;
    
    
    #100 $finish;
  end
  
endmodule

