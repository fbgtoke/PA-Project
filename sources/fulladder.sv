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

module fulladder(a, b, sum, cin, cout);
parameter LENGTH = 8;

input wire [LENGTH-1:0] a;
input wire [LENGTH-1:0] b;

output wire [LENGTH-1:0] sum;

input  wire cin;
output wire cout;

wire [LENGTH:0] s;

assign    s = a + b + cin;
assign  sum = s[LENGTH-1:0];
assign cout = s[LENGTH];

endmodule
