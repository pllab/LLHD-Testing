module acc_tb;
    bit clk, en;
    bit [31:0] x, q;
    acc i_dut (.*);

    initial begin
        automatic bit [31:0] i = 0;
        en <= #2ns 1;
        do begin
            x <= #2ns i;
            clk <= #1ns 1;
            clk <= #2ns 0;
            #2ns;
            check(i, q);
        end while (i++ < 1337);
    end 

    function check(bit [31:0] i, bit [31:0] q);
        assert(q == i*(i+1)/2);
    endfunction
endmodule

module acc (
    input clk,
    input [31:0] x,
    input en,
    output [31:0] q
);
    bit [31:0] d, q;
    always_ff @(posedge clk) q <= #1ns d;
    always_comb begin
        d <= #2ns q;
        if (en) d <= #2ns q+x;
    end
endmodule