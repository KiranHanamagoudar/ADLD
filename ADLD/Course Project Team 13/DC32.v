module DC32(clk, reset,sec_unit,sec_ten, min_unit,min_ten,hour_unit,hour_ten);

 input clk, reset;
  output reg [3:0] sec_unit, min_unit,hour_unit;
  output reg [2:0] sec_ten,min_ten;
  output reg [1:0] hour_ten;
  always @(posedge clk) begin
    if (reset) begin
	              sec_unit <= 4'b0000;
		sec_ten  <= 3'b000;
		min_unit <=4'b0000;
		min_ten  <=3'b000;
		hour_unit <=4'b0000;
		hour_ten  <=2'b00;
     end
    else begin
      sec_unit <= sec_unit + 1;
      if (sec_unit == 4'b1001) 
	begin
        sec_unit <= 4'b0000;
		  sec_ten  <= sec_ten + 1;
		  if (sec_ten == 3'b101)
	          begin 
		  sec_ten <= 3'b000;
                  min_unit <= min_unit + 1 ;
		  if (min_unit == 4'b1001) 
	          begin
		  min_unit <= 4'b0000;
          	  min_ten  <= min_ten + 1;
             	  if (min_ten == 3'b101)
		  begin 
		  min_ten <= 3'b000;
                  hour_unit <= hour_unit + 1;
		  if (hour_unit==4'b1001) 
	          begin
		  hour_unit <= 4'b0000;
		  hour_ten  <= hour_ten + 1;
		  if (hour_ten== 2'b10 && hour_unit== 4'b0100) 
	          begin
		  hour_ten <= 2'b00;
                  end
                  end
                  end
                  end
                  end
          end
          end
          end
endmodule

