/*
 * Copyright (c) 2019 Xilinx Inc.
 * Written by Meera Bagdai. 
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy 
 * of this software and associated documentation files (the 'Software'), to deal 
 * in the Software without restriction, including without limitation the rights 
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
 * copies of the Software, and to permit persons to whom the Software is 
 * furnished to do so, subject to the following conditions: 
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * Description: 
 *
 *
 */

// Used for Calculating DATA RAM address bits
`define CLOG2(x) \
(x <= 2) ? 1 : \
 (x <= 4) ? 2 : \
 (x <= 8) ? 3 : \
 (x <= 16) ? 4 : \
 (x <= 32) ? 5 : \
 (x <= 64) ? 6 : \
 (x <= 128) ? 7 : \
 (x <= 256) ? 8 : \
 (x <= 512) ? 9 : \
 (x <= 1024) ? 10 : \
 (x <= 2048) ? 11 : \
 (x <= 4096) ? 12 : \
 (x <= 8192) ? 13 : \
 (x <= 16384) ? 14 : \
 (x <= 32768) ? 15 : \
 (x <= 65536) ? 16 : \
 (x <= 131072) ? 17 : \
 -1


`define FF(clk,rst,in_signal,out_signal) \
 always@(posedge clk) begin \
 if (rst) begin \
 out_signal<=0; \
 end else begin \
 out_signal<=in_signal; \
 end \
 end \
 

`define FF_RSTLOW(clk,resetn,in_signal,out_signal) \
 always@(posedge clk) begin \
 if (resetn == 1'b0) begin \
 out_signal<=0; \
 end else begin \
 out_signal<=in_signal; \
 end \
 end



`define WIRE_IDX_VLD(case_var,idx,vld) \
 case(case_var) \
 VEC_0: begin \
 assign idx = 'h0; \
 assign vld = 1'b1; \
 end VEC_1: begin \
 assign idx = 'h1; \
 assign vld = 1'b1; \
 end VEC_2: begin \
 assign idx = 'h2; \
 assign vld = 1'b1; \
 end VEC_3: begin \
 assign idx = 'h3; \
 assign vld = 1'b1; \
 end VEC_4: begin \
 assign idx = 'h4; \
 assign vld = 1'b1; \
 end VEC_5: begin \
 assign idx = 'h5; \
 assign vld = 1'b1; \
 end VEC_6: begin \
 assign idx = 'h6; \
 assign vld = 1'b1; \
 end VEC_7: begin \
 assign idx = 'h7; \
 assign vld = 1'b1; \
 end VEC_8: begin \
 assign idx = 'h8; \
 assign vld = 1'b1; \
 end VEC_9: begin \
 assign idx = 'h9; \
 assign vld = 1'b1; \
 end VEC_A: begin \
 assign idx = 'hA; \
 assign vld = 1'b1; \
 end VEC_B: begin \
 assign idx = 'hB; \
 assign vld = 1'b1; \
 end VEC_C: begin \
 assign idx = 'hC; \
 assign vld = 1'b1; \
 end VEC_D: begin \
 assign idx = 'hD; \
 assign vld = 1'b1; \
 end VEC_E: begin \
 assign idx = 'hE; \
 assign vld = 1'b1; \
 end VEC_F: begin \
 assign idx = 'hF; \
 assign vld = 1'b1; \
 end default: begin \
 assign idx = 'h0; \
 assign vld = 1'b0; \
 end \
 endcase

