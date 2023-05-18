module vending_machine(
  input clk,
  input reset,
  input [1:0]select,
  input [4:0]coin_in,
  output reg [3:0]product_out,
  output reg [4:0]coin_out
);


parameter cost_a = 5'd5; // product cost
parameter cost_b = 5'd10;
parameter cost_c = 5'd15;
parameter cost_d = 5'd20;


parameter product_A = 2'b00;
parameter product_B = 2'b01;
parameter product_C = 2'b10;
parameter product_D = 2'b11;


reg [1:0] cst;
reg [3:0] product_select;
reg [4:0] coins_inserted; 
reg [4:0] chage_remain;


initial cst = 2'b00;
initial product_select = 4'b0000;
initial coins_inserted = 5'b00000;
initial chage_remain = 5'b00000;
  
//define cst machine
always@(posedge clk) 
begin
  if(reset) 
  begin
    cst <= 2'b00;
    product_select <= 4'b0000;
    coins_inserted <= 5'b00000;
    chage_remain <= 5'b00000;
  end
  else
  begin
    case(cst)
      2'b00:begin
             product_out<=4'b0000;
           	 coin_out<=5'b00000;
           	 product_select<=4'b0000;
			 coins_inserted<=5'b00000;
			 chage_remain<=5'b00000;
             cst<=2'b01;
            end
      
     /* 2'b01:begin          				// Waiting for product select
            if(select == 2'b00) 
               product_select <= 4'b0000;
            else if(select == 2'b01) 
               product_select <= 4'b0001;
            else if(select == 2'b10) 
               product_select <= 4'b0010;  
            else if(select == 2'b11) 
     		   product_select <= 4'b0011;
            else  
     		   product_select <= 4'bxxxx;
              
             product_select <= 4'b0000;
             coins_inserted <= 5'b00000;
             chage_remain <= 5'b00000;
             cst <= 2'b10;
            end   */
      
      2'b01:begin                       // Waiting for coin insertion
        	if(coin_in == 5'b0101) 
             begin // 5rs coin inserted
              coins_inserted <= coins_inserted + 5'b00101;
             end
             else if (coin_in == 5'b01010) 
             begin // 10rs coin inserted
              coins_inserted <= coins_inserted + 5'b01010;
             end
            
             if(coin_in==5'd00000)
              cst<=2'b01;
             else if(select==product_A && coins_inserted >= 5'd5)
              cst<=2'b10;
       	  	 else if(select==product_B && coins_inserted >= 5'd10)
               cst<=2'b10;
        	 else if(select==product_C && coins_inserted >= 5'd15)
               cst<=2'b10;
        	 else if(select==product_D && coins_inserted >= 5'd20)
               cst<=2'b10;
             else
              cst<=2'b01;
        
             end
        
      2'b10:begin
           if(select == product_A && coins_inserted >= cost_a)
           begin
           product_select <= 4'b0000;
            if(coins_inserted==5'd5)
             coin_out <= 5'd0;
           else if(coins_inserted==5'd10)
            coin_out <= 5'd5;
           else 
             coin_out<=5'bxxxxx;
         end
        
        else if(select == product_B && coins_inserted >= cost_b)
        begin
          product_select <= 4'b0001;
          if(coins_inserted==5'd10)
          coin_out <= 5'd0;
          else if(coins_inserted==5'd15)
          coin_out <= 5'd5;
          else if(coins_inserted==5'd20)
          coin_out <= 5'd10;
          else
            coin_out<=5'bxxxxx;
        end
        
        else if(select == product_C && coins_inserted >= cost_c)
        begin
          product_select <= 4'b0010;
          if(coins_inserted==5'd15)
          coin_out <= 5'd0;
          else if(coins_inserted==5'd20)
          coin_out <= 5'd5;
          else
            coin_out<=5'bxxxxx;
        end
        
        else if(select == product_D && coins_inserted >= cost_d)
        begin
          product_select <= 4'b0011;
          if(coins_inserted==5'd20)
          coin_out <= 5'd0;
          else
            coin_out<=5'bxxxxx;
        end
         
       else
         begin
           cst<=2'b10;
         end
        
        cst <= 2'b11;
       end
      
      2'b11:begin        // Dispensing product and change
             product_out <= product_select;
             coin_out <= chage_remain;
             cst <= 2'b00;
            end
    endcase
  end
end

endmodule
  
