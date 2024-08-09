module top (
	input  CLK,

	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,

	input BTN_N,
	input BTN1,
	input BTN2,
	input BTN3,

	output LEDR_N,
	output LEDG_N,

	output P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10,
	output P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10
);

	assign LED1 = !BTN1 ^ !BTN2;
	assign LED2 = !BTN_N;

	reg [31:0] delay = 32'h0;
	always @(posedge CLK) begin
		delay <= delay + 'h1;	
	end

	assign LED3 = delay[23];
	//assign LED1 = BTN_N;
endmodule
