/* 
 * This file is part of the Processor Architecture (PA) course project
 * Copyright (c) 2018 Fabio Banchelli.
 * 
 * This program is free software: you can redistribute it and/or modify  
 * it under the terms of the GNU General Public License as published by  
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License 
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

module test_imem;
parameter LENGTH = 32;
parameter SIZE = 1024;
parameter SEL_BITS = $clog2(SIZE);

reg clk;
reg reset;

wire [LENGTH-1:0] pc_out;
wire [LENGTH-1:0] imem_out;

pc #(.LENGTH(LENGTH)) pc_instance(
	.p_wr(32'h0), .q_wr(pc_out),
  .clk(clk), .reset(reset), .wr(1'b1),
	.pc_in(1'b0)
);

wire [SEL_BITS-1:0] pc_imem;
assign pc_imem = pc_out[SEL_BITS-1:0];

imem #(.LENGTH(LENGTH), .SIZE(SIZE)) imem_instance(
	.addr(pc_imem), .ins(imem_out),
	.clk(clk)
);

always begin
	#5 clk <= ~clk;
end

initial begin
	clk <= 1;
	reset <= 0;

	#10 reset <= 1;
	#10 reset <= 0;
	#50 reset <= 1;
	#10 reset <= 0;
	#50 ;
end

endmodule
