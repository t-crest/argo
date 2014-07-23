proc replace_cell {cellname newcellname newcelltype} {
    create_cell $newcellname $newcelltype
    set old_pins [get_object_name [get_pins -of_object [get_cell $cellname]]]
    set new_pins [get_object_name [get_pins -of_object [get_cell $newcellname]]]

    foreach old_pin $old_pins new_pin $new_pins {
	set net [get_net -of_object [get_pin $old_pin]]
        connect_net $net $new_pin
    }
    remove_cell $cellname
}

foreach stage [join $pipeline_stages] {
    set name_f [::pipeline_stage::get_name_forward $stage]
    set name_b [::pipeline_stage::get_name_backward $stage]

    set type_string [grid_element::get_type [::pipeline_stage::get_parent $stage]]

    foreach name "$name_f $name_b" {
	set cell [get_attribute $name ref_name]
	#set cell [dbGet [dbGet top.hInst.hinsts.name $name -p].cell.name]
	set cell_split [split $cell _]
	set type [lindex $cell_split 2]
	if {$type == 0} { set ntype 1 } else { set ntype 0 }
	if {($type == 0 && $type_string eq "track_h") || ($type == 1 && $type_string eq "track_v")} {
	    set ncell [join [lreplace $cell_split 2 2 $ntype] _]	

	    replace_cell $name $name\_flip $ncell
	}
    }
}
