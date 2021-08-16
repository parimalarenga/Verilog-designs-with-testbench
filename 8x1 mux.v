module mux(data,sel,out); 

input [3:0] data [7:0];
input [2:0] sel ;
output reg [3:0] out;
 
always @(sel) begin 
    case(sel) 
        3'b000: out= data[0];
        3'b001: out= data[1];
        3'b010: out= data[2];
        3'b011: out= data[3];
        3'b100: out= data[4];
        3'b101: out= data[5];
        3'b110: out= data[6];
        3'b111: out= data[7];
    endcase
  end 

endmodule


//testbench

module mux_tb(data,sel,out);

input reg [3:0] data [7:0];
input reg [2:0] sel ;
output [3:0] out;

mux DUT(.data(data),.sel(sel),.out(out));

	initial begin
		#10 data[0]=4'ha;
			data[1]=4'hb;
			data[2]=4'hc;
			data[3]=4'hd;
			data[4]=4'he;
			data[5]=4'hf;
			data[6]=4'h8;
			data[7]=4'h7;
		
		#10	sel=3'b000;
		#10	sel=3'b001;
		#10	sel=3'b010;
		#10	sel=3'b011;
		#10	sel=3'b100;
		#10	sel=3'b101;
		#10	sel=3'b110;
		#10	sel=3'b111;
	end
initial begin
	$strobe(" Data[0]=%h Data[1]=%h Data[2]=%h Data[3]=%h Data[4]=%h Data[5]=%h Data[6]=%h Data[7]=%h",data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]);
	$monitor("[%t] Sel=%b out=%h",$time,sel,out);
end

endmodule
		