`define REG_IDX_VLD(case_var,idx,vld) \
 case(case_var) \
 VEC_0: begin \
 idx <= 'h0; \
 vld <= 1'b1; \
 end VEC_1: begin \
 idx <= 'h1; \
 vld <= 1'b1; \
 end VEC_2: begin \
 idx <= 'h2; \
 vld <= 1'b1; \
 end VEC_3: begin \
 idx <= 'h3; \
 vld <= 1'b1; \
 end VEC_4: begin \
 idx <= 'h4; \
 vld <= 1'b1; \
 end VEC_5: begin \
 idx <= 'h5; \
 vld <= 1'b1; \
 end VEC_6: begin \
 idx <= 'h6; \
 vld <= 1'b1; \
 end VEC_7: begin \
 idx <= 'h7; \
 vld <= 1'b1; \
 end VEC_8: begin \
 idx <= 'h8; \
 vld <= 1'b1; \
 end VEC_9: begin \
 idx <= 'h9; \
 vld <= 1'b1; \
 end VEC_A: begin \
 idx <= 'hA; \
 vld <= 1'b1; \
 end VEC_B: begin \
 idx <= 'hB; \
 vld <= 1'b1; \
 end VEC_C: begin \
 idx <= 'hC; \
 vld <= 1'b1; \
 end VEC_D: begin \
 idx <= 'hD; \
 vld <= 1'b1; \
 end VEC_E: begin \
 idx <= 'hE; \
 vld <= 1'b1; \
 end VEC_F: begin \
 idx <= 'hF; \
 vld <= 1'b1; \
 end default: begin \
 idx <= 'h0; \
 vld <= 1'b0; \
 end \
 endcase

`define IF_INTFS_FULLACE if (ACE_PROTOCOL=="FULLACE") begin
`define IF_INTFS_LITEACE if (ACE_PROTOCOL=="LITEACE") begin

`ifndef END_INTFS
 `define END_INTFS end
`endif
 

`define IF_ACECH_SLV_WR_REQ if (ACE_CHANNEL=="SLV_WR_REQ") begin

`define ELSE end else begin
`define END end
 

 //Transaction type : AXBAR[0], AXDOMAIN, AXSNOOP (AR, single R, RACK)
`define RD_TXN_CLEANUNIQUE_0 { 1'h0, 2'h1, 4'hB }
`define RD_TXN_CLEANUNIQUE_1 { 1'h0, 2'h2, 4'hB }
`define RD_TXN_MAKEUNIQUE_0 { 1'h0, 2'h1, 4'hC }
`define RD_TXN_MAKEUNIQUE_1 { 1'h0, 2'h2, 4'hC }
`define RD_TXN_CLEANSHARED_0 { 1'h0, 2'h0, 4'h8 }
`define RD_TXN_CLEANSHARED_1 { 1'h0, 2'h1, 4'h8 }
`define RD_TXN_CLEANSHARED_2 { 1'h0, 2'h2, 4'h8 }
`define RD_TXN_CLEANINVALID_0 { 1'h0, 2'h0, 4'h9 }
`define RD_TXN_CLEANINVALID_1 { 1'h0, 2'h1, 4'h9 }
`define RD_TXN_CLEANINVALID_2 { 1'h0, 2'h2, 4'h9 }
`define RD_TXN_MAKEINVALID_0 { 1'h0, 2'h0, 4'hD }
`define RD_TXN_MAKEINVALID_1 { 1'h0, 2'h1, 4'hD }
`define RD_TXN_MAKEINVALID_2 { 1'h0, 2'h2, 4'hD }
`define RD_TXN_BARRIER_0 { 1'h1, 2'h0, 4'h0 }
`define RD_TXN_BARRIER_1 { 1'h1, 2'h1, 4'h0 }
`define RD_TXN_BARRIER_2 { 1'h1, 2'h2, 4'h0 }
`define RD_TXN_BARRIER_3 { 1'h1, 2'h3, 4'h0 }
`define RD_TXN_DVMCOMP_0 { 1'h0, 2'h1, 4'hE }
`define RD_TXN_DVMCOMP_1 { 1'h0, 2'h2, 4'hE }
`define RD_TXN_DVMMSG_0 { 1'h0, 2'h1, 4'hF }
`define RD_TXN_DVMMSG_1 { 1'h0, 2'h2, 4'hF }



 //Transaction type : AXBAR[0], AXDOMAIN, AXSNOOP (AW, B, WACK) (No W)
`define WR_TXN_EVICT_0 { 1'h0, 2'h1, 3'h4 }
`define WR_TXN_EVICT_1 { 1'h0, 2'h2, 3'h4 }
`define WR_TXN_BARRIER_0 { 1'h1, 2'h0, 3'h0 }
`define WR_TXN_BARRIER_1 { 1'h1, 2'h1, 3'h0 }
`define WR_TXN_BARRIER_2 { 1'h1, 2'h2, 3'h0 }
`define WR_TXN_BARRIER_3 { 1'h1, 2'h3, 3'h0 }
