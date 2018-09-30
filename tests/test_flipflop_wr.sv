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

module test_flipflop_wr;
parameter N = 8;

reg [N-1:0] p_wr;
reg clk;
reg reset;
reg wr;
wire [N-1:0] q_wr;

flipflop_wr #(N) ff(
  .p_wr(p_wr),
  .clk(clk),
  .reset(reset),
  .wr(wr),
  .q_wr(q_wr)
);

always begin
  #5 clk <= ~clk;
end

initial begin
  p_wr <= '0;
  clk <= 0;
  reset <= 0;
  wr <= 0;

  #10 reset <= 1;
  #10 reset <= 0;

  #10 p_wr <= 'hac;
  #10 p_wr <= 'h00;
  #10 wr <= 1; p_wr <= 'hcc;
  #10 wr <= 0;
  #10 p_wr <= 'hff;
  #10 wr <= 1;
  #10 wr <= 0;
  #10 reset <= 1;
  #10 $finish;
end

endmodule
