module faddr(a,b,cin,sum,cout);
	
	input a,b,cin;
	output sum,cout;

	assign	sum=(a^b)^cin;
	assign cout=(a&b)&cin;

endmodule

//testbench

module faddr_tb();
	reg a,b,cin;
	reg sum,cout;

    faddr DUT(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
	initial begin
         a=1'b0;
         b=1'b0;
      	 cin=1'b0; //000

     #10 a=1'b0;
         b=1'b0;
         cin=1'b1; //001

     #10 a=1'b0;
         b=1'b1;
         cin=1'b0; //010

     #10 a=1'b0;
         b=1'b1;
         cin=1'b1; //011

     #10 a=1'b1;
         b=1'b0;
         cin=1'b0; //100

     #10 a=1'b1;
         b=1'b0;
         cin=1'b1; //101

     #10 a=1'b1;
         b=1'b1;
         cin=1'b0; //110

     #10 a=1'b1;
         b=1'b1;
         cin=1'b1; //111


    end
initial
$monitor("A=%b B=%b sum=%b carry=%b",a,b,sum,carry);
endmodule
 