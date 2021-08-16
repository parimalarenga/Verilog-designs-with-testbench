module sdec(input in,clk,rst, output out);

	parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;

	reg [2:0] cstate,nstate;
	
	assign out=cstate==D ? 1 : 0;

	always @(posedge clk) begin
		$monitor("cstate=%b nstate=%b in=%b out=%b",cstate,nstate,in,out);
		if (!rst)
			cstate<=A;
		else 
			cstate<=nstate;
	end

	always @(cstate or in)begin
		case(cstate)
			A: if(in) nstate=B; else nstate=A;
			B: if(in) nstate=A; else nstate=C;
			C: if(in) nstate=D; else nstate=A;
			D: if(in) nstate=E; else nstate=A;
			E: if(in) nstate=A;
		endcase
	end
endmodule 

//testbench

module sdec_tb();
	reg clk,in,rst;
	wire out;
	sdec DUT( .clk(clk),.rst(rst),.in(in),.out(out));
	
	
	
	always #10 clk = ~clk;
  
	initial begin
		clk<=0;
		rst<=0;
		in<=0;
    
		repeat (5) @ (posedge clk);
		rst<= 1;

		
		@(posedge clk) in <= 1;
		@(posedge clk) in <= 0;
		@(posedge clk) in <= 1;
		@(posedge clk) in <= 1; 		
		@(posedge clk) in <= 0;
		@(posedge clk) in <= 0;
		@(posedge clk) in <= 1;
		@(posedge clk) in <= 1;
		@(posedge clk) in <= 0;
		@(posedge clk) in <= 1;
		@(posedge clk) in <= 1; 	
    
	end
endmodule



