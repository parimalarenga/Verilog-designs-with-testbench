module dmux(input reg [4:0] inn,[3:0] sel,output reg [4:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15); 

 
always @(inn or sel) begin 
    case(sel) 
        4'h0: data0=inn; 
        4'h1: data1=inn; 
        4'h2: data2=inn; 
        4'h3: data3=inn; 
        4'h4: data4=inn; 
        4'h5: data5=inn; 
        4'h6: data6=inn;
        4'h7: data7=inn;
        4'h8: data8=inn;
        4'h9: data9=inn;
        4'ha: data10=inn;
        4'hb: data11=inn;
        4'hc: data12=inn;
        4'hd: data13=inn;
        4'he: data14=inn;
        4'hf: data15=inn;
        endcase
end 
endmodule 


//testbench

module dmux_tb();

reg [4:0] inn;
reg [3:0] sel;
wire [4:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15;

dmux DUT(.inn(inn),.sel(sel),.data0(data0),.data1(data1),.data2(data2),.data3(data3),.data4(data4),.data5(data5),.data6(data6),.data7(data7),.data8(data8),.data9(data9),.data10(data10),.data11(data11),.data12(data12),.data13(data13),.data14(data14),.data15(data15));

	initial begin
		
		#10 inn=4'ha;
		
		#5	sel=4'h0;
		#5	sel=4'h1;
		#5	sel=4'h2;
		#5	sel=4'h3;
		#5	sel=4'h4;
		#5	sel=4'h5;
		#5	sel=4'h6;
		#5	sel=4'h7;
		#5	sel=4'h8;
		#5	sel=4'h9;
		#5	sel=4'ha;
		#5	sel=4'hb;
		#5	sel=4'hc;
		#5	sel=4'hd;
		#5	sel=4'he;
		#5	sel=4'hf;
		
	end
initial begin
	$strobe("inn=%h",inn);
	$monitor("sel=%d Data[0]=%h Data[1]=%h Data[2]=%h Data[3]=%h Data[4]=%h Data[5]=%h Data[6]=%h Data[7]=%h Data[8]=%h Data[9]=%h Data[10]=%h Data[11]=%h Data[12]=%h Data[13]=%h Data[14]=%h Data[15]=%h",sel,data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15);
end

endmodule
