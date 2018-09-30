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

module ins_decoder(ins, opcode)
parameter LENGTH = 32;

input wire [LENGTH-1:0] ins;

output wire [6:0] opcode
output wire [4:0] rd;
output wire [4:0] rs1;
output wire [2:0] funct3;
output wire [4:0] rs2;
output wire [6:0] funct7;

assign opcode = ins[ 6: 0];
assign     rd = ins[11: 7];
assign funct3 = ins[14:12];
assign    rs1 = ins[19:15];
assign    rs2 = ins[24:20];
assign funct7 = ins[31:25];

wire [31:0] imm_I;
assign imm_I = { 21{ins[31]}, ins[30:20] };

wire [31:0] imm_S;
assign imm_S = { 21{ins[31]}, ins[30:25], ins[11:7] };

wire [31:0] imm_B;
assign imm_B = { 20{ins[31]}, ins[7], ins[30:25], ins[11:8], 1'b0 };

wire [31:0] imm_U;
assign imm_U = { ins[31:12], 12{1'b0} };

wire [31:0] imm_J;
assign imm_j = { 12{ins[31]}, ins[19:12], ins[20], ins[30:21], 1'b0 };



endmodule
