module deco(tbit,fbit); 

input [1:0] tbit;
output reg [3:0] fbit;
 
always @(tbit) begin 
    case(tbit)
        2'b00: fbit= 4'b0001;
        2'b01: fbit= 4'b0010;
        2'b10: fbit= 4'b0100;
        2'b11: fbit= 4'b1000;
    endcase
  end 

endmodule

//testbench

module deco_tb();
	reg [1:0] tbit;
	wire [3:0] fbit;
  
    deco DUT(.tbit(tbit),.fbit(fbit));
	initial begin
        
		#10 tbit=2'b00; 
        #10 tbit=2'b01; 
        #10 tbit=2'b10; 
        #10 tbit=2'b11;
		
    end
initial
$monitor("[%t] tbit=%b fbit=%b",$time,tbit,fbit);
endmodule
