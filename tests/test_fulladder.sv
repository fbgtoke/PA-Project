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

module test_fulladder;
parameter LENGTH = 4;

reg [LENGTH-1:0] a;
reg [LENGTH-1:0] b;

wire [LENGTH-1:0] sum;

reg cin;
wire cout;

fulladder #(LENGTH) fa(
  .a(a),
  .b(b),
  .sum(sum),
  .cin(cin),
  .cout(cout)
);

initial begin
  #10 a <= 'b1000;
      b <= 'b0111;
      cin <= 0;

  #10 a <= 'b0111;
      b <= 'b1001;
      cin <= 0;

  #10 a <= 'b0000;
      b <= 'b0000;
      cin <= 1;
 
  #10 $finish;
end

endmodule
