onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /complete_tb/clk
add wave -noupdate -radix hexadecimal /complete_tb/addbus
add wave -noupdate -radix hexadecimal /complete_tb/instbus1
add wave -noupdate -radix hexadecimal /complete_tb/instbus2
add wave -noupdate -radix hexadecimal /complete_tb/loadbus
add wave -noupdate -radix hexadecimal /complete_tb/multbus
add wave -noupdate -radix hexadecimal /complete_tb/pc1
add wave -noupdate -radix hexadecimal /complete_tb/pc2
add wave -noupdate /complete_tb/exception
add wave -noupdate -radix hexadecimal /complete_tb/reg0
add wave -noupdate -radix hexadecimal /complete_tb/reg1
add wave -noupdate -radix hexadecimal /complete_tb/reg2
add wave -noupdate -radix hexadecimal /complete_tb/reg3
add wave -noupdate -radix hexadecimal /complete_tb/reg0_out
add wave -noupdate -radix hexadecimal /complete_tb/reg1_out
add wave -noupdate -radix hexadecimal /complete_tb/reg2_out
add wave -noupdate -radix hexadecimal /complete_tb/reg3_out
add wave -noupdate -radix hexadecimal /complete_tb/regdata
add wave -noupdate /complete_tb/stall
add wave -noupdate -radix unsigned /complete_tb/COM/col_pt
add wave -noupdate -radix unsigned /complete_tb/COM/index
add wave -noupdate /complete_tb/COM/all_cmplt/all_cmplt
add wave -noupdate /complete_tb/COM/collected
add wave -noupdate /complete_tb/COM/complete
add wave -noupdate -radix hexadecimal /complete_tb/COM/data_que
add wave -noupdate -radix hexadecimal /complete_tb/COM/des_que
add wave -noupdate -radix hexadecimal /complete_tb/COM/op_que
add wave -noupdate -radix hexadecimal /complete_tb/COM/pc_que
add wave -noupdate -radix hexadecimal /complete_tb/COM/res_que
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {72 ns} {204 ns}
