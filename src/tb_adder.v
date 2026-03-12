`timescale 1ns/1ps

module tb_adder;

    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;

    wire [7:0] sum;

    adder dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;      // 10ns/100MHz clock
    end

    initial begin
        $dumpfile("gls_waves.vcd");
        $dumpvars(0, tb_adder);

        rst = 0; 
        a = 8'd0;
        b = 8'd0;
        #20;
        rst = 1;

        @(negedge clk); 
        a = 8'd10; b = 8'd20;  // Result 30
        
        @(negedge clk); 
        a = 8'd50; b = 8'd50;  // Result 100
        
        @(negedge clk); 
        a = 8'd200; b = 8'd55; // Result 255
        
        #30;  
        $display("Simulation Complete.");
        $finish;
    end

endmodule