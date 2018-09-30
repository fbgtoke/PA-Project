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

module flipflop_wr(p_wr, clk, reset, wr, q_wr);
parameter LENGTH = 1;

input wire [LENGTH-1:0] p_wr;
input wire clk;
input wire reset;
input wire wr;
output wire [LENGTH-1:0] q_wr;

wire [LENGTH-1:0] flipflop_in;
wire [LENGTH-1:0] flipflop_out;

wire [1:0] [LENGTH-1:0] mux_in;
wire [LENGTH-1:0] mux_out;

flipflop #(LENGTH) ff(
  .p(flipflop_in),
  .clk(clk),
  .reset(reset),
  .q(flipflop_out)
);

muxN_1 #(LENGTH,2) m(
  .p(mux_in),
  .sel(wr),
  .q(mux_out)
);

assign { mux_in[1], mux_in[0] } = { p_wr, flipflop_out };
assign flipflop_in = mux_out;
assign q_wr = flipflop_out;

endmodule

