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

module decoder(p, q);
parameter OUTPUTS = 2;
parameter SEL_BITS = $clog2(OUTPUTS); 

input wire [SEL_BITS-1:0] p;
output wire [OUTPUTS-1:0] q;

genvar i;        
generate
  for (i = 0; i < OUTPUTS ; i++) begin
    assign q[i] = (i == p)? 1 : 0;
  end
endgenerate

endmodule
