// Access the display
module DISP_COUNT(clk_25MHz,hcount,vcount,hsync,vsync);
input clk_25MHz;
output hsync,vsync;
output reg [9:0] hcount=0;
output reg [9:0] vcount=0;
always @(posedge clk_25MHz)
begin
    if(vcount<521)
    begin
        if(hcount<799)
            hcount<=hcount+1;
        else
        begin
            hcount<=0;
            vcount<=vcount+1;
        end
    end
    else
        vcount<=0;
end
assign vsync=(vcount<=1)?1:0; 
assign hsync=(hcount<=95)?1:0;
endmodule