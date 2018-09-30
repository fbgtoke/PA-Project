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

module muxN_1(p, sel, q);
parameter LENGTH = 1;
parameter N = 2;
parameter SEL_BITS = $clog2(N);

input wire [N-1:0][LENGTH-1:0] p;
input wire [SEL_BITS-1:0] sel;
output wire [LENGTH-1:0] q;

assign q = p[sel];

endmodule
