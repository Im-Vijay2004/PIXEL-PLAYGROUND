`timescale 1ns / 1ps
module MAIN(sys_clk,ctrl,jump,lt,rt,up,dn,reset,hsync,vsync,red,green,blue);
input sys_clk,jump;
input [2:0] ctrl;
input lt,rt,up,dn,reset;
output vsync,hsync;
output reg [3:0] red,green,blue;
wire [3:0] red0,green0,blue0;
wire [3:0] red1,green1,blue1;
wire [3:0] red2,green2,blue2;
wire [3:0] red3,green3,blue3;
wire [3:0] red4,green4,blue4;
wire [3:0] red5,green5,blue5;
reg rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc;
wire [9:0] hcount,vcount;
wire clk_25MHz,clk_100Hz;
CLK_100Hz CLK_DIV1(sys_clk,clk_100Hz);
CLK_25MHz CLK_DIV2(sys_clk,clk_25MHz);
DISP_COUNT ACCESS(clk_25MHz,hcount,vcount,hsync,vsync);
GAME_INTERFACE Intro(clk_25MHz,hcount,vcount,red0,green0,blue0);
DINO_GAME DINO(sys_clk,clk_25MHz,clk_100Hz,hcount,vcount,jump,red1,green1,blue1,rst_dino);
TIC_TAC_TOE TTT(sys_clk,clk_25MHz,lt,rt,up,dn,reset,jump,hcount,vcount,red2,green2,blue2,win,rst_ttt);
DORAEMON_GO DG(sys_clk,clk_25MHz,clk_100Hz,red3,green3,blue3,hcount,vcount,jump,reset,rst_dg);
PING_PONG PP(sys_clk,clk_25MHz,lt,up,dn,rt,jump, red4, green4, blue4,hcount,vcount,rst_pp);
DODGE_CAR DC(sys_clk,clk_25MHz,rt,lt,reset,hcount,vcount,red5,green5,blue5,rst_dc);
always@(*)
begin
    case(ctrl)
        3'b000:
        begin
        {red,green,blue}={red0,green0,blue0};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b11111;
        end
        3'b001:
        begin
        {red,green,blue}={red1,green1,blue1};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b01111;
        end
        3'b010:
        begin
        {red,green,blue}={red2,green2,blue2};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b10111;
        end
        3'b011:
        begin
        {red,green,blue}={red3,green3,blue3};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b11011;
        end
        3'b100:
        begin
        {red,green,blue}={red4,green4,blue4};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b11101;
        end
        3'b101:
        begin
        {red,green,blue}={red5,green5,blue5};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b11110;
        end
        default:
        begin
        {red,green,blue}={red0,green0,blue0};
        {rst_dino,rst_ttt,rst_dg,rst_pp,rst_dc}=5'b11111;
        end
    endcase
end
endmodule