onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /loadstore_tb/clk
add wave -noupdate -radix hexadecimal /loadstore_tb/addbus
add wave -noupdate -radix hexadecimal /loadstore_tb/loadbus
add wave -noupdate -radix hexadecimal /loadstore_tb/multbus
add wave -noupdate -radix hexadecimal /loadstore_tb/loadout
add wave -noupdate -radix hexadecimal /loadstore_tb/instbus1
add wave -noupdate -radix hexadecimal /loadstore_tb/instbus2
add wave -noupdate -radix hexadecimal /loadstore_tb/ST0_addr
add wave -noupdate -radix hexadecimal /loadstore_tb/ST1_addr
add wave -noupdate -radix hexadecimal /loadstore_tb/ST0_t
add wave -noupdate -radix hexadecimal /loadstore_tb/ST1_t
add wave -noupdate -radix hexadecimal /loadstore_tb/data_in
add wave -noupdate -radix hexadecimal /loadstore_tb/data_out
add wave -noupdate -radix unsigned /loadstore_tb/ST/ST0_count
add wave -noupdate -radix unsigned /loadstore_tb/ST/ST1_count
add wave -noupdate -radix hexadecimal /loadstore_tb/LD/LD0_t
add wave -noupdate -radix hexadecimal /loadstore_tb/LD/LD1_t
add wave -noupdate /loadstore_tb/LD/new_inst1
add wave -noupdate /loadstore_tb/LD/new_inst2
add wave -noupdate -radix hexadecimal /loadstore_tb/LD/LD0
add wave -noupdate -radix hexadecimal /loadstore_tb/LD/LD1
add wave -noupdate -radix unsigned /loadstore_tb/LD/LD0_count
add wave -noupdate -radix unsigned /loadstore_tb/LD/LD1_count
add wave -noupdate -radix hexadecimal /loadstore_tb/reg0
add wave -noupdate -radix hexadecimal /loadstore_tb/reg1
add wave -noupdate -radix hexadecimal /loadstore_tb/reg2
add wave -noupdate -radix hexadecimal /loadstore_tb/reg3
add wave -noupdate -radix hexadecimal /loadstore_tb/storesig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ns} 0}
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
WaveRestoreZoom {0 ns} {134 ns}
