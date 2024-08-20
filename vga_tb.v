`timescale 10ns/10ns // 50 MHz

module vga_tb;

    reg clock_25;
    reg reset;

    wire h_sync, v_sync;
    wire [3:0] R, G, B;

    integer file;

    wire [9:0] pixel_x, pixel_y;
    wire display_on;
    
    // build vga
    vga_sync UUT_vga_sync(.clock_25(clock_25), .reset(reset), .h_sync(h_sync), .v_sync(v_sync), .display_on(display_on), .pixel_x(pixel_x), .pixel_y(pixel_y));

    vga_graphs UUT_vga_graphs(.display_on(display_on), .pixel_x(pixel_x), .pixel_y(pixel_y), .R(R), .G(G), .B(B));
    
    initial begin
        forever #4 clock_25 = ~clock_25;

        clock_25 = 1'b0;
        reset= 1'd1;
        #1
        reset = 1'd0;
        #4
        reset = 1'd1;
        file = $fopen("img.ppm");
        $fdisplay(file, "P3\n640 480\n255");
        $fwrite(file, "0   0   0 ");
    end


    always @(pixel_x or pixel_y) begin
        if(pixel_x < 640 && pixel_y < 480) begin
            next();
        end
        else if(pixel_y >= 480)
            $finish;
    end

    task next;
        if (pixel_x == 10'd640) begin
            $fwrite(file, "\n");
        end
        else begin
            $fwrite(file, "%d, %d, %d ", vga_r, vga_g, vga_b);
        end
    endtask
 
endmodule