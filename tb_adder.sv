`timescale 1ns/1ps

module tb_adder;
    logic clk, rst;
    logic [7:0] a, b, sum;

    adder dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .sum(sum)
    );


    always #5 clk = ~clk;

   initial begin
        $dumpfile("waves.vcd"); 
        $dumpvars(0, tb_adder); 


        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

       
        repeat (2) @(posedge clk);
        rst = 0;

   
        @(posedge clk); 
        a = 15;
        b = 25;
        
        @(posedge clk); 
        #1;            
        $display("Time: %0t | A: %d + B: %d = SUM: %d", $time, a, b, sum);


        @(posedge clk);
        a = 100;
        b = 50;

        @(posedge clk);
        #1;
        $display("Time: %0t | A: %d + B: %d = SUM: %d", $time, a, b, sum);

        repeat (2) @(posedge clk);
        $finish;
    end
endmodule 