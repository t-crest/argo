source tile.globals
set init_mmmc_file {scripts/tile.view}
init_design
set_interactive_constraint_modes TT
set_max_time_borrow 0 [get_clocks]
foreach del_element [get_object_name [get_cells -hierarchical delay_req_element*]] {
#    set_dont_touch $del_element/*
}
