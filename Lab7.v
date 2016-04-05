`timescale 1ns/1ns
module counter_divider (output reg tc, input wire clk, input wire rst);
  
  reg [3:0] count, next_count;
  
  // synchronous logic
  always @(posedge clk) begin
    count <= next_count;
  end
  
  // combinational logic
  always @* begin
    // defaults
    tc = 0;
    // count down
    next_count = count - 1;
    if (count == 0) tc = 1;	// set tc to 1 if count = 0
    // priority logic
    if (rst == 1) next_count = 0;
  end
  
endmodule
