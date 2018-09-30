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

module test_mux2_1;

reg a;
reg b;
reg sel;
wire c;

mux2_1 m(
  .a(a),
  .b(b),
  .sel(sel),
  .c(c)
);

initial begin
  a <= 0;
  b <= 0;
  sel <= 0;

  #10 a <= 1;
  #10 a <= 0;
  #10 b <= 1;
  #10 b <= 0;
  #10 b <= 1;
  #10 sel <= 1;
  #10 a <= 1;
  #10 sel <= 0;
  #10 $finish;
end

endmodule
