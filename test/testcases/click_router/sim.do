onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider in
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/in_s/left_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/in_s/left_ack
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/in_s/right_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/in_s/right_ack
add wave -noupdate -divider hpu
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/hpu_s/left_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/hpu_s/right_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/hpu_s/left_ack
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/hpu_s/right_ack
add wave -noupdate -divider out
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/out_s/left_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/out_s/right_req
add wave -noupdate /router_bench/routers(0)/router_1/router_pipeline(4)/out_s/left_ack
add wave -noupdate -expand /router_bench/routers(0)/router_1/router_pipeline(4)/out_s/right_ack

run 100 ns