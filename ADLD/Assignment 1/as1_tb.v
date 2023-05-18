module assignment1_tb();
reg clk,rt,car;
wire fs,bs;
reg [2:0] e_password;
wire [3:0] count;
integer password=3'b101;

assignment1 dut(clk,rt,car,fs,bs,e_password,count);


initial begin
$monitor("time1 :%d clk:%b rt:%b car:%b fs:%b bs:%b e_password:%d count:%d",$time,clk,rt,car,fs,bs,e_password,count);
clk=0; 

car=1;
rt=1'b0;
e_password=3'b100;
#10

car=1;
rt=1'b0;
e_password=3'b101;
#10

car=1;
rt=1'b0;
e_password= 3'b100;
#10
car=1;
rt=1'b0;
e_password= 3'b101;

#10
car=1;
rt=1'b0;
e_password=3'b100;

#10
car=1;
rt=1'b0;
e_password=3'b101;

#10
car=1;
rt=1'b0;
e_password= 3'b100;

#10
car=1;
rt=1'b0;
e_password= 3'b101;
#10 $finish;
end

always #5 clk=~clk;

endmodule


module assignment1(clk,rt,car,fs,bs,e_password,count);
input clk,rt,car;
output reg fs,bs;
input [2:0] e_password;
output reg [3:0] count;
integer password=3'b101;

parameter car_in=2'b00,carentry=2'b01,carcheck=2'b10,carpass=2'b11;
reg [1:0] cst,nst;


always@(posedge clk)

begin
       if(rt)
       begin 
       cst <= car_in;
       count<=4'b0000;
       end
       else
       cst <= nst ;
       end


always@(*)
begin
case(cst)
2'b00: begin
       bs=1'b0;
       if(car)
       begin
       fs=1'b1;
       nst=2'b01;
       end
       else
       nst=2'b00;
       end
2'b01: begin
       bs=1'b0;
       if(fs==0)
       nst=2'b01;
       else
       nst=2'b10;
       end
2'b10: begin
       if(e_password==password)
       nst=2'b11;
       else//(e_password!=password)
       nst=2'b10;
       end
2'b11: begin
       fs=1'b0;
       bs=1'b1;
       count=count+4'b0001;
       nst=2'b00;
       end
default : begin
         nst=2'b00;
         count=4'b0000;
          end
endcase
end
endmodule
