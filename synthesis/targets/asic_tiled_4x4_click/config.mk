asic_tiled_4x4_click: ../src/config_types.vhd \
 targets/asic_tiled_4x4_click/config.vhd \
 ../src/util/math_util.vhd \
 ../src/ocp/ocp_config.vhd \
 ../src/ocp/ocp.vhd \
 ../src/noc_defs.vhd \
 ../src/noc_interface.vhd \
 ../src/ni/counter.vhd \
 ../src/mem/bram.vhd \
 ../src/ni/dma.vhd \
 ../src/util/txt_util.vhd \
 ../test/util/cmd_util.vhd \
 ../src/ni/nAdapter.vhd \
 ../src/routers/asynchronous/rtl/matched_delay.vhd \
 ../src/routers/asynchronous/delays.vhd \
  ../src/routers/click/click.vhd \
 ../src/routers/click/click_stage.vhd \
 ../src/routers/click/fifo.vhd \
 ../src/routers/click/hpu_c.vhd \
 ../src/routers/click/xbar_c.vhd \
 ../src/routers/click/router.vhd \
 ../src/noc/asynchronous/noc_node.vhd \
 ../src/noc/tiled/tile_package.vhd \
 ../src/noc/tiled/tile.vhd \
 ../src/noc/tiled/tiled_noc.vhd clean
	dc_shell -f targets/asic_tiled_4x4_click/synthesis.tcl


asic_tiled_4x4_click_description:
	@echo "asic_tiled_4x4_click "
	@echo "     synthesis for a tiled 4x4 noc with swapped ports"
	@echo "     and pipelined links with a single pipeline stage"
	@echo "     Click elements are used instead of mousetrap for"
	@echo "     this implementation."

SYNTHESIS_DESCRIPTIONS += asic_tiled_4x4_click_description
