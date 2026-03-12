module power_fix;
    // This 'reaches' into your synthesized adder and forces the power nets
    initial begin
        // Force the power pins of the library cells to active states
        force adder.VPWR = 1'b1;
        force adder.VGND = 1'b0;
        
        // Some Sky130 models use these specific names for substrate/well
        force adder.VNB  = 1'b0; // Local substrate (Ground)
        force adder.VPB  = 1'b1; // Local N-well (Power)
    end
endmodule