module enco(fbit,tbit); 

input [3:0] fbit;
output reg [1:0] tbit;
 
always @(fbit) begin 
    case(fbit)
        4'b0001: tbit= 2'b00;
        4'b0010: tbit= 2'b01;
        4'b0100: tbit= 2'b10;
        4'b1000: tbit= 2'b11;
    endcase
  end 
endmodule


//testbench

module enco_tb();
	reg [3:0] fbit ;
	wire [1:0] tbit;
  
    enco DUT(.fbit(fbit),.tbit(tbit));
	initial begin
        
	    #10 fbit=4'b0001; 
        #10 fbit=4'b0010; 
        #10 fbit=4'b0100; 
        #10 fbit=4'b1000;
		
    end
initial
$monitor("[%t] fbit=%b tbit=%b",$time,fbit,tbit);
endmodule