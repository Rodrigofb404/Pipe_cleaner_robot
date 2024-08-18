module interface (CLO, Reset, v_sync, h_sync, blank, sx, sy); // ClockOut RGB, R, G, B,

	input CLK25, Reset;
	// output [7:0] VGA_R, VGA_G, VGA_B;
	output v_sync, h_sync, blank;
	output reg [9:0] sx, sy;
	
	
	parameter HA_END = 639,
			  HS_STA = HA_END + 16,
			  HS_END = HS_STA + 96,
			  LINE = 799;
	
	parameter VA_END = 479,
			  VS_STA = VA_END + 10,
			  VS_END = VS_STA + 2,
			  SCREEN = 524;

	always @(posedge CLK25) begin
			if (sx == LINE) begin
				sx <= 0;
				sy <= (sy == SCREEN) ? 0: sy + 1;
			end else begin
				sx <= sx + 1;
			end
		end


	assign blank = ((sx <= HA_END) && (sy <= VS_END))? 1:0; //639 491
	assign h_sync = ((sx >= HS_STA) && (sx < HS_END))? 0:1; //
	assign v_sync = ((sy >= VS_STA) && (sy < VS_END))? 0:1;
endmodule