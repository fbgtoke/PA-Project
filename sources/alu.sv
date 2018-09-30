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

module alu(A, B, f, C, z, cout);
parameter LENGTH = 32;

input wire [LENGTH-1:0] A;
input wire [LENGTH-1:0] B;

input wire f;

output wire [LENGTH-1:0] C;
output wire z;
output wire cout;

/* ADD */
wire [LENGTH-1:0] ADD_out;

fulladder #(.LENGTH(LENGTH)) adder(
  .a(A), .b(B),
  .sum(ADD_out),
  .cin(1'b0),
  .cout(cout)
);

/* LUI */
wire [LENGTH-1:0] LUI_out;
assign LUI_out = B;

/* mux ADD - LUI */
wire [1:0] [LENGTH-1:0] mux_in;
wire [LENGTH-1:0] mux_out;

muxN_1 #(.LENGTH(LENGTH), .N(2)) mux_ADD_LUI(
  .p(mux_in),
  .sel(f),
  .q(mux_out)
);

assign { mux_in[1], mux_in[0] } = { LUI_out, ADD_out };

assign C = mux_out;
assign z = (C == 'h0);

endmodule
