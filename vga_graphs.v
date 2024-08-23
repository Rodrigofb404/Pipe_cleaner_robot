module vga_graphs(clock_25, display_on, pixel_x, pixel_y, sprites, R, G, B);

	 input wire clock_25;
    input wire display_on;
    input wire [9:0] pixel_x, pixel_y;
    input wire [3:0] sprites; // Select what sprite show
    output wire  [7:0] R, G, B;
     

    reg robot_north, robot_east, robot_south, robot_west, wall_block, free_path, black_block, trash_1, trash_2, trash_3; // sprites

    
    /* SPRITES
    0 = wall_block
    1 = free_path
    2 = robot_north
    3 = robot_east
    4 = robot_south
    5 = robot_west
    6 = black_block
    7 = trash_1
    8 = trash_2
    9 = trash_3
    */

    parameter BLACK = 24'h000000,
              WHITE = 24'hFFFFFF,
              LIGHT_GREY = 24'hC0C0C0,
              DARK_GREY = 24'h7F7F7F,
              RED = 24'hFF0000,
              BLUE = 24'h0000CD; 

    always @(*) begin
        case (sprites)
            4'd0: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b1000_0000_00;
            4'd1: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0100_0000_00;
            4'd2: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0010_0000_00;
            4'd3: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0001_0000_00;
            4'd4: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_1000_00;
            4'd5: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0100_00;
            4'd6: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0010_00;
            4'd7: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0001_00;
            4'd8: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0000_10;
            4'd9: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0000_01;
            default: {wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3} = 10'b0000_0000_00;      
        endcase
    end

    // wall_block________________________________________________________________________________________________________
    reg [0:31] wall_block_sprite; // R2D2
    wire [4:0] wall_block_x;
    wire [4:0] wall_block_y;
    always @(wall_block_y) begin
        case (wall_block_y)
            5'd0: wall_block_sprite =  32'b0000_0000_0000_0000_0000_0000_0000_0000;
            5'd1: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd2: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd3: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd4: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd5: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd6: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd7: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd8: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd9: wall_block_sprite =  32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd10: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd11: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd12: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd13: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd14: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd15: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd16: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd17: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd18: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd19: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd20: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd21: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd22: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd23: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd24: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd25: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd26: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd27: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd28: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd29: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd30: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd31: wall_block_sprite = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
            5'd32: wall_block_sprite = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
            default: wall_block_sprite = 32'b0000_0000_0000_0000_0000_0000_0000_0000;    
        endcase
    end

    assign wall_block_x = pixel_x % 32;
    assign wall_block_y = pixel_y % 32;

    // free_path________________________________________________________________________________________________________
    reg [0:95] free_path_sprite; // R2D2
    wire [4:0] free_path_x;
    wire [4:0] free_path_y;
    always @(free_path_y) begin
        case (free_path_y)
            5'd0: free_path_sprite =  96'o0000_0000_0000_0000_0000_0000_0000_0000;
            5'd1: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd2: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd3: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd4: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd5: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd6: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd7: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd8: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd9: free_path_sprite =  96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd10: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd11: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330; 
            5'd12: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd13: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd14: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd15: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd16: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd17: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd18: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd19: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd20: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd21: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd22: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd23: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd24: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd25: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd26: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd27: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd28: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd29: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd30: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd31: free_path_sprite = 96'o0333_3333_3333_3333_3333_3333_3333_3330;
            5'd32: free_path_sprite = 96'o0000_0000_0000_0000_0000_0000_0000_0000;
            default: free_path_sprite = 96'o0000_0000_0000_0000_0000_0000_0000_0000;    
        endcase
    end

    assign free_path_x = (pixel_x % 32) * 3; // Get what the Col print (by 1 cause we are working with binary)
    assign free_path_y = pixel_y % 32; // Get what the Row print
    // Robot_north________________________________________________________________________________________________________

    reg [0:95] robot_north_sprite; // R2D2
    wire [4:0] robot_north_x;
    wire [4:0] robot_north_y;
    always @(robot_north_y) begin
        case (robot_north_y)
            5'd0: robot_north_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: robot_north_sprite =  96'o044_444_444_444_444_444_444_444_444_444_40;
            5'd2: robot_north_sprite =  96'o044_444_444_444_444_444_444_444_444_444_40;
            5'd3: robot_north_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd4: robot_north_sprite =  96'o011_111_111_111_100_001_111_111_111_111_10;
            5'd5: robot_north_sprite =  96'o011_111_111_110_025_520_011_111_111_111_10;
            5'd6: robot_north_sprite =  96'o011_111_111_105_251_052_501_111_111_111_10;
            5'd7: robot_north_sprite =  96'o011_111_111_052_250_052_250_111_111_111_10;
            5'd8: robot_north_sprite =  96'o011_111_111_022_255_552_220_111_111_111_10;
            5'd9: robot_north_sprite =  96'o011_111_110_255_222_222_222_011_111_111_10;
            5'd10: robot_north_sprite = 96'o011_111_110_222_252_555_252_011_111_111_10;
            5'd11: robot_north_sprite = 96'o011_111_110_255_252_545_252_011_111_111_10;
            5'd12: robot_north_sprite = 96'o011_111_110_000_000_000_000_011_111_111_10;
            5'd13: robot_north_sprite = 96'o011_111_000_111_111_111_111_000_111_111_10;
            5'd14: robot_north_sprite = 96'o011_110_110_222_155_551_222_011_011_111_10;
            5'd15: robot_north_sprite = 96'o011_110_110_202_111_111_212_011_011_111_10;
            5'd16: robot_north_sprite = 96'o011_110_000_212_155_551_212_000_011_111_10;
            5'd17: robot_north_sprite = 96'o011_111_010_212_111_111_212_010_111_111_10;
            5'd18: robot_north_sprite = 96'o011_111_010_212_152_251_212_010_111_111_10;
            5'd19: robot_north_sprite = 96'o011_111_010_212_152_251_212_010_111_111_10;
            5'd20: robot_north_sprite = 96'o011_111_010_212_111_111_212_010_111_111_10;
            5'd21: robot_north_sprite = 96'o011_111_010_222_155_551_222_010_111_111_10;
            5'd22: robot_north_sprite = 96'o011_111_010_112_152_151_211_010_111_111_10;
            5'd23: robot_north_sprite = 96'o011_111_000_112_151_251_211_000_111_111_10;
            5'd24: robot_north_sprite = 96'o011_110_120_112_155_551_211_021_011_111_10;
            5'd25: robot_north_sprite = 96'o011_110_120_000_000_000_000_021_011_111_10;
            5'd26: robot_north_sprite = 96'o011_101_110_111_012_210_111_011_101_111_10;
            5'd27: robot_north_sprite = 96'o011_101_110_110_121_121_011_011_101_111_10;
            5'd28: robot_north_sprite = 96'o011_100_000_110_000_000_011_000_001_111_10;
            5'd29: robot_north_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd11: robot_north_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd31: robot_north_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd32: robot_north_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;
            default: robot_north_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;    
        endcase
    end

    assign robot_north_x = (pixel_x % 32) * 3; // Get what col print (by 3 cause we are using octal)
    assign robot_north_y = pixel_y % 32; // Get what row print
    // Robot_east________________________________________________________________________________________________________

    reg [0:95] robot_east_sprite; 
    wire [4:0] robot_east_x;
    wire [4:0] robot_east_y;
    always @(robot_east_y) begin
        case (robot_east_y)
            5'd0: robot_east_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: robot_east_sprite =  96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd2: robot_east_sprite =  96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd3: robot_east_sprite =  96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd4: robot_east_sprite =  96'o044_111_111_111_100_001_111_111_111_111_10;
            5'd5: robot_east_sprite =  96'o044_111_111_110_025_520_011_111_111_111_10;
            5'd6: robot_east_sprite =  96'o044_111_111_105_251_052_501_111_111_111_10;
            5'd7: robot_east_sprite =  96'o044_111_111_052_250_052_250_111_111_111_10;
            5'd8: robot_east_sprite =  96'o044_111_111_022_255_552_220_111_111_111_10;
            5'd9: robot_east_sprite =  96'o044_111_110_255_222_222_222_011_111_111_10;
            5'd10: robot_east_sprite = 96'o044_111_110_222_252_555_252_011_111_111_10;
            5'd11: robot_east_sprite = 96'o044_111_110_255_252_545_252_011_111_111_10;
            5'd12: robot_east_sprite = 96'o044_111_110_000_000_000_000_011_111_111_10;
            5'd13: robot_east_sprite = 96'o044_111_000_111_111_111_111_000_111_111_10;
            5'd14: robot_east_sprite = 96'o044_110_110_222_155_551_222_011_011_111_10;
            5'd15: robot_east_sprite = 96'o044_110_110_202_111_111_212_011_011_111_10;
            5'd16: robot_east_sprite = 96'o044_110_000_212_155_551_212_000_011_111_10;
            5'd17: robot_east_sprite = 96'o044_111_010_212_111_111_212_010_111_111_10;
            5'd18: robot_east_sprite = 96'o044_111_010_212_152_251_212_010_111_111_10;
            5'd19: robot_east_sprite = 96'o044_111_010_212_152_251_212_010_111_111_10;
            5'd20: robot_east_sprite = 96'o044_111_010_212_111_111_212_010_111_111_10;
            5'd21: robot_east_sprite = 96'o044_111_010_222_155_551_222_010_111_111_10;
            5'd22: robot_east_sprite = 96'o044_111_010_112_152_151_211_010_111_111_10;
            5'd23: robot_east_sprite = 96'o044_111_000_112_151_251_211_000_111_111_10;
            5'd24: robot_east_sprite = 96'o044_110_120_112_155_551_211_021_011_111_10;
            5'd25: robot_east_sprite = 96'o044_110_120_000_000_000_000_021_011_111_10;
            5'd26: robot_east_sprite = 96'o044_101_110_111_012_210_111_011_101_111_10;
            5'd27: robot_east_sprite = 96'o044_101_110_110_121_121_011_011_101_111_10;
            5'd28: robot_east_sprite = 96'o044_100_000_110_000_000_011_000_001_111_10;
            5'd29: robot_east_sprite = 96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd11: robot_east_sprite = 96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd31: robot_east_sprite = 96'o044_111_111_111_111_111_111_111_111_111_10;
            5'd32: robot_east_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;
            default: robot_east_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;    
        endcase
    end
    assign robot_east_x = (pixel_x % 32) * 3;
    assign robot_east_y = pixel_y % 32;

    // Robot_south________________________________________________________________________________________________________

    reg [0:95] robot_south_sprite; 
    wire [4:0] robot_south_x;
    wire [4:0] robot_south_y;
    always @(robot_south_y) begin
        case (robot_south_y)
            5'd0: robot_south_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: robot_south_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd2: robot_south_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd3: robot_south_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd4: robot_south_sprite =  96'o011_111_111_111_100_001_111_111_111_111_10;
            5'd5: robot_south_sprite =  96'o011_111_111_110_025_520_011_111_111_111_10;
            5'd6: robot_south_sprite =  96'o011_111_111_105_251_052_501_111_111_111_10;
            5'd7: robot_south_sprite =  96'o011_111_111_052_250_052_250_111_111_111_10;
            5'd8: robot_south_sprite =  96'o011_111_111_022_255_552_220_111_111_111_10;
            5'd9: robot_south_sprite =  96'o011_111_110_255_222_222_222_011_111_111_10;
            5'd10: robot_south_sprite = 96'o011_111_110_222_252_555_252_011_111_111_10;
            5'd11: robot_south_sprite = 96'o011_111_110_255_252_545_252_011_111_111_10;
            5'd12: robot_south_sprite = 96'o011_111_110_000_000_000_000_011_111_111_10;
            5'd13: robot_south_sprite = 96'o011_111_000_111_111_111_111_000_111_111_10;
            5'd14: robot_south_sprite = 96'o011_110_110_222_155_551_222_011_011_111_10;
            5'd15: robot_south_sprite = 96'o011_110_110_202_111_111_212_011_011_111_10;
            5'd16: robot_south_sprite = 96'o011_110_000_212_155_551_212_000_011_111_10;
            5'd17: robot_south_sprite = 96'o011_111_010_212_111_111_212_010_111_111_10;
            5'd18: robot_south_sprite = 96'o011_111_010_212_152_251_212_010_111_111_10;
            5'd19: robot_south_sprite = 96'o011_111_010_212_152_251_212_010_111_111_10;
            5'd20: robot_south_sprite = 96'o011_111_010_212_111_111_212_010_111_111_10;
            5'd21: robot_south_sprite = 96'o011_111_010_222_155_551_222_010_111_111_10;
            5'd22: robot_south_sprite = 96'o011_111_010_112_152_151_211_010_111_111_10;
            5'd23: robot_south_sprite = 96'o011_111_000_112_151_251_211_000_111_111_10;
            5'd24: robot_south_sprite = 96'o011_110_120_112_155_551_211_021_011_111_10;
            5'd25: robot_south_sprite = 96'o011_110_120_000_000_000_000_021_011_111_10;
            5'd26: robot_south_sprite = 96'o011_101_110_111_012_210_111_011_101_111_10;
            5'd27: robot_south_sprite = 96'o011_101_110_110_121_121_011_011_101_111_10;
            5'd28: robot_south_sprite = 96'o011_100_000_110_000_000_011_000_001_111_10;
            5'd29: robot_south_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd11: robot_south_sprite = 96'o044_444_444_444_444_444_444_444_444_444_40;
            5'd31: robot_south_sprite = 96'o044_444_444_444_444_444_444_444_444_444_40;
            5'd32: robot_south_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;
            default: robot_south_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;    
        endcase
    end
    assign robot_south_x = (pixel_x % 32) * 3;
    assign robot_south_y = pixel_y % 32;

    // Robot_west________________________________________________________________________________________________________

    reg [0:95] robot_west_sprite; 
    wire [4:0] robot_west_x;
    wire [4:0] robot_west_y;
    always @(robot_west_y) begin
        case (robot_west_y)
            5'd0: robot_west_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: robot_west_sprite =  96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd2: robot_west_sprite =  96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd3: robot_west_sprite =  96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd4: robot_west_sprite =  96'o011_111_111_111_100_001_111_111_111_114_40;
            5'd5: robot_west_sprite =  96'o011_111_111_110_025_520_011_111_111_114_40;
            5'd6: robot_west_sprite =  96'o011_111_111_105_251_052_501_111_111_114_40;
            5'd7: robot_west_sprite =  96'o011_111_111_052_250_052_250_111_111_114_40;
            5'd8: robot_west_sprite =  96'o011_111_111_022_255_552_220_111_111_114_40;
            5'd9: robot_west_sprite =  96'o011_111_110_255_222_222_222_011_111_114_40;
            5'd10: robot_west_sprite = 96'o011_111_110_222_252_555_252_011_111_114_40;
            5'd11: robot_west_sprite = 96'o011_111_110_255_252_545_252_011_111_114_40;
            5'd12: robot_west_sprite = 96'o011_111_110_000_000_000_000_011_111_114_40;
            5'd13: robot_west_sprite = 96'o011_111_000_111_111_111_111_000_111_114_40;
            5'd14: robot_west_sprite = 96'o011_110_110_222_155_551_222_011_011_114_40;
            5'd15: robot_west_sprite = 96'o011_110_110_202_111_111_212_011_011_114_40;
            5'd16: robot_west_sprite = 96'o011_110_000_212_155_551_212_000_011_114_40;
            5'd17: robot_west_sprite = 96'o011_111_010_212_111_111_212_010_111_114_40;
            5'd18: robot_west_sprite = 96'o011_111_010_212_152_251_212_010_111_114_40;
            5'd19: robot_west_sprite = 96'o011_111_010_212_152_251_212_010_111_114_40;
            5'd20: robot_west_sprite = 96'o011_111_010_212_111_111_212_010_111_114_40;
            5'd21: robot_west_sprite = 96'o011_111_010_222_155_551_222_010_111_114_40;
            5'd22: robot_west_sprite = 96'o011_111_010_112_152_151_211_010_111_114_40;
            5'd23: robot_west_sprite = 96'o011_111_000_112_151_251_211_000_111_114_40;
            5'd24: robot_west_sprite = 96'o011_110_120_112_155_551_211_021_011_114_40;
            5'd25: robot_west_sprite = 96'o011_110_120_000_000_000_000_021_011_114_40;
            5'd26: robot_west_sprite = 96'o011_101_110_111_012_210_111_011_101_114_40;
            5'd27: robot_west_sprite = 96'o011_101_110_110_121_121_011_011_101_114_40;
            5'd28: robot_west_sprite = 96'o011_100_000_110_000_000_011_000_001_114_40;
            5'd29: robot_west_sprite = 96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd11: robot_west_sprite = 96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd31: robot_west_sprite = 96'o011_111_111_111_111_111_111_111_111_114_40;
            5'd32: robot_west_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;
            default: robot_west_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;    
        endcase
    end
    assign robot_west_x = (pixel_x % 32) * 3;
    assign robot_west_y = pixel_y % 32;

    // Black_block________________________________________________________________________________________________________

    reg [0:31] black_block_sprite; 
    wire [4:0] black_block_x;
    wire [4:0] black_block_y;
    always @(black_block_y) begin
        case (black_block_y)
            5'd0: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd1: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd2: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd3: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd4: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd5: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd6: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd7: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd8: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd9: black_block_sprite =  32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd10: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd11: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd12: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd13: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd14: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd15: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd16: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd17: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd18: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd19: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd20: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd21: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd22: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd23: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd24: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd25: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd26: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd27: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd28: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd29: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd11: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd31: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            5'd32: black_block_sprite = 32'b000_000_000_000_000_000_000_000_000_000_00;
            default: black_block_sprite = 32'b0000_0000_0000_0000_0000_0000_0000_0000;    
        endcase
    end
    assign black_block_x = (pixel_x % 32);
    assign black_block_y = pixel_y % 32;

    // Trash_1________________________________________________________________________________________________________

    reg [0:95] trash_1_sprite;
    wire [4:0] trash_1_x;
    wire [4:0] trash_1_y;
    always @(trash_1_y) begin
        case (trash_1_y)
            5'd0: trash_1_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: trash_1_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd2: trash_1_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd3: trash_1_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd4: trash_1_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd5: trash_1_sprite =  96'o011_111_111_100_000_011_111_111_111_111_10;
            5'd6: trash_1_sprite =  96'o011_111_110_000_000_000_111_111_111_111_10;
            5'd7: trash_1_sprite =  96'o011_111_110_000_000_000_000_111_111_111_10;
            5'd8: trash_1_sprite =  96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd9: trash_1_sprite =  96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd10: trash_1_sprite = 96'o011_111_100_000_004_440_000_000_111_111_10;
            5'd11: trash_1_sprite = 96'o011_111_000_000_004_440_000_000_011_111_10;
            5'd12: trash_1_sprite = 96'o011_111_000_000_444_440_000_000_011_111_10;
            5'd13: trash_1_sprite = 96'o011_111_000_000_444_440_000_000_001_111_10;
            5'd14: trash_1_sprite = 96'o011_111_000_000_004_440_000_000_001_111_10;
            5'd15: trash_1_sprite = 96'o011_111_000_000_004_440_000_000_001_111_10;
            5'd16: trash_1_sprite = 96'o011_111_000_000_004_440_000_000_001_111_10;
            5'd17: trash_1_sprite = 96'o011_111_000_000_004_440_000_000_001_111_10;
            5'd18: trash_1_sprite = 96'o011_111_000_000_444_444_400_000_001_111_10;
            5'd19: trash_1_sprite = 96'o011_111_000_000_444_444_400_000_011_111_10;
            5'd20: trash_1_sprite = 96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd21: trash_1_sprite = 96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd22: trash_1_sprite = 96'o011_111_111_100_000_000_000_111_111_111_10;
            5'd23: trash_1_sprite = 96'o011_111_111_111_000_000_000_000_001_111_10;
            5'd24: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd25: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd26: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd27: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd28: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd29: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd11: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd31: trash_1_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd32: trash_1_sprite = 96'o011_111_000_000_000_000_000_000_001_111_10;
            default: trash_1_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;  
        endcase
    end  

    assign trash_1_x = (pixel_x % 32) * 3;
    assign trash_1_y = pixel_y % 32;
    
    // Trash_2________________________________________________________________________________________________________

    reg [0:95] trash_2_sprite;
    wire [4:0] trash_2_x;
    wire [4:0] trash_2_y;
    always @(trash_2_y) begin
        case (trash_2_y)
            5'd0: trash_2_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: trash_2_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd2: trash_2_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd3: trash_2_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd4: trash_2_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd5: trash_2_sprite =  96'o011_111_111_100_000_011_111_111_111_111_10;
            5'd6: trash_2_sprite =  96'o011_111_110_000_000_000_111_111_111_111_10;
            5'd7: trash_2_sprite =  96'o011_111_110_000_000_000_000_111_111_111_10;
            5'd8: trash_2_sprite =  96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd9: trash_2_sprite =  96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd10: trash_2_sprite = 96'o011_111_100_000_004_444_000_000_111_111_10;
            5'd11: trash_2_sprite = 96'o011_111_000_000_004_444_000_000_011_111_10;
            5'd12: trash_2_sprite = 96'o011_111_000_000_440_000_440_000_011_111_10;
            5'd13: trash_2_sprite = 96'o011_111_000_000_440_000_440_000_001_111_10;
            5'd14: trash_2_sprite = 96'o011_111_000_000_000_440_000_000_001_111_10;
            5'd15: trash_2_sprite = 96'o011_111_000_000_000_440_000_000_001_111_10;
            5'd16: trash_2_sprite = 96'o011_111_000_000_044_000_000_000_001_111_10;
            5'd17: trash_2_sprite = 96'o011_111_000_000_044_000_000_000_001_111_10;
            5'd18: trash_2_sprite = 96'o011_111_000_004_444_444_400_000_001_111_10;
            5'd19: trash_2_sprite = 96'o011_111_000_004_444_444_400_000_011_111_10;
            5'd20: trash_2_sprite = 96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd21: trash_2_sprite = 96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd22: trash_2_sprite = 96'o011_111_111_100_000_000_000_111_111_111_10;
            5'd23: trash_2_sprite = 96'o011_111_111_111_000_000_000_000_001_111_10;
            5'd24: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd25: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd26: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd27: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd28: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd29: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd11: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd31: trash_2_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd32: trash_2_sprite = 96'o011_111_000_000_000_000_000_000_001_111_10;
            default: trash_2_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;  
        endcase
    end  

    assign trash_2_x = (pixel_x % 32) * 3;
    assign trash_2_y = pixel_y % 32;

     // trash_3________________________________________________________________________________________________________

    reg [0:95] trash_3_sprite;
    wire [4:0] trash_3_x;
    wire [4:0] trash_3_y;
    always @(trash_3_y) begin
        case (trash_3_y)
            5'd0: trash_3_sprite =  96'o000_000_000_000_000_000_000_000_000_000_00;
            5'd1: trash_3_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd2: trash_3_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd3: trash_3_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd4: trash_3_sprite =  96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd5: trash_3_sprite =  96'o011_111_111_100_000_011_111_111_111_111_10;
            5'd6: trash_3_sprite =  96'o011_111_110_000_000_000_111_111_111_111_10;
            5'd7: trash_3_sprite =  96'o011_111_110_000_000_000_000_111_111_111_10;
            5'd8: trash_3_sprite =  96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd9: trash_3_sprite =  96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd10: trash_3_sprite = 96'o011_111_100_000_004_444_000_000_111_111_10;
            5'd11: trash_3_sprite = 96'o011_111_000_000_004_444_000_000_011_111_10;
            5'd12: trash_3_sprite = 96'o011_111_000_000_440_000_440_000_011_111_10;
            5'd13: trash_3_sprite = 96'o011_111_000_000_440_000_440_000_001_111_10;
            5'd14: trash_3_sprite = 96'o011_111_000_000_000_440_000_000_001_111_10;
            5'd15: trash_3_sprite = 96'o011_111_000_000_000_440_000_000_001_111_10;
            5'd16: trash_3_sprite = 96'o011_111_000_000_044_000_440_000_001_111_10;
            5'd17: trash_3_sprite = 96'o011_111_000_000_044_000_440_000_001_111_10;
            5'd18: trash_3_sprite = 96'o011_111_000_000_000_444_000_000_001_111_10;
            5'd19: trash_3_sprite = 96'o011_111_000_000_000_444_000_000_011_111_10;
            5'd20: trash_3_sprite = 96'o011_111_100_000_000_000_000_001_111_111_10;
            5'd21: trash_3_sprite = 96'o011_111_110_000_000_000_000_001_111_111_10;
            5'd22: trash_3_sprite = 96'o011_111_111_100_000_000_000_111_111_111_10;
            5'd23: trash_3_sprite = 96'o011_111_111_111_000_000_000_000_001_111_10;
            5'd24: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd25: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd26: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd27: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd28: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd29: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd11: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd31: trash_3_sprite = 96'o011_111_111_111_111_111_111_111_111_111_10;
            5'd32: trash_3_sprite = 96'o011_111_000_000_000_000_000_000_001_111_10;
            default: trash_3_sprite = 96'o000_000_000_000_000_000_000_000_000_000_00;  
        endcase
    end  

    assign trash_3_x = (pixel_x % 32) * 3;
    assign trash_3_y = pixel_y % 32;

    // Color buffers;
    reg [7:0] R_reg, G_reg, B_reg; 
    reg [7:0]R_next, G_next, B_next; 

    always @(*) begin
        if (!display_on) begin
            {R_next, G_next, B_next} = 24'hFFFFFF;
        end else begin
            case ({wall_block, free_path, robot_north, robot_east, robot_south, robot_west, black_block, trash_1, trash_2, trash_3})
                10'b1000_0000_00: begin
                    case (wall_block_sprite[wall_block_x])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;   
                            
                    endcase
                end
                10'b0100_0000_00: begin
                    case (free_path_sprite[free_path_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0010_0000_00: begin
                    case (robot_north_sprite[robot_north_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0001_0000_00: begin
                    case (robot_east_sprite[robot_east_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_1000_00: begin
                    case (robot_south_sprite[robot_south_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_0100_00: begin
                    case (robot_west_sprite[robot_west_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_0010_00: begin
                    case (black_block_sprite[black_block_x])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_0001_00: begin
                    case (trash_1_sprite[trash_1_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_0000_10: begin
                    case (trash_2_sprite[trash_2_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                10'b0000_0000_01: begin
                    case (trash_2_sprite[trash_2_x +: 3])
                        3'd0: {R_next, G_next, B_next} = BLACK;
                        3'd1: {R_next, G_next, B_next} = WHITE;
                        3'd2: {R_next, G_next, B_next} = LIGHT_GREY;
                        3'd3: {R_next, G_next, B_next} = DARK_GREY;
                        3'd4: {R_next, G_next, B_next} = RED;
                        3'd5: {R_next, G_next, B_next} = BLUE;
                        default: {R_next, G_next, B_next} = WHITE;
                    endcase
                end
                default : {R_next, G_next, B_next} = WHITE;
                    
            endcase
        end

    end
    
    always @(clock_25 or display_on) begin
        if (!display_on) begin
            R_reg <= 8'hff;
            G_reg <= 8'hff;
            B_reg <= 8'hff;
        end else begin
            R_reg <= R_next;
            G_reg <= G_next;
            B_reg <= B_next;
        end
    end

    assign R = R_reg;
    assign G = G_reg;
    assign B = B_reg;
	
endmodule