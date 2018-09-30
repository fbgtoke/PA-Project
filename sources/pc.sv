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

module pc(p_wr, clk, reset, wr, pc_in, q_wr);
parameter LENGTH = 32;

input wire [LENGTH-1:0] p_wr;
input wire clk;
input wire reset;
input wire wr;
input wire pc_in;
output wire [LENGTH-1:0] q_wr;

/* PC Register */
wire [LENGTH-1:0] ff_in;
wire [LENGTH-1:0] ff_out;

flipflop_wr #(LENGTH) ff(
  .p_wr(ff_in),
  .clk(clk),
  .reset(reset),
  .wr(wr),
  .q_wr(ff_out)
);

/* Multiplexer to select seq or given addr */
wire [1:0] [LENGTH-1:0] mux_in;

muxN_1 #(.LENGTH(LENGTH), .N(2)) mux(
  .p(mux_in),
  .sel(pc_in),
  .q(ff_in)
);

/* Adder PC+4 */
reg [LENGTH-1:0] pc4 = 'd4;
wire [LENGTH-1:0] adder_out;
wire cout;

fulladder #(.LENGTH(LENGTH)) adder(
  .a(pc4),
  .b(ff_out),
  .sum(adder_out),
  .cin(1'b0),
  .cout(cout)
);

assign q_wr = ff_out;
assign { mux_in[1], mux_in[0] } = { p_wr, adder_out };

endmodule
