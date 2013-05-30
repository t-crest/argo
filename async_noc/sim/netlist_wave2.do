onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test2_noc2x2/n_clk
add wave -noupdate /test2_noc2x2/reset
add wave -noupdate -divider spm_interface
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(0).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(0)(0).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0)(1).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(0)(1).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(0).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(1)(0).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1)(1).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(1)(1).SData
add wave -noupdate -divider n_spm_interface
add wave -noupdate /test2_noc2x2/n_spm_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal -childformat {{/test2_noc2x2/n_spm_masters(0)(0).MAddr(31) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(30) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(29) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(28) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(27) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(26) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(25) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(24) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(23) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(22) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(21) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(20) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(19) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(18) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(17) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(16) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(15) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(14) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(13) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(12) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(11) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(10) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(9) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(8) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(7) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(6) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(5) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(4) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(3) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(2) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(1) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(0).MAddr(0) -radix hexadecimal}} -subitemconfig {/test2_noc2x2/n_spm_masters(0)(0).MAddr(31) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(30) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(29) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(28) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(27) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(26) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(25) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(24) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(23) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(22) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(21) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(20) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(19) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(18) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(17) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(16) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(15) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(14) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(13) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(12) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(11) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(10) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(9) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(8) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(7) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(6) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(5) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(4) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(3) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(2) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(1) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(0).MAddr(0) {-height 16 -radix hexadecimal}} /test2_noc2x2/n_spm_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(0)(0).MData
add wave -noupdate /test2_noc2x2/n_spm_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal -childformat {{/test2_noc2x2/n_spm_masters(0)(1).MData(63) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(62) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(61) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(60) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(59) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(58) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(57) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(56) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(55) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(54) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(53) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(52) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(51) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(50) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(49) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(48) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(47) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(46) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(45) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(44) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(43) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(42) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(41) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(40) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(39) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(38) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(37) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(36) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(35) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(34) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(33) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(32) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(31) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(30) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(29) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(28) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(27) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(26) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(25) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(24) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(23) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(22) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(21) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(20) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(19) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(18) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(17) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(16) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(15) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(14) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(13) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(12) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(11) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(10) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(9) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(8) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(7) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(6) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(5) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(4) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(3) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(2) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(1) -radix hexadecimal} {/test2_noc2x2/n_spm_masters(0)(1).MData(0) -radix hexadecimal}} -subitemconfig {/test2_noc2x2/n_spm_masters(0)(1).MData(63) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(62) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(61) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(60) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(59) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(58) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(57) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(56) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(55) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(54) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(53) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(52) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(51) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(50) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(49) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(48) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(47) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(46) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(45) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(44) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(43) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(42) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(41) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(40) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(39) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(38) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(37) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(36) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(35) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(34) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(33) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(32) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(31) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(30) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(29) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(28) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(27) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(26) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(25) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(24) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(23) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(22) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(21) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(20) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(19) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(18) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(17) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(16) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(15) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(14) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(13) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(12) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(11) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(10) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(9) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(8) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(7) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(6) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(5) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(4) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(3) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(2) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(1) {-height 16 -radix hexadecimal} /test2_noc2x2/n_spm_masters(0)(1).MData(0) {-height 16 -radix hexadecimal}} /test2_noc2x2/n_spm_masters(0)(1).MData
add wave -noupdate /test2_noc2x2/n_spm_masters(1)(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(1)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(1)(0).MData
add wave -noupdate /test2_noc2x2/n_spm_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/n_spm_masters(1)(1).MData
add wave -noupdate -divider proc_interface
add wave -noupdate /test2_noc2x2/p_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(0)(0).MData
add wave -noupdate /test2_noc2x2/p_slaves(0)(0).SResp
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_slaves(0)(0).SData
add wave -noupdate /test2_noc2x2/p_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(0)(1).MData
add wave -noupdate /test2_noc2x2/p_slaves(0)(1).SResp
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_slaves(0)(1).SData
add wave -noupdate /test2_noc2x2/p_masters(1)(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(1)(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(1)(0).MData
add wave -noupdate /test2_noc2x2/p_slaves(1)(0).SResp
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_slaves(1)(0).SData
add wave -noupdate /test2_noc2x2/p_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_masters(1)(1).MData
add wave -noupdate /test2_noc2x2/p_slaves(1)(1).SResp
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_slaves(1)(1).SData
add wave -noupdate -divider N_0_0
add wave -noupdate /test2_noc2x2/noc2x2/node_0_0/na/na_clk
add wave -noupdate /test2_noc2x2/noc2x2/node_0_0/na/state_cnt
add wave -noupdate /test2_noc2x2/noc2x2/node_0_0/na/slt_entry
add wave -noupdate /test2_noc2x2/noc2x2/node_0_0/na/flit_buf
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_0_0/na/pkt_in
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_0_0/na/pkt_out
add wave -noupdate -divider R_0_0
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\north_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\east_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\south_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\west_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_0/r/\resource_out_f[DATA][0] }
add wave -noupdate -divider N_0_1
add wave -noupdate /test2_noc2x2/noc2x2/node_0_1/na/state_cnt
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_0_1/na/pkt_in
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_0_1/na/pkt_out
add wave -noupdate -divider R_0_1
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\north_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\east_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\south_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\west_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_0_1/r/\resource_out_f[DATA][0] }
add wave -noupdate -divider N_1_0
add wave -noupdate /test2_noc2x2/noc2x2/node_1_0/na/state_cnt
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_1_0/na/pkt_in
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_1_0/na/pkt_out
add wave -noupdate -divider R_1_0
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][3] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][2] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][1] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\north_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\east_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\south_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\west_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_0/r/\resource_out_f[DATA][0] }
add wave -noupdate -divider N_1_1
add wave -noupdate /test2_noc2x2/noc2x2/node_1_1/na/state_cnt
add wave -noupdate /test2_noc2x2/noc2x2/node_1_1/na/slt_entry
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_1_1/na/pkt_in
add wave -noupdate -radix hexadecimal /test2_noc2x2/noc2x2/node_1_1/na/pkt_out
add wave -noupdate -divider R_1_1
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_in_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_in_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_in_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_in_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_in_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\north_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\east_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\south_out_f[DATA][0] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\west_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_out_f[REQ] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_out_f[DATA][34] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_out_f[DATA][33] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_out_f[DATA][32] }
add wave -noupdate {/test2_noc2x2/noc2x2/node_1_1/r/\resource_out_f[DATA][0] }
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {560447 ps} 0} {{Cursor 2} {1820364 ps} 0}
configure wave -namecolwidth 150
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
WaveRestoreZoom {2756800 ps} {3012800 ps}
