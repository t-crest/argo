set p_left $fp_left
    set p_right [expr $fp_width - $fp_right]
    set p_top [expr $fp_height - $fp_top]
    set p_bottom [expr $router_height + $fp_distance + $fp_bottom]
    
    set p_w [expr $p_right - $p_left]
    set p_h [expr $p_top - $p_bottom]

    set p_size "$p_w $p_h"

    specifyBlackBox -cell processor -size $p_size
    setObjFPlanBox Instance processor_1 $p_left $p_bottom $p_right $p_top
    editPin -cell processor -pinWidth 0.1 -pinDepth 0.42 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 1 -spreadType start -spacing 1 -start 322.4 0.0 -pin {{p_spm_master[0]} {p_spm_master[1]} {p_spm_master[2]} {p_spm_master[3]} {p_spm_master[4]} {p_spm_master[5]} {p_spm_master[6]} {p_spm_master[7]} {p_spm_master[8]} {p_spm_master[9]} {p_spm_master[10]} {p_spm_master[11]} {p_spm_master[12]} {p_spm_master[13]} {p_spm_master[14]} {p_spm_master[15]} {p_spm_master[16]} {p_spm_master[17]} {p_spm_master[18]} {p_spm_master[19]} {p_spm_master[20]} {p_spm_master[21]} {p_spm_master[22]} {p_spm_master[23]} {p_spm_master[24]} {p_spm_master[25]} {p_spm_master[26]} {p_spm_master[27]} {p_spm_master[28]} {p_spm_master[29]} {p_spm_master[30]} {p_spm_master[31]} {p_spm_master[32]} {p_spm_master[33]} {p_spm_master[34]} {p_spm_master[35]} {p_spm_master[36]} {p_spm_master[37]} {p_spm_master[38]} {p_spm_master[39]} {p_spm_master[40]} {p_spm_master[41]} {p_spm_master[42]} {p_spm_master[43]} {p_spm_master[44]} {p_spm_master[45]} {p_spm_master[46]} {p_spm_master[47]} {p_spm_master[48]} {p_spm_master[49]} {p_spm_master[50]} {p_spm_master[51]} {p_spm_master[52]} {p_spm_master[53]} {p_spm_master[54]} {p_spm_master[55]} {p_spm_master[56]} {p_spm_master[57]} {p_spm_master[58]} {p_spm_master[59]} {p_spm_master[60]} {p_spm_master[61]} {p_spm_master[62]} {p_spm_master[63]} {p_spm_master[64]} {p_spm_master[65]} {p_spm_master[66]} {p_spm_master[67]} {p_spm_master[68]} {p_spm_master[69]} {p_spm_master[70]} {p_spm_master[71]} {p_spm_master[72]} {p_spm_slave[0]} {p_spm_slave[1]} {p_spm_slave[2]} {p_spm_slave[3]} {p_spm_slave[4]} {p_spm_slave[5]} {p_spm_slave[6]} {p_spm_slave[7]} {p_spm_slave[8]} {p_spm_slave[9]} {p_spm_slave[10]} {p_spm_slave[11]} {p_spm_slave[12]} {p_spm_slave[13]} {p_spm_slave[14]} {p_spm_slave[15]} {p_spm_slave[16]} {p_spm_slave[17]} {p_spm_slave[18]} {p_spm_slave[19]} {p_spm_slave[20]} {p_spm_slave[21]} {p_spm_slave[22]} {p_spm_slave[23]} {p_spm_slave[24]} {p_spm_slave[25]} {p_spm_slave[26]} {p_spm_slave[27]} {p_spm_slave[28]} {p_spm_slave[29]} {p_spm_slave[30]} {p_spm_slave[31]} {p_spm_slave[32]} {p_spm_slave[33]} {p_spm_slave[34]} {p_spm_slave[35]} {p_spm_slave[36]} {p_spm_slave[37]} {p_spm_slave[38]} {p_spm_slave[39]} {p_spm_slave[40]} {p_spm_slave[41]} {p_spm_slave[42]} {p_spm_slave[43]} {p_spm_slave[44]} {p_spm_slave[45]} {p_spm_slave[46]} {p_spm_slave[47]} {p_spm_slave[48]} {p_spm_slave[49]} {p_spm_slave[50]} {p_spm_slave[51]} {p_spm_slave[52]} {p_spm_slave[53]} {p_spm_slave[54]} {p_spm_slave[55]} {p_spm_slave[56]} {p_spm_slave[57]} {p_spm_slave[58]} {p_spm_slave[59]} {p_spm_slave[60]} {p_spm_slave[61]} {p_spm_slave[62]} {p_spm_slave[63]}}

    editPin -cell processor -pinWidth 0.1 -pinDepth 0.42 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 1 -spreadType start -spacing 1 -start 0.2 0.0 -pin {clk {p_ocp_master[0]} {p_ocp_master[1]} {p_ocp_master[2]} {p_ocp_master[3]} {p_ocp_master[4]} {p_ocp_master[5]} {p_ocp_master[6]} {p_ocp_master[7]} {p_ocp_master[8]} {p_ocp_master[9]} {p_ocp_master[10]} {p_ocp_master[11]} {p_ocp_master[12]} {p_ocp_master[13]} {p_ocp_master[14]} {p_ocp_master[15]} {p_ocp_master[16]} {p_ocp_master[17]} {p_ocp_master[18]} {p_ocp_master[19]} {p_ocp_master[20]} {p_ocp_master[21]} {p_ocp_master[22]} {p_ocp_master[23]} {p_ocp_master[24]} {p_ocp_master[25]} {p_ocp_master[26]} {p_ocp_master[27]} {p_ocp_master[28]} {p_ocp_master[29]} {p_ocp_master[30]} {p_ocp_master[31]} {p_ocp_master[32]} {p_ocp_master[33]} {p_ocp_master[34]} {p_ocp_master[35]} {p_ocp_master[36]} {p_ocp_master[37]} {p_ocp_master[38]} {p_ocp_master[39]} {p_ocp_master[40]} {p_ocp_master[41]} {p_ocp_master[42]} {p_ocp_master[43]} {p_ocp_master[44]} {p_ocp_master[45]} {p_ocp_master[46]} {p_ocp_master[47]} {p_ocp_master[48]} {p_ocp_master[49]} {p_ocp_master[50]} {p_ocp_master[51]} {p_ocp_master[52]} {p_ocp_master[53]} {p_ocp_master[54]} {p_ocp_master[55]} {p_ocp_master[56]} {p_ocp_master[57]} {p_ocp_master[58]} {p_ocp_master[59]} {p_ocp_master[60]} {p_ocp_master[61]} {p_ocp_master[62]} {p_ocp_master[63]} {p_ocp_master[64]} {p_ocp_master[65]} {p_ocp_master[66]} {p_ocp_master[67]} {p_ocp_master[68]} {p_ocp_master[69]} {p_ocp_master[70]} {p_ocp_master[71]} {p_ocp_slave[0]} {p_ocp_slave[1]} {p_ocp_slave[2]} {p_ocp_slave[3]} {p_ocp_slave[4]} {p_ocp_slave[5]} {p_ocp_slave[6]} {p_ocp_slave[7]} {p_ocp_slave[8]} {p_ocp_slave[9]} {p_ocp_slave[10]} {p_ocp_slave[11]} {p_ocp_slave[12]} {p_ocp_slave[13]} {p_ocp_slave[14]} {p_ocp_slave[15]} {p_ocp_slave[16]} {p_ocp_slave[17]} {p_ocp_slave[18]} {p_ocp_slave[19]} {p_ocp_slave[20]} {p_ocp_slave[21]} {p_ocp_slave[22]} {p_ocp_slave[23]} {p_ocp_slave[24]} {p_ocp_slave[25]} {p_ocp_slave[26]} {p_ocp_slave[27]} {p_ocp_slave[28]} {p_ocp_slave[29]} {p_ocp_slave[30]} {p_ocp_slave[31]} {p_ocp_slave[32]} {p_ocp_slave[33]} {p_ocp_slave[34]} {p_settings[0]} {p_settings[1]} {p_settings[2]} {p_settings[3]} {p_settings[4]} {p_settings[5]} {p_settings[6]} {p_settings[7]} reset}
    set s_left [expr $fp_left + $router_width + $fp_distance]
    set s_right [expr $fp_width - $fp_right]
    set s_top [expr $router_height + $fp_distance + $fp_bottom]
    set s_bottom $fp_bottom

    set s_w [expr $s_right - $s_left]
    set s_h [expr $s_top - $s_bottom]

    set s_size "$s_w $s_h"

    specifyBlackBox -cell spm -size $s_size
    setObjFPlanBox Instance spm_1 $s_left $s_bottom $s_right $s_top

    editPin -cell spm -pinWidth 0.1 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 2 -spreadType start -spacing 1 -start 20.8 208.0 -pin {{a_spm_master[0]} {a_spm_master[1]} {a_spm_master[2]} {a_spm_master[3]} {a_spm_master[4]} {a_spm_master[5]} {a_spm_master[6]} {a_spm_master[7]} {a_spm_master[8]} {a_spm_master[9]} {a_spm_master[10]} {a_spm_master[11]} {a_spm_master[12]} {a_spm_master[13]} {a_spm_master[14]} {a_spm_master[15]} {a_spm_master[16]} {a_spm_master[17]} {a_spm_master[18]} {a_spm_master[19]} {a_spm_master[20]} {a_spm_master[21]} {a_spm_master[22]} {a_spm_master[23]} {a_spm_master[24]} {a_spm_master[25]} {a_spm_master[26]} {a_spm_master[27]} {a_spm_master[28]} {a_spm_master[29]} {a_spm_master[30]} {a_spm_master[31]} {a_spm_master[32]} {a_spm_master[33]} {a_spm_master[34]} {a_spm_master[35]} {a_spm_master[36]} {a_spm_master[37]} {a_spm_master[38]} {a_spm_master[39]} {a_spm_master[40]} {a_spm_master[41]} {a_spm_master[42]} {a_spm_master[43]} {a_spm_master[44]} {a_spm_master[45]} {a_spm_master[46]} {a_spm_master[47]} {a_spm_master[48]} {a_spm_master[49]} {a_spm_master[50]} {a_spm_master[51]} {a_spm_master[52]} {a_spm_master[53]} {a_spm_master[54]} {a_spm_master[55]} {a_spm_master[56]} {a_spm_master[57]} {a_spm_master[58]} {a_spm_master[59]} {a_spm_master[60]} {a_spm_master[61]} {a_spm_master[62]} {a_spm_master[63]} {a_spm_master[64]} {a_spm_master[65]} {a_spm_master[66]} {a_spm_master[67]} {a_spm_master[68]} {a_spm_master[69]} {a_spm_master[70]} {a_spm_master[71]} {a_spm_master[72]} {a_spm_slave[0]} {a_spm_slave[1]} {a_spm_slave[2]} {a_spm_slave[3]} {a_spm_slave[4]} {a_spm_slave[5]} {a_spm_slave[6]} {a_spm_slave[7]} {a_spm_slave[8]} {a_spm_slave[9]} {a_spm_slave[10]} {a_spm_slave[11]} {a_spm_slave[12]} {a_spm_slave[13]} {a_spm_slave[14]} {a_spm_slave[15]} {a_spm_slave[16]} {a_spm_slave[17]} {a_spm_slave[18]} {a_spm_slave[19]} {a_spm_slave[20]} {a_spm_slave[21]} {a_spm_slave[22]} {a_spm_slave[23]} {a_spm_slave[24]} {a_spm_slave[25]} {a_spm_slave[26]} {a_spm_slave[27]} {a_spm_slave[28]} {a_spm_slave[29]} {a_spm_slave[30]} {a_spm_slave[31]} {a_spm_slave[32]} {a_spm_slave[33]} {a_spm_slave[34]} {a_spm_slave[35]} {a_spm_slave[36]} {a_spm_slave[37]} {a_spm_slave[38]} {a_spm_slave[39]} {a_spm_slave[40]} {a_spm_slave[41]} {a_spm_slave[42]} {a_spm_slave[43]} {a_spm_slave[44]} {a_spm_slave[45]} {a_spm_slave[46]} {a_spm_slave[47]} {a_spm_slave[48]} {a_spm_slave[49]} {a_spm_slave[50]} {a_spm_slave[51]} {a_spm_slave[52]} {a_spm_slave[53]} {a_spm_slave[54]} {a_spm_slave[55]} {a_spm_slave[56]} {a_spm_slave[57]} {a_spm_slave[58]} {a_spm_slave[59]} {a_spm_slave[60]} {a_spm_slave[61]} {a_spm_slave[62]} {a_spm_slave[63]}}

    editPin -cell spm -pinWidth 0.1 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 2 -spreadType start -spacing 1 -start 0.0 0.4 -pin {a_clk b_clk {b_spm_master[0]} {b_spm_master[1]} {b_spm_master[2]} {b_spm_master[3]} {b_spm_master[4]} {b_spm_master[5]} {b_spm_master[6]} {b_spm_master[7]} {b_spm_master[8]} {b_spm_master[9]} {b_spm_master[10]} {b_spm_master[11]} {b_spm_master[12]} {b_spm_master[13]} {b_spm_master[14]} {b_spm_master[15]} {b_spm_master[16]} {b_spm_master[17]} {b_spm_master[18]} {b_spm_master[19]} {b_spm_master[20]} {b_spm_master[21]} {b_spm_master[22]} {b_spm_master[23]} {b_spm_master[24]} {b_spm_master[25]} {b_spm_master[26]} {b_spm_master[27]} {b_spm_master[28]} {b_spm_master[29]} {b_spm_master[30]} {b_spm_master[31]} {b_spm_master[32]} {b_spm_master[33]} {b_spm_master[34]} {b_spm_master[35]} {b_spm_master[36]} {b_spm_master[37]} {b_spm_master[38]} {b_spm_master[39]} {b_spm_master[40]} {b_spm_master[41]} {b_spm_master[42]} {b_spm_master[43]} {b_spm_master[44]} {b_spm_master[45]} {b_spm_master[46]} {b_spm_master[47]} {b_spm_master[48]} {b_spm_master[49]} {b_spm_master[50]} {b_spm_master[51]} {b_spm_master[52]} {b_spm_master[53]} {b_spm_master[54]} {b_spm_master[55]} {b_spm_master[56]} {b_spm_master[57]} {b_spm_master[58]} {b_spm_master[59]} {b_spm_master[60]} {b_spm_master[61]} {b_spm_master[62]} {b_spm_master[63]} {b_spm_master[64]} {b_spm_master[65]} {b_spm_master[66]} {b_spm_master[67]} {b_spm_master[68]} {b_spm_master[69]} {b_spm_master[70]} {b_spm_master[71]} {b_spm_master[72]} {b_spm_slave[0]} {b_spm_slave[1]} {b_spm_slave[2]} {b_spm_slave[3]} {b_spm_slave[4]} {b_spm_slave[5]} {b_spm_slave[6]} {b_spm_slave[7]} {b_spm_slave[8]} {b_spm_slave[9]} {b_spm_slave[10]} {b_spm_slave[11]} {b_spm_slave[12]} {b_spm_slave[13]} {b_spm_slave[14]} {b_spm_slave[15]} {b_spm_slave[16]} {b_spm_slave[17]} {b_spm_slave[18]} {b_spm_slave[19]} {b_spm_slave[20]} {b_spm_slave[21]} {b_spm_slave[22]} {b_spm_slave[23]} {b_spm_slave[24]} {b_spm_slave[25]} {b_spm_slave[26]} {b_spm_slave[27]} {b_spm_slave[28]} {b_spm_slave[29]} {b_spm_slave[30]} {b_spm_slave[31]} {b_spm_slave[32]} {b_spm_slave[33]} {b_spm_slave[34]} {b_spm_slave[35]} {b_spm_slave[36]} {b_spm_slave[37]} {b_spm_slave[38]} {b_spm_slave[39]} {b_spm_slave[40]} {b_spm_slave[41]} {b_spm_slave[42]} {b_spm_slave[43]} {b_spm_slave[44]} {b_spm_slave[45]} {b_spm_slave[46]} {b_spm_slave[47]} {b_spm_slave[48]} {b_spm_slave[49]} {b_spm_slave[50]} {b_spm_slave[51]} {b_spm_slave[52]} {b_spm_slave[53]} {b_spm_slave[54]} {b_spm_slave[55]} {b_spm_slave[56]} {b_spm_slave[57]} {b_spm_slave[58]} {b_spm_slave[59]} {b_spm_slave[60]} {b_spm_slave[61]} {b_spm_slave[62]} {b_spm_slave[63]} reset}
    # previously: routing blockages
    #createRouteBlk -box [expr $fp_left + $router_width + $fp_distance] $fp_bottom [expr $fp_width - $fp_right] [expr $router_height + $fp_distance + $fp_bottom] -layer {M1 M2 M3 M4 M5 M6 M7}
    #createRouteBlk -box $fp_left [expr $router_height + $fp_distance + $fp_bottom] [expr $fp_width - $fp_right] [expr $fp_height - $fp_top] -layer {M1 M2 M3 M4 M5 M6 M7}
    partition