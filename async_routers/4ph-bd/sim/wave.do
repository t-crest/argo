onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_switch/producers(0)/producer/right_f.req
add wave -noupdate -radix hexadecimal /tb_switch/producers(0)/producer/right_f.data
add wave -noupdate /tb_switch/producers(0)/producer/right_b.ack
add wave -noupdate -divider north_in
add wave -noupdate /tb_switch/switch/north_in_latch/controller/Rin
add wave -noupdate /tb_switch/switch/north_in_latch/controller/Aout
add wave -noupdate /tb_switch/switch/north_in_latch/controller/gate/a
add wave -noupdate /tb_switch/switch/north_in_latch/controller/gate/b
add wave -noupdate /tb_switch/switch/north_in_latch/controller/gate/c
add wave -noupdate /tb_switch/switch/north_in_latch/controller/Rout
add wave -noupdate /tb_switch/switch/north_in_latch/controller/Ain
add wave -noupdate /tb_switch/switch/north_in_latch/controller/lt_en
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][33] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][32] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][31] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][30] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][29] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][28] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][27] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][26] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][25] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][24] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][23] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][22] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][21] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][20] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][19] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][18] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][17] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][16] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][15] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][14] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][13] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][12] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][11] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][10] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][9] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][8] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][7] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][6] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][5] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][4] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][3] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][2] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][1] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][0] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][33] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][32] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][31] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][30] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][29] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][28] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][27] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][26] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][25] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][24] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][23] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][22] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][21] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][20] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][19] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][18] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][17] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][16] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][15] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][14] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][13] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][12] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][11] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][10] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][9] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][8] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][7] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][6] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][5] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][4] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][3] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][2] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][1] }
add wave -noupdate -group left_in {/tb_switch/switch/north_in_latch/\left_in[DATA][0] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][33] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][32] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][31] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][30] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][29] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][28] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][27] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][26] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][25] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][24] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][23] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][22] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][21] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][20] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][19] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][18] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][17] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][16] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][15] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][14] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][13] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][12] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][11] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][10] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][9] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][8] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][7] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][6] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][5] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][4] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][3] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][2] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][1] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][0] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][33] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][32] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][31] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][30] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][29] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][28] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][27] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][26] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][25] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][24] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][23] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][22] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][21] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][20] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][19] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][18] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][17] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][16] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][15] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][14] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][13] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][12] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][11] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][10] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][9] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][8] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][7] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][6] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][5] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][4] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][3] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][2] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][1] }
add wave -noupdate -group right_out {/tb_switch/switch/north_in_latch/\right_out[DATA][0] }
add wave -noupdate -divider north_hpu
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Rin
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Aout
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/gate/a
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/gate/b
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/gate/c
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Rout
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Ain
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/lt_en
add wave -noupdate -divider xbar
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_req/output
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/Rin
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/Aout
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/gate/a
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/gate/b
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/gate/c
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/Rout
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/Ain
add wave -noupdate /tb_switch/switch/xbar_with_latches/ch_latch_2/controller/lt_en
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][33] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][32] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][31] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][30] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][29] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][28] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][27] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][26] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][25] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][24] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][23] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][22] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][21] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][20] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][19] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][18] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][17] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][16] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][15] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][14] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][13] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][12] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][11] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][10] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][9] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][8] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][7] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][6] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][5] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][4] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][3] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][2] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][1] }
add wave -noupdate -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][0] }
add wave -noupdate -divider consumer
add wave -noupdate /tb_switch/consumers(0)/consumer/left_f.req
add wave -noupdate -radix hexadecimal /tb_switch/consumers(0)/consumer/left_f.data
add wave -noupdate /tb_switch/consumers(0)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(1)/consumer/left_f.req
add wave -noupdate -radix hexadecimal /tb_switch/consumers(1)/consumer/left_f.data
add wave -noupdate /tb_switch/consumers(1)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(2)/consumer/left_f.req
add wave -noupdate -radix hexadecimal /tb_switch/consumers(2)/consumer/left_f.data
add wave -noupdate /tb_switch/consumers(2)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(3)/consumer/left_f.req
add wave -noupdate -radix hexadecimal /tb_switch/consumers(3)/consumer/left_f.data
add wave -noupdate /tb_switch/consumers(3)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(4)/consumer/left_f.req
add wave -noupdate -radix hexadecimal /tb_switch/consumers(4)/consumer/left_f.data
add wave -noupdate /tb_switch/consumers(4)/consumer/left_b.ack
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\left_in[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\left_out[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\left_in[DATA][33] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\right_in[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\right_out[DATA][33] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\left_in[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\left_out[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\left_in[DATA][33] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\right_in[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\right_out[DATA][33] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\left_in[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\left_out[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\left_in[DATA][33] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_in[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[DATA][33] }
add wave -noupdate -divider hpu_delay
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/data_in
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/data_valid
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/data_out
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/sel
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/N20
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/N16
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/N17
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/N18
add wave -noupdate /tb_switch/switch/north_hpu/hpu_combinatorial/N19
add wave -noupdate -divider input
add wave -noupdate {/tb_switch/switch/north_in_latch/\left_in[REQ] }
add wave -noupdate {/tb_switch/switch/north_in_latch/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/north_in_latch/\left_out[ACK] }
add wave -noupdate {/tb_switch/switch/north_in_latch/\right_in[ACK] }
add wave -noupdate -divider hpu
add wave -noupdate {/tb_switch/switch/north_hpu/\chan_in_f[REQ] }
add wave -noupdate {/tb_switch/switch/north_hpu/\chan_out_f[REQ] }
add wave -noupdate {/tb_switch/switch/north_hpu/\chan_in_b[ACK] }
add wave -noupdate {/tb_switch/switch/north_hpu/\chan_out_b[ACK] }
add wave -noupdate -divider xbar
add wave -noupdate {/tb_switch/switch/xbar_with_latches/\chs_in_f[0][REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/\chs_in_f[1][REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/\chs_in_f[2][REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/\chs_in_f[3][REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/\chs_in_f[4][REQ] }
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_req/output
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_3/\right_out[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_4/\right_out[REQ] }
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12694 ps} 0} {{Cursor 2} {13916 ps} 0}
configure wave -namecolwidth 249
configure wave -valuecolwidth 87
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {11256 ps} {16164 ps}
