module vga_graphs(display_on, pixel_x, pixel_y, R, G, B);

	// input wire clock_50;
    input wire display_on;
    input wire [9:0] pixel_x, pixel_y;
    output reg [7:0] R, G, B;

    parameter square_width = 200,
              screen_width = 640,
              screen_height = 480;
	 
	wire square;
	 
    assign square = (pixel_x > (screen_width - square_width) / 2) && (pixel_x < (screen_width + square_width) / 2) 
                    && 
                    (pixel_y > (screen_height - square_width) / 2) && (pixel_y < (screen_height + square_width) / 2);

    always @(*) begin
        if (display_on) begin
            R <= square ? 8'hFF : 8'h00;
            G <= square ? 8'hFF : 8'h00;
            B <= square ? 8'h00 : 8'hFF;
        end else begin
            R <= 8'h00;
            G <= 8'h00;
            B <= 8'h00;
        end
    end
	
endmodule