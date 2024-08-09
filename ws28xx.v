module ws28xx (
	input clk,
	input btn_n,
	input btn1,
	input btn2,
	input btn3,

	output p1a7,		//pin3	- lat
	output p1a1,		//pin4	- mclk
	output p1a8,		//pin48	- oe
	output p1a2,		//pin2	- r1
	output p1a9,		//pin46	- g1
	output p1a3,		//pin47	- b1

	output ledr_n,		//ledred
	output ledg_n,		//ledgreen
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
);

assign led1 = !btn1;
endmodule
