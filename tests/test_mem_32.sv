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

module test_mem_32;
parameter SIZE = 256;
parameter ADDR_BITS = $clog2(SIZE);

import mem_defs::*;

reg [ADDR_BITS-1:0] addr;

reg [31:0] data_in;
wire [31:0] data_out;

reg clk;
reg wr;

data_length_t access_mode;
unsigned_t sign_mode;

mem_32 #(SIZE) mem(
  .addr(addr),
  .data_in(data_in),
  .data_out(data_out),
  .clk(clk),
  .wr(wr),
  .access_mode(access_mode),
  .sign_mode(sign_mode)
);

always begin
  #5 clk <= ~clk;
end

initial begin
  addr <= 'h00;
  data_in <= 'h00000000;

  clk <= 0;
  wr  <= 0;

  access_mode <= LEN_HALF;
  sign_mode <= UNSIG;

  #10 data_in <= 'h000fab10;
      wr <= 1;
      sign_mode <= SIG;
  #10 wr <= 0;

  #10 addr <= 'h10;

  #10 data_in <= 'h13370000;
      wr <= 1;
      access_mode <= LEN_WORD;
  #10 wr <= 0;

  #10 addr <= 'h00000000;
      access_mode <= LEN_HALF;
      sign_mode <= UNSIG;

  #20 $finish;
end

endmodule
