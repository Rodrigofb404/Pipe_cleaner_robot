module vga_sync  (clock25, reset, v_sync, h_sync, blank, pixel_x, pixel_y); // ClockOut RGB, R, G, B,

	input wire clock25, reset;
	output wire v_sync, h_sync, blank;
	output wire [9:0] pixel_x, pixel_y;
	
	// Sync buffers
	reg hs_count, vs_count; 
	wire hs_next, vs_next;
	
	// Position buffers
	reg [9:0] pixel_x_count, pixel_x_next; 
	reg [9:0] pixel_y_count, pixel_y_next;


	parameter HA_END = 10'd640, // Active area 
			  HS_STA = HA_END + 10'd16, // Front-porch
			  HS_END = HS_STA + 10'd96, // Sync
			  LINE = 10'd799; // ... + Back_porch
	
	parameter VA_END = 10'd480, // Active area
			  VS_STA = VA_END + 10'd10, // Front-porch
			  VS_END = VS_STA + 10'd2, // Sync
			  SCREEN = 10'd524; // ... + Back-porch

	always @(posedge clock25 or negedge reset) begin
		if (!reset) begin
			hs_count <= 1'b0;
			vs_count <= 1'b0;
			pixel_x_count <= 10'd0;
			pixel_y_count <= 10'd0;
		end else begin
			hs_count <= hs_next;
			vs_count <= vs_next;
			pixel_x_count <= pixel_x_next;
			pixel_y_count <= pixel_y_next;
		end
	end

	always @(posedge clock25) begin
			if (pixel_x_count == LINE) begin
				pixel_x_next <= 10'd0;
				pixel_y_next <= (pixel_y_count == SCREEN) ? 10'd0:pixel_y_count + 10'd1;
			end else begin
				pixel_x_next <= pixel_x_count + 10'd1;
				pixel_y_next <= pixel_y_count;
			end
		end


	assign hs_next = ((pixel_x_count >= HS_STA) && (pixel_x_count < HS_END)) ? 1'b0:1'b1; 
	assign vs_next = ((pixel_y_count >= VS_STA) && (pixel_y_count < VS_END)) ? 1'b0:1'b1;

	// outputs
	assign blank = ((pixel_x_count < HA_END) && (pixel_y_count < VA_END)) ? 1'b1:1'b0; 
	assign h_sync = hs_count;
	assign v_sync = vs_count;
	assign pixel_x = pixel_x_count;
	assign pixel_y = pixel_y_count;

endmodule