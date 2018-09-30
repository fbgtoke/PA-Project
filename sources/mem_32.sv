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

package mem_defs;
  typedef enum bit [1:0] {
    LEN_BYTE    = 2'b00,
    LEN_HALF    = 2'b01,
    LEN_WORD    = 2'b10,
    LEN_INVALID = 2'b11
  } data_length_t;
  
  typedef enum bit {
    UNSIG = 1'b0,
      SIG = 1'b1
  } unsigned_t;
endpackage

module mem_32(addr, data_in, data_out, clk, wr, access_mode, sign_mode);
parameter SIZE = 1024;
parameter ADDR_BITS = $clog2(SIZE);

import mem_defs::*;

input wire [ADDR_BITS-1:0] addr;

input wire [31:0] data_in;
output reg [31:0] data_out;

input wire clk;
input wire wr;

input data_length_t access_mode;
input unsigned_t sign_mode;

reg [SIZE-1:0] [7:0] data;

/* Write */
always @ (posedge clk) begin
  if (wr) begin
    case (access_mode)
      LEN_BYTE: begin
                  data[addr+0] <= data_in[7:0];
                end

      LEN_HALF: begin
                  data[addr+0] <= data_in[7:0];
                  data[addr+1] <= data_in[15:8];
                end

      LEN_WORD: begin
                  data[addr+0] <= data_in[7:0];
                  data[addr+1] <= data_in[15:8];
                  data[addr+2] <= data_in[23:16];
                  data[addr+3] <= data_in[31:24];
                end
    endcase
  end
end

/* Read */
always @ (posedge clk) begin
  case (access_mode)
    LEN_BYTE: begin
                data_out[7:0]  <= data[addr+0];

                if (sign_mode == SIG) begin
                  data_out[31:8] <= { 24{ data[addr+0][7] } };
                end
                else begin
                  data_out[31:8] <= 16'b0;
                end
              end

    LEN_HALF: begin
                data_out[7:0]  <= data[addr+0];
                data_out[15:8] <= data[addr+1];

                if (sign_mode == SIG) begin
                  data_out[31:16] <= { 16{ data[addr+1][7] } };
                end
                else begin
                  data_out[31:16] <= 16'b0;
                end
              end

    LEN_WORD: begin
              data_out[31:24] <= data[addr+3];
              data_out[23:16] <= data[addr+2];
              data_out[15:8]  <= data[addr+1];
              data_out[7:0]   <= data[addr+0];
              end
  endcase
end

endmodule
