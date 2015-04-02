onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate -radix hexadecimal /top_tb/inst1
add wave -noupdate -radix hexadecimal /top_tb/inst2
add wave -noupdate -radix hexadecimal /top_tb/pc1
add wave -noupdate -radix hexadecimal /top_tb/pc2
add wave -noupdate -radix hexadecimal /top_tb/instbus1
add wave -noupdate -radix hexadecimal /top_tb/instbus2
add wave -noupdate -radix hexadecimal /top_tb/data_in
add wave -noupdate -radix hexadecimal /top_tb/data_out
add wave -noupdate -radix hexadecimal /top_tb/addbus
add wave -noupdate -radix hexadecimal /top_tb/loadbus
add wave -noupdate -radix hexadecimal /top_tb/multbus
add wave -noupdate -radix hexadecimal /top_tb/ST0_addr
add wave -noupdate -radix hexadecimal /top_tb/ST0_t
add wave -noupdate -radix hexadecimal /top_tb/ST1_addr
add wave -noupdate -radix hexadecimal /top_tb/ST1_t
add wave -noupdate -radix hexadecimal /top_tb/data_clct
add wave -noupdate /top_tb/exception
add wave -noupdate -radix hexadecimal /top_tb/reg0
add wave -noupdate -radix hexadecimal /top_tb/reg1
add wave -noupdate -radix hexadecimal /top_tb/reg2
add wave -noupdate -radix hexadecimal /top_tb/reg3
add wave -noupdate -radix hexadecimal /top_tb/DSPT/R3_t
add wave -noupdate -radix hexadecimal /top_tb/reg0_cmp
add wave -noupdate -radix hexadecimal /top_tb/reg1_cmp
add wave -noupdate -radix hexadecimal /top_tb/reg2_cmp
add wave -noupdate -radix hexadecimal /top_tb/reg3_cmp
add wave -noupdate /top_tb/stall1
add wave -noupdate /top_tb/stall1_cmp
add wave -noupdate /top_tb/stall1_dspt
add wave -noupdate /top_tb/stall2
add wave -noupdate -radix hexadecimal /top_tb/storesig
add wave -noupdate /top_tb/COM/collected
add wave -noupdate /top_tb/COM/complete
add wave -noupdate -radix hexadecimal -childformat {{{/top_tb/COM/data_que[15]} -radix hexadecimal} {{/top_tb/COM/data_que[14]} -radix hexadecimal} {{/top_tb/COM/data_que[13]} -radix hexadecimal} {{/top_tb/COM/data_que[12]} -radix hexadecimal} {{/top_tb/COM/data_que[11]} -radix hexadecimal} {{/top_tb/COM/data_que[10]} -radix hexadecimal} {{/top_tb/COM/data_que[9]} -radix hexadecimal} {{/top_tb/COM/data_que[8]} -radix hexadecimal} {{/top_tb/COM/data_que[7]} -radix hexadecimal} {{/top_tb/COM/data_que[6]} -radix hexadecimal} {{/top_tb/COM/data_que[5]} -radix hexadecimal} {{/top_tb/COM/data_que[4]} -radix hexadecimal} {{/top_tb/COM/data_que[3]} -radix hexadecimal} {{/top_tb/COM/data_que[2]} -radix hexadecimal} {{/top_tb/COM/data_que[1]} -radix hexadecimal} {{/top_tb/COM/data_que[0]} -radix hexadecimal}} -expand -subitemconfig {{/top_tb/COM/data_que[15]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[14]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[13]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[12]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[11]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[10]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[9]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[8]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[7]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[6]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[5]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[4]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[3]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[2]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[1]} {-height 15 -radix hexadecimal} {/top_tb/COM/data_que[0]} {-height 15 -radix hexadecimal}} /top_tb/COM/data_que
add wave -noupdate -radix hexadecimal -childformat {{{/top_tb/COM/des_que[15]} -radix hexadecimal} {{/top_tb/COM/des_que[14]} -radix hexadecimal} {{/top_tb/COM/des_que[13]} -radix hexadecimal} {{/top_tb/COM/des_que[12]} -radix hexadecimal} {{/top_tb/COM/des_que[11]} -radix hexadecimal} {{/top_tb/COM/des_que[10]} -radix hexadecimal} {{/top_tb/COM/des_que[9]} -radix hexadecimal} {{/top_tb/COM/des_que[8]} -radix hexadecimal} {{/top_tb/COM/des_que[7]} -radix hexadecimal} {{/top_tb/COM/des_que[6]} -radix hexadecimal} {{/top_tb/COM/des_que[5]} -radix hexadecimal} {{/top_tb/COM/des_que[4]} -radix hexadecimal} {{/top_tb/COM/des_que[3]} -radix hexadecimal} {{/top_tb/COM/des_que[2]} -radix hexadecimal} {{/top_tb/COM/des_que[1]} -radix hexadecimal} {{/top_tb/COM/des_que[0]} -radix hexadecimal}} -expand -subitemconfig {{/top_tb/COM/des_que[15]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[14]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[13]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[12]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[11]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[10]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[9]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[8]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[7]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[6]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[5]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[4]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[3]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[2]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[1]} {-height 15 -radix hexadecimal} {/top_tb/COM/des_que[0]} {-height 15 -radix hexadecimal}} /top_tb/COM/des_que
add wave -noupdate -radix hexadecimal /top_tb/COM/op_que
add wave -noupdate -radix hexadecimal /top_tb/COM/pc_que
add wave -noupdate -radix hexadecimal -childformat {{{/top_tb/COM/res_que[15]} -radix hexadecimal} {{/top_tb/COM/res_que[14]} -radix hexadecimal} {{/top_tb/COM/res_que[13]} -radix hexadecimal} {{/top_tb/COM/res_que[12]} -radix hexadecimal} {{/top_tb/COM/res_que[11]} -radix hexadecimal} {{/top_tb/COM/res_que[10]} -radix hexadecimal} {{/top_tb/COM/res_que[9]} -radix hexadecimal} {{/top_tb/COM/res_que[8]} -radix hexadecimal} {{/top_tb/COM/res_que[7]} -radix hexadecimal} {{/top_tb/COM/res_que[6]} -radix hexadecimal} {{/top_tb/COM/res_que[5]} -radix hexadecimal} {{/top_tb/COM/res_que[4]} -radix hexadecimal} {{/top_tb/COM/res_que[3]} -radix hexadecimal} {{/top_tb/COM/res_que[2]} -radix hexadecimal} {{/top_tb/COM/res_que[1]} -radix hexadecimal} {{/top_tb/COM/res_que[0]} -radix hexadecimal}} -subitemconfig {{/top_tb/COM/res_que[15]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[14]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[13]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[12]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[11]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[10]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[9]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[8]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[7]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[6]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[5]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[4]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[3]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[2]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[1]} {-height 15 -radix hexadecimal} {/top_tb/COM/res_que[0]} {-height 15 -radix hexadecimal}} /top_tb/COM/res_que
add wave -noupdate -radix unsigned /top_tb/COM/col_pt
add wave -noupdate -radix unsigned /top_tb/COM/index
add wave -noupdate -radix unsigned /top_tb/COM/load_data/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 92
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
WaveRestoreZoom {12 ns} {147 ns}
