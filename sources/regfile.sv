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

module regfile(
  data_in,
  data_out_a, data_out_b,
  addr_a, addr_b, addr_d,
  clk, reset, wr
);
parameter   LENGTH = 32;
parameter    NREGS = 8;
parameter SEL_BITS = $clog2(NREGS);

input  wire [LENGTH-1:0] data_in;
output wire [LENGTH-1:0] data_out_a;
output wire [LENGTH-1:0] data_out_b;

input wire [SEL_BITS-1:0] addr_a;
input wire [SEL_BITS-1:0] addr_b;
input wire [SEL_BITS-1:0] addr_d;

input wire clk;
input wire reset;
input wire wr;

/* Decoder */
// Enable write to register pointed by addr_d
wire [SEL_BITS-1:0] decoder_in;
wire [NREGS-1:0] decoder_out;
decoder #(NREGS) dec(
  .p(decoder_in),
  .q(decoder_out)
);

assign decoder_in = addr_d;

/* Registers */
wire [NREGS-1:0] [LENGTH-1:0] regs_in;
wire [NREGS-1:0] [LENGTH-1:0] regs_out;

genvar i;
generate
  for (i = 0; i < NREGS ; i++) begin
    flipflop_wr #(LENGTH) reg_i(
      .p_wr(data_in),
      .clk(clk),
      .reset(reset),
      .wr(wr & decoder_out[i]),
      .q_wr(regs_out[i])
    );
  end
endgenerate

/* Multiplexer */
// Select output pointed by addr_a
muxN_1 #(LENGTH, NREGS) mux_a(
  .p(regs_out),
  .sel(addr_a),
  .q(data_out_a)
);

// Select output pointed by addr_b
muxN_1 #(LENGTH, NREGS) mux_b(
  .p(regs_out),
  .sel(addr_b),
  .q(data_out_b)
);

endmodule
