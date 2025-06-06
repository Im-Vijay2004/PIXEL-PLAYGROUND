// Clock Division for 25MHz
module CLK_25MHz(clk_in,clk_out);
input clk_in;
output reg clk_out=0;
integer i;
always @(posedge clk_in)
begin
    if(i==1)
    begin
        clk_out<=~clk_out;
        i<=0;
    end
    else
        i<=i+1;
end
endmodule