onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_switch/switch/preset
add wave -noupdate /tb_switch/producers(0)/producer/right_f.token_t
add wave -noupdate /tb_switch/producers(0)/producer/right_f.token_parity
add wave -noupdate -radix hexadecimal /tb_switch/producers(0)/producer/right_f.phit
add wave -noupdate -radix hexadecimal /tb_switch/producers(0)/producer/right_f.phit_parity
add wave -noupdate /tb_switch/producers(0)/producer/right_b.ack
add wave -noupdate -divider north_in
add wave -noupdate /tb_switch/switch/north_in_latch/token_phase
add wave -noupdate /tb_switch/switch/north_in_latch/full_phase
add wave -noupdate /tb_switch/switch/north_in_latch/empty_phase
add wave -noupdate /tb_switch/switch/north_in_latch/data_phase
add wave -noupdate /tb_switch/switch/north_in_latch/data_cd_phase
add wave -noupdate /tb_switch/switch/north_in_latch/latch_controller/Rin
add wave -noupdate /tb_switch/switch/north_in_latch/latch_controller/Aout
add wave -noupdate /tb_switch/switch/north_in_latch/latch_controller/Rout
add wave -noupdate /tb_switch/switch/north_in_latch/latch_controller/Ain
add wave -noupdate -color {Blue Violet} /tb_switch/switch/north_in_latch/latch_controller/lt_en
add wave -noupdate -color {Blue Violet} /tb_switch/switch/north_in_latch/N3
add wave -noupdate /tb_switch/switch/north_in_latch/latch_controller/gate/c
add wave -noupdate -expand -group LEDR_PHIT {/tb_switch/switch/north_in_latch/\LEDR_link_f[TOKEN_T] }
add wave -noupdate -expand -group LEDR_PHIT -color {Blue Violet} {/tb_switch/switch/north_in_latch/\LEDR_link_f[PHIT][32] }
add wave -noupdate -expand -group LEDR_PHIT {/tb_switch/switch/north_in_latch/\LEDR_link_f[PHIT][31] }
add wave -noupdate -expand -group LEDR_PHIT {/tb_switch/switch/north_in_latch/\LEDR_link_f[PHIT][2] }
add wave -noupdate -expand -group LEDR_PHIT {/tb_switch/switch/north_in_latch/\LEDR_link_f[PHIT][1] }
add wave -noupdate -expand -group LEDR_PHIT {/tb_switch/switch/north_in_latch/\LEDR_link_f[PHIT][0] }
add wave -noupdate -expand -group north_in_out {/tb_switch/switch/north_in_latch/\bundled_ch_f[DATA][33] }
add wave -noupdate -expand -group north_in_out -color {Blue Violet} {/tb_switch/switch/north_in_latch/\bundled_ch_f[DATA][32] }
add wave -noupdate -expand -group north_in_out {/tb_switch/switch/north_in_latch/\bundled_ch_f[DATA][2] }
add wave -noupdate -expand -group north_in_out {/tb_switch/switch/north_in_latch/\bundled_ch_f[DATA][1] }
add wave -noupdate -expand -group north_in_out {/tb_switch/switch/north_in_latch/\bundled_ch_f[DATA][0] }
add wave -noupdate {/tb_switch/switch/north_in_latch/\bundled_ch_f_reg[DATA][0] /Q}
add wave -noupdate {/tb_switch/switch/north_in_latch/\bundled_ch_f_reg[DATA][0] /D}
add wave -noupdate {/tb_switch/switch/north_in_latch/\bundled_ch_f_reg[DATA][0] /G}
add wave -noupdate -divider north_hpu
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Rin
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Aout
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Rout
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/Ain
add wave -noupdate -color {Blue Violet} /tb_switch/switch/north_hpu/token_latch/controller/lt_en
add wave -noupdate -color {Blue Violet} /tb_switch/switch/north_hpu/token_latch/N3
add wave -noupdate /tb_switch/switch/north_hpu/token_latch/controller/gate/c
add wave -noupdate -radix hexadecimal /tb_switch/switch/north_hpu/hpu_combinatorial/data_out
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][33] }
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][32] }
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][3] }
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][2] }
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][1] }
add wave -noupdate -expand -group hpu_in {/tb_switch/switch/north_hpu/token_latch/\left_in[DATA][0] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][33] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][32] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][3] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][2] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][1] }
add wave -noupdate -expand -group hpu_out {/tb_switch/switch/north_hpu/token_latch/\right_out[DATA][0] }
add wave -noupdate -divider xbar
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_req/input
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_req/output
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_b[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_b[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_T] /D}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_T] /CP}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_PARITY] /D}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_PARITY] /CP}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\bundled_ch_f[REQ] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\bundled_ch_b[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_b[ACK] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_T] /Q}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_T] /D}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_T] /CP}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_PARITY] /Q}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_PARITY] /D}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f_reg[TOKEN_PARITY] /CP}
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_ack/input
add wave -noupdate /tb_switch/switch/xbar_with_latches/crossbar/c_sync_ack/output
add wave -noupdate -expand -group xbar_in {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[DATA][32] }
add wave -noupdate -expand -group xbar_in {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[DATA][3] }
add wave -noupdate -expand -group xbar_in {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[DATA][2] }
add wave -noupdate -expand -group xbar_in {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[DATA][1] }
add wave -noupdate -expand -group xbar_in {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_f[DATA][0] }
add wave -noupdate -expand -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[PHIT][32] }
add wave -noupdate -expand -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[PHIT][3] }
add wave -noupdate -expand -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[PHIT][2] }
add wave -noupdate -expand -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[PHIT][1] }
add wave -noupdate -expand -group xbar_out {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[PHIT][0] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_0/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_1/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_3/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_3/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_4/\LEDR_link_f[TOKEN_T] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_4/\LEDR_link_f[TOKEN_PARITY] }
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_T] /Q}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_T] /D}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\LEDR_link_f_reg[TOKEN_T] /CP}
add wave -noupdate {/tb_switch/switch/xbar_with_latches/ch_latch_2/\bundled_ch_b[ACK] }
add wave -noupdate -divider all_in
add wave -noupdate /tb_switch/producers(0)/producer/right_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/producers(0)/producer/right_f.phit
add wave -noupdate /tb_switch/producers(0)/producer/right_b.ack
add wave -noupdate /tb_switch/producers(1)/producer/right_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/producers(1)/producer/right_f.phit
add wave -noupdate /tb_switch/producers(1)/producer/right_b.ack
add wave -noupdate /tb_switch/producers(2)/producer/right_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/producers(2)/producer/right_f.phit
add wave -noupdate /tb_switch/producers(2)/producer/right_b.ack
add wave -noupdate /tb_switch/producers(3)/producer/right_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/producers(3)/producer/right_f.phit
add wave -noupdate /tb_switch/producers(3)/producer/right_b.ack
add wave -noupdate /tb_switch/producers(4)/producer/right_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/producers(4)/producer/right_f.phit
add wave -noupdate /tb_switch/producers(4)/producer/right_b.ack
add wave -noupdate -divider all_out
add wave -noupdate /tb_switch/consumers(0)/consumer/left_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/consumers(0)/consumer/left_f.phit
add wave -noupdate /tb_switch/consumers(0)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(1)/consumer/left_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/consumers(1)/consumer/left_f.phit
add wave -noupdate /tb_switch/consumers(1)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(2)/consumer/left_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/consumers(2)/consumer/left_f.phit
add wave -noupdate /tb_switch/consumers(2)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(3)/consumer/left_f.token_t
add wave -noupdate -radix hexadecimal /tb_switch/consumers(3)/consumer/left_f.phit
add wave -noupdate /tb_switch/consumers(3)/consumer/left_b.ack
add wave -noupdate /tb_switch/consumers(4)/consumer/left_f.token_t
add wave -noupdate /tb_switch/consumers(4)/consumer/left_f.token_parity
add wave -noupdate -radix hexadecimal /tb_switch/consumers(4)/consumer/left_f.phit
add wave -noupdate /tb_switch/consumers(4)/consumer/left_b.ack
add wave -noupdate {/tb_switch/switch/south_hpu/token_latch/\data_reg[33] /Q}
add wave -noupdate {/tb_switch/switch/south_hpu/token_latch/\data_reg[33] /D}
add wave -noupdate {/tb_switch/switch/south_hpu/token_latch/\data_reg[33] /G}
add wave -noupdate /tb_switch/switch/south_hpu/token_latch/controller/lt_en
add wave -noupdate /tb_switch/switch/south_hpu/token_latch/controller/Rin
add wave -noupdate /tb_switch/switch/south_hpu/token_latch/controller/Aout
add wave -noupdate /tb_switch/switch/south_hpu/token_latch/controller/Rout
add wave -noupdate /tb_switch/switch/south_hpu/token_latch/controller/Ain
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12874 ps} 0} {{Cursor 2} {7720 ps} 0} {{Cursor 3} {10824 ps} 0}
configure wave -namecolwidth 236
configure wave -valuecolwidth 100
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
WaveRestoreZoom {8643 ps} {18851 ps}
