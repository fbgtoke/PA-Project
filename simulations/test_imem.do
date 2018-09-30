onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk -radix binary /test_imem/clk
add wave -noupdate -label reset -radix binary /test_imem/reset
add wave -noupdate -label PC -radix hexadecimal -childformat {{{/test_imem/pc_out[31]} -radix hexadecimal} {{/test_imem/pc_out[30]} -radix hexadecimal} {{/test_imem/pc_out[29]} -radix hexadecimal} {{/test_imem/pc_out[28]} -radix hexadecimal} {{/test_imem/pc_out[27]} -radix hexadecimal} {{/test_imem/pc_out[26]} -radix hexadecimal} {{/test_imem/pc_out[25]} -radix hexadecimal} {{/test_imem/pc_out[24]} -radix hexadecimal} {{/test_imem/pc_out[23]} -radix hexadecimal} {{/test_imem/pc_out[22]} -radix hexadecimal} {{/test_imem/pc_out[21]} -radix hexadecimal} {{/test_imem/pc_out[20]} -radix hexadecimal} {{/test_imem/pc_out[19]} -radix hexadecimal} {{/test_imem/pc_out[18]} -radix hexadecimal} {{/test_imem/pc_out[17]} -radix hexadecimal} {{/test_imem/pc_out[16]} -radix hexadecimal} {{/test_imem/pc_out[15]} -radix hexadecimal} {{/test_imem/pc_out[14]} -radix hexadecimal} {{/test_imem/pc_out[13]} -radix hexadecimal} {{/test_imem/pc_out[12]} -radix hexadecimal} {{/test_imem/pc_out[11]} -radix hexadecimal} {{/test_imem/pc_out[10]} -radix hexadecimal} {{/test_imem/pc_out[9]} -radix hexadecimal} {{/test_imem/pc_out[8]} -radix hexadecimal} {{/test_imem/pc_out[7]} -radix hexadecimal} {{/test_imem/pc_out[6]} -radix hexadecimal} {{/test_imem/pc_out[5]} -radix hexadecimal} {{/test_imem/pc_out[4]} -radix hexadecimal} {{/test_imem/pc_out[3]} -radix hexadecimal} {{/test_imem/pc_out[2]} -radix hexadecimal} {{/test_imem/pc_out[1]} -radix hexadecimal} {{/test_imem/pc_out[0]} -radix hexadecimal}} -subitemconfig {{/test_imem/pc_out[31]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[30]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[29]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[28]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[27]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[26]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[25]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[24]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[23]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[22]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[21]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[20]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[19]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[18]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[17]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[16]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[15]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[14]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[13]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[12]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[11]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[10]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[9]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[8]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[7]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[6]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[5]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[4]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[3]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[2]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[1]} {-height 13 -radix hexadecimal} {/test_imem/pc_out[0]} {-height 13 -radix hexadecimal}} /test_imem/pc_out
add wave -noupdate -label {PC -> imem_addr} -radix hexadecimal /test_imem/pc_imem
add wave -noupdate -label imem_addr -radix hexadecimal /test_imem/imem_instance/addr
add wave -noupdate -label ins -radix hexadecimal /test_imem/imem_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
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
WaveRestoreZoom {0 ps} {122 ps}
