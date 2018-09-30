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

module test_datapath;
parameter LENGTH = 32;
parameter  NREGS = 32;
parameter SEL_BITS = $clog2(NREGS);

reg [SEL_BITS-1:0] addr_a;
reg [SEL_BITS-1:0] addr_b;
reg [SEL_BITS-1:0] addr_d;

reg clk;
reg reset;
reg wr_regfile;

reg [LENGTH-1:0] imm;
reg f;

datapath #(.LENGTH(LENGTH), .NREGS(NREGS)) datapath_instance(
  .addr_a(addr_a), .addr_b(addr_b), .addr_d(addr_d),
  .clk(clk), .reset(reset), .wr_regfile(wr_regfile),
  .imm(imm), .f(f)
);

always begin
  #5 clk <= ~clk;
end

initial begin
  #5 clk <= 0;
  reset <= 0;
  wr_regfile <= 0;

  addr_a <= 0;
  addr_b <= 0;
  addr_d <= 0;

  #5  reset <= 1;
  #10 ;

  /**************************************************/
  /* LUI                                            */
  /**************************************************/ 
  #10 reset <= 0;
      imm <= 'hcac00000;
      f <= 1;
  
  #10 ;

  #10 addr_d <= 0;
      wr_regfile <= 1;

  #10 wr_regfile <= 0;
      imm <= 'h01000000;
      f <= 1;

  #10 ;

  #10 addr_d <= 1;
      wr_regfile <= 1;

  /**************************************************/
  /* ADD                                            */
  /**************************************************/

  /* DEC */
  #10 wr_regfile <= 0;
      f <= 0;
      addr_a <= 0;
      addr_b <= 1;
  
  /* ALU */
  #10 ;

  /* WR */
  #10 addr_d <= 2;
      wr_regfile <= 1;

  /* Epilog */
  #10 wr_regfile <= 0;
  #50 ;
end

endmodule
