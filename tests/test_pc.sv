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

module test_pc;
parameter LENGTH = 32;

reg [LENGTH-1:0] p_wr;
reg clk;
reg reset;
reg wr; 
reg pc_in;
wire [LENGTH-1:0] q_wr;

pc #(LENGTH) pc_instance(
  .p_wr(p_wr),
  .clk(clk),
  .reset(reset),
  .wr(wr),
  .pc_in(pc_in),
  .q_wr(q_wr)
);

always begin
  #5 clk <= ~clk;
end

initial begin
  p_wr <= 'h00000000;
  clk <= 0;
  reset <= 0;
  wr <= 0;
  pc_in <= 0;

  #10 reset <= 1;
  #10 reset <= 0;
      wr <= 1;

  #50

  #10 p_wr <= 'hcacaffff;
      pc_in <= 1;
 
  #10 pc_in <= 0;

  #50

  #10 wr <= 0;
   
  #50 $finish;
end

endmodule
