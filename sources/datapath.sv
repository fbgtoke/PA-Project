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

module datapath(addr_a, addr_b, addr_d, clk, reset, wr_regfile, imm, f);
parameter LENGTH = 32;
parameter  NREGS = 32;
parameter SEL_BITS = $clog2(NREGS);

input wire [SEL_BITS-1:0] addr_a;
input wire [SEL_BITS-1:0] addr_b;
input wire [SEL_BITS-1:0] addr_d;

input wire clk;
input wire reset;
input wire wr_regfile;

input wire [LENGTH-1:0] imm;
input wire f;

wire [LENGTH-1:0] regfile_in;     // Read registers
wire [LENGTH-1:0] A_regfile;
wire [LENGTH-1:0] B_regfile;

wire [1:0] [LENGTH-1:0] mux_A_in; // Select operands
wire [1:0] [LENGTH-1:0] mux_B_in;

wire [LENGTH-1:0] A_dec;                // Decoupling registers
wire [LENGTH-1:0] B_dec;
wire [LENGTH-1:0] A_alu;                // ALU
wire [LENGTH-1:0] B_alu;

wire [LENGTH-1:0] alu_out;        // Write back
wire z;

/* DEC */
// Read registers
regfile #(.LENGTH(32), .NREGS(32)) regfile_instance (
  .data_in(regfile_in),
  .data_out_a(A_regfile), .data_out_b(B_regfile),
  .addr_a(addr_a), .addr_b(addr_b), .addr_d(addr_d),
  .clk(clk), .reset(reset), .wr(wr_regfile)
);

// Select operands
muxN_1 #(.LENGTH(LENGTH), .N(2)) mux_A_PC(
  .p(mux_A_in),
  .sel(f),
  .q(A_dec)
);
assign { mux_A_in[1], mux_A_in[0] } = { A_regfile, A_regfile };

muxN_1 #(.LENGTH(LENGTH), .N(2)) mux_B_IMM(
  .p(mux_B_in),
  .sel(f),
  .q(B_dec)
);
assign { mux_B_in[1], mux_B_in[0] } = { imm, B_regfile };

/* Decoupling register DEC - ALU */
flipflop_wr #(.LENGTH(32)) A_DEC_ALU (
  .p_wr(A_dec), .q_wr(A_alu),
  .clk(clk), .reset(reset), .wr(1'b1)
);

flipflop_wr #(.LENGTH(32)) B_DEC_ALU (
  .p_wr(B_dec), .q_wr(B_alu),
  .clk(clk), .reset(reset), .wr(1'b1)
);

/* ALU */
wire cout;
alu #(.LENGTH(32)) alu_instance (
  .A(A_alu), .B(B_alu),
  .f(f),
  .C(alu_out), .z(z), .cout(cout)
);

/* Decoupling register ALU - WR */
flipflop_wr #(.LENGTH(32)) ALU_WR (
  .p_wr(alu_out), .q_wr(regfile_in),
  .clk(clk), .reset(reset), .wr(1'b1)
);

endmodule
