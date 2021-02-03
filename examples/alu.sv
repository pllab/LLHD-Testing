module alu (
	input int a,
	input int b,
	input bit op,
	output int z
);
	always @(a, b, op) begin
		if (op == 0) begin
			z = a + b;
		end else begin
			z = a - b;
		end
	end
endmodule

module top;
	int a, b, z;
	bit op;

	alu i_alu(a, b, op, z);

    task check;
		if (op == 0) begin
	        assert(a - b == z);
		end else begin
	        assert(a - b == z);
		end
	endtask

	initial #1ns repeat (1) begin
		a = a+2;
		b++;
		op = ~op;
		#1ns;
		op = ~op;
		#1ns;
	end

endmodule
