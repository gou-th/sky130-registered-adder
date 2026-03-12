`timescale 1ns/1ps

module adder (input clk, input rst, input [7:0] a, input [7:0] b,
                output reg [7:0] sum);
            
    always @(posedge clk or negedge rst) begin
        if (!rst) sum<=8'b0;
        else sum<=a+b;
    end
endmodule
