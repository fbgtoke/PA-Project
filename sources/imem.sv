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

module imem(addr, ins, clk);
parameter LENGTH = 32;
parameter SIZE = 1024;
parameter SEL_BITS = $clog2(SIZE);

input wire [SEL_BITS-1:0] addr;
output reg [LENGTH-1:0] ins;

input wire clk;

reg [SIZE-1:0][7:0] memory;

always @ (posedge clk) begin
  ins <=
  {
    memory[addr + 3],
    memory[addr + 2],
    memory[addr + 1],
    memory[addr + 0]
  };
end

/* Test program */
initial begin
  //       imm[31:12]|   rd| opcode
  // 0000000000000000|00000|0110111 LUI rd,imm20
  memory[0] <= 8'h0f; memory[1] <= 8'h0f; memory[2] <= 8'h00; memory[3] <= 8'h67; // LUI 0,0x0f0f
  memory[4] <= 8'hf0; memory[5] <= 8'h00; memory[6] <= 8'h00; memory[7] <= 8'hb7; // LUI 1,0xf000

  //    imm[11:0]|  rs1|funct3|   rd| opcode
  // 000000000000|00000|   000|00000|0010011 ADDI rd,rs1,imm12
  memory[8] <= 8'h00; memory[9] <= 8'h00; memory[10] <= 8'h00; memory[11] <= 8'h33; // ADDI 0,0,0x0f0

  // funct5|funct2|  rs2|  rs1|funct3|   rd| opcode
  //  00000|    00|00000|00000|   000|00000|0110011 ADD rd,rs1,rs2
  memory[12] <= 8'h00; memory[13] <= 8'h10; memory[14] <= 8'h01; memory[15] <= 8'h33; // ADD 2,0,1
end

endmodule
