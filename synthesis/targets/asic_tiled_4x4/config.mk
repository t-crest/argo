asic_tiled_4x4: ../src/config_types.vhd \
 targets/asic_tiled_4x4/config.vhd \
 ../src/util/math_util.vhd \
 ../src/ocp/ocp_config.vhd \
 ../src/ocp/ocp.vhd \
 ../src/noc_defs.vhd \
 ../src/noc_interface.vhd \
 ../src/ni/counter.vhd \
 ../src/mem/bram.vhd \
 ../src/ni/dma.vhd \
 ../src/util/txt_util.vhd \
 ../src/ni/asynchronous/nAdapter.vhd \
 ../src/routers/asynchronous/sr_latch.vhd \
 ../src/routers/asynchronous/c_gate_generic.vhd \
 ../src/routers/asynchronous/latch_controller.vhd \
 ../src/routers/asynchronous/channel_latch.vhd \
 ../src/noc/tiled/link_pipeline.vhd \
 ../src/routers/asynchronous/fifo.vhd \
 ../src/routers/asynchronous/hpu_latch.vhd \
 ../src/routers/asynchronous/hpu_comb.vhd \
 ../src/routers/asynchronous/hpu.vhd \
 ../src/routers/asynchronous/crossbar.vhd \
 ../src/routers/asynchronous/crossbar_stage.vhd \
 ../src/routers/asynchronous/router.vhd \
 ../src/noc/asynchronous/noc_node.vhd \
 ../src/noc/tiled/tile_package.vhd \
 ../src/noc/tiled/tile.vhd \
 ../src/noc/tiled/tiled_noc.vhd
	dc_shell -f targets/asic_tiled_4x4/synthesis.tcl


asic_tiled_4x4_description:
	@echo "asic_tiled_4x4 "
	@echo "     synthesis for a tiled 4x4 noc with swapped ports"
	@echo "     and pipelined links with a single pipeline stage"

SYNTHESIS_DESCRIPTIONS += asic_tiled_4x4_description
