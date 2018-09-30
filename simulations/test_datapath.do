onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk -radix binary /test_datapath/clk
add wave -noupdate -label reset -radix binary /test_datapath/reset
add wave -noupdate -label wr_regfile -radix binary /test_datapath/wr_regfile
add wave -noupdate -label addr_a -radix decimal /test_datapath/addr_a
add wave -noupdate -label addr_b -radix decimal /test_datapath/addr_b
add wave -noupdate -label addr_d -radix decimal /test_datapath/addr_d
add wave -noupdate -label imm -radix hexadecimal /test_datapath/imm
add wave -noupdate -label f /test_datapath/f
add wave -noupdate -label r0 -radix hexadecimal {/test_datapath/datapath_instance/regfile_instance/regs_out[0]}
add wave -noupdate -label r1 -radix hexadecimal {/test_datapath/datapath_instance/regfile_instance/regs_out[1]}
add wave -noupdate -label r2 -radix hexadecimal {/test_datapath/datapath_instance/regfile_instance/regs_out[2]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 136
configure wave -valuecolwidth 184
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
WaveRestoreZoom {0 ps} {236 ps}
