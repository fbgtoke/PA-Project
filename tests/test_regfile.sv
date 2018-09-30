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

module test_regfile;
parameter LENGTH = 8;
parameter  NREGS = 8;
parameter SEL_BITS = $clog2(NREGS);

reg  [LENGTH-1:0] data_in;
wire [LENGTH-1:0] data_out_a;
wire [LENGTH-1:0] data_out_b;

reg [SEL_BITS-1:0] addr_a;
reg [SEL_BITS-1:0] addr_b;
reg [SEL_BITS-1:0] addr_d;

reg clk;
reg reset;
reg wr;

regfile #(LENGTH, NREGS) regs(
  .data_in(data_in),
  .data_out_a(data_out_a),
  .data_out_b(data_out_b),
  .addr_a(addr_a),
  .addr_b(addr_b),
  .addr_d(addr_d),
  .clk(clk),
  .reset(reset),
  .wr(wr)
);

always begin
  #5 clk <= ~clk;
end

initial begin
  data_in <= 'h00;

  addr_a <= 'd0;
  addr_b <= 'd0;
  addr_d <= 'd0;

  clk <= 0;
  reset <= 0;
  wr <= 0;

  #10 reset <= 1;
  #10 reset <= 0;

  #10 data_in <= 'haa;
  #10 wr <= 1;
  #10 wr <= 0;
  #10 addr_a <= 'd3;
  #10 data_in <= 'hff;
  #10 wr <= 1;
  #10 wr <= 0;
  #10 addr_d <= 'd3;

  #10 $finish;
end

endmodule
