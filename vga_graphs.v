module vga_graphs(display_on, pixel_x, pixel_y, R, G, B);

	// input wire clock_50;
    input wire display_on;
    input wire [9:0] pixel_x, pixel_y;
    output reg [3:0] R, G, B;

    parameter square_width = 200,
              screen_width = 640,
              screen_height = 480;
	 
	wire square;
	 
    assign square = (pixel_x > (screen_width - square_width) / 2) && (pixel_x < (screen_width + square_width) / 2) 
                    && 
                    (pixel_y > (screen_height - square_width) / 2) && (pixel_y < (screen_height + square_width) / 2);

    always @(*) begin
        if (display_on) begin
            R <= square ? 4'hF : 4'h0;
            G <= 4'hF;
            B <= square ? 4'h0 : 4'hF;
        end else begin
            R <= 4'h0;
            G <= 4'h0;
            B <= 4'h0;
        end
    end
	
endmodule