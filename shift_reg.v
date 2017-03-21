// Behavioural structure of shift_reg
//Mahmoud Mohamed Salah
/* operations
op=0 serial in serial out
op=1 parallel in serial out
op=2 serial in parallel out
op=3 parallel in parallel out
*/

module shift_reg (
D,
Q,
CLK,
RST,
OP,
ll_in,
ll_out,
);
// defining inputs outputs and register signals

input D;
input CLK; 
input RST;
input [1:0] OP;
input [3:0] ll_in;
output Q;
output [3:0] ll_out;
reg [3:0] str_D;
reg Q;
reg [3:0] ll_out;
// behaviour of the structure
always @ ( posedge CLK )
if(~RST)
begin
if(OP==0)
begin
  str_D <= {str_D [2:0],D};
  Q <= str_D[3];
  end
  if (OP==1)
  begin 
  str_D <= ll_in;
    Q <= str_D[3];
	 end
	   if (OP==2)
  begin 
  str_D <= {str_D [2:0],D};
    ll_out <= str_D;
	 end
	 	 if (OP==3)
  begin 
  ll_out <= ll_in;
	 end
end
else if (RST)
begin
str_D <=4'b0;
Q <= 1'b0;
end
endmodule 
