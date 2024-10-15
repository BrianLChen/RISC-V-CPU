onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /soc_tb/clk
add wave -noupdate /soc_tb/nRst
add wave -noupdate /soc_tb/soc1/over
add wave -noupdate /soc_tb/soc1/succ
add wave -noupdate /soc_tb/soc1/uart_tx_pin
add wave -noupdate -expand -group core -radix hexadecimal /soc_tb/soc1/tinyriscv_core/pc_pc_o
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/if_inst_o
add wave -noupdate -expand -group core -radix hexadecimal /soc_tb/soc1/tinyriscv_core/if_inst_addr_o
add wave -noupdate -expand -group core -radix unsigned /soc_tb/soc1/tinyriscv_core/rib_pc_addr_o
add wave -noupdate -expand -group core -radix unsigned /soc_tb/soc1/tinyriscv_core/rib_pc_data_i
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/rib_ex_req_o
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/rib_ex_addr_o
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/rib_ex_data_i
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/rib_ex_we_o
add wave -noupdate -expand -group core /soc_tb/soc1/tinyriscv_core/rib_ex_data_o
add wave -noupdate -expand -group ahb /soc_tb/soc1/rib_hold_flag
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/m0_req_i
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/m0_gnt_o
add wave -noupdate -expand -group ahb -radix unsigned /soc_tb/soc1/AHB1/m0_addr_i
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/m1_req_i
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/m1_gnt_o
add wave -noupdate -expand -group ahb -radix unsigned /soc_tb/soc1/AHB1/m1_addr_i
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/s0_addr_o
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/s1_addr_o
add wave -noupdate -expand -group ahb /soc_tb/soc1/AHB1/s2_addr_o
add wave -noupdate -expand -group ram -radix unsigned /soc_tb/soc1/ram1/HADDR
add wave -noupdate -expand -group ram /soc_tb/soc1/ram1/HRDATA
add wave -noupdate -expand -group ram /soc_tb/soc1/ram1/HWRITE
add wave -noupdate -expand -group ram /soc_tb/soc1/ram1/HWDATA
add wave -noupdate -expand -group ram /soc_tb/soc1/ram1/SRAM_data
add wave -noupdate -expand -group clock_control /soc_tb/soc1/clk_control1/cfg_register
add wave -noupdate -group uart /soc_tb/soc1/uart1/clock
add wave -noupdate -group uart /soc_tb/soc1/uart1/uart_cfg_reg
add wave -noupdate -group uart /soc_tb/soc1/uart1/uart_inst_reg
add wave -noupdate -group uart -radix binary /soc_tb/soc1/uart1/uart_status_reg
add wave -noupdate -group uart /soc_tb/soc1/uart1/uart_tx_data_reg
add wave -noupdate -group uart /soc_tb/soc1/uart1/interrupt
add wave -noupdate -radix decimal -childformat {{{/soc_tb/soc1/tinyriscv_core/u_regs/regs[0]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[1]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[2]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[3]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[4]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[5]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[6]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[7]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[8]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[9]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[10]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[11]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[12]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[13]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[14]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[15]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[16]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[17]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[18]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[19]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[20]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[21]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[22]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[23]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[24]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[25]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[26]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[27]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[28]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[29]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[30]} -radix decimal} {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[31]} -radix decimal}} -subitemconfig {{/soc_tb/soc1/tinyriscv_core/u_regs/regs[0]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[1]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[2]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[3]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[4]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[5]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[6]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[7]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[8]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[9]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[10]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[11]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[12]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[13]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[14]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[15]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[16]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[17]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[18]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[19]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[20]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[21]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[22]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[23]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[24]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[25]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[26]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[27]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[28]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[29]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[30]} {-height 15 -radix decimal} {/soc_tb/soc1/tinyriscv_core/u_regs/regs[31]} {-height 15 -radix decimal}} /soc_tb/soc1/tinyriscv_core/u_regs/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {583 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {309 ns} {839 ns}
