`timescale 10ns/10ns // 50 MHz

module vga_tb;

    reg clock_25;
    reg reset;

    wire h_sync, v_sync;
    wire [7:0] R, G, B;

    integer file;

    wire [9:0] pixel_x, pixel_y;
    wire display_on;
    
    // build vga
    vga_sync UUT_vga_sync(.clock_25(clock_25), .reset(reset), .h_sync(h_sync), .v_sync(v_sync), .display_on(display_on), .pixel_x(pixel_x), .pixel_y(pixel_y));

    vga_graphs UUT_vga_graphs(.display_on(display_on), .pixel_x(pixel_x), .pixel_y(pixel_y), .R(R), .G(G), .B(B));
	 
	 task write_ppm;
        if (pixel_x == 10'd640) begin
            $fwrite(file, "\n");
        end
        else begin
            $fwrite(file, "%d, %d, %d ", R, G, B);
        end
    endtask
	 
    
    initial begin
		clock_25 = 1'b0;
        
        reset= 1'b1;
        #1 reset = 1'b0; 
        #4 reset = 1'b1;
		  
        file = $fopen("frame.ppm");
        $fdisplay(file, "P3\n640 480\n255");
        $fwrite(file, "0   0   0 ");
    end
		
	 always begin
		#2 clock_25 = ~clock_25;
	 end
	

    always @(pixel_x or pixel_y) begin
        if(pixel_x < 640 && pixel_y < 480) begin
            write_ppm();
        end
        else if(pixel_y >= 480)
            $finish;
    end

    
 
endmodule