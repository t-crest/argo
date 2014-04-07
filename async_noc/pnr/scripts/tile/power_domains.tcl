loadCPF scripts/power_domains.cpf
commitCPF

setObjFPlanBox Group PD_noc_switch $fp_left $fp_bottom [expr $fp_left + $router_width] [expr $fp_bottom + $router_height]

#modifyPowerDomainAttr PD_nAdapter -minGaps $fp_distance $fp_distance $fp_distance $fp_distance
modifyPowerDomainAttr PD_noc_switch -minGaps $fp_distance $fp_distance $fp_distance $fp_distance

#cutRow -area [expr $fp_left + $router_width + 4 * $fp_distance] $fp_bottom $fp_width [expr $router_height + $fp_distance + $fp_bottom]
#cutRow -area $fp_left [expr $router_height + $fp_distance + $fp_bottom] $fp_width $fp_height  


if {$ARGO_PNR_USE_SPM_SRAM == 1} {
    # place memory
    setObjFPlanBox Instance spm_1/ST_DPHD_160x64m4_bTL_1 $fp_left [expr $router_height + $fp_distance + $fp_bottom] [expr $fp_width - $fp_right] [expr $fp_height - $fp_top]

    # get memory size
    set memBox [join [dbGet [dbGet top.insts.name spm_1/ST_DPHD_160x64m4_bTL_1 -p].box]]

    # flip memory for better routing
    flipOrRotateObject -name spm_1/ST_DPHD_160x64m4_bTL_1 -flip MX

    createRouteBlk -box [expr $fp_left + $router_width + $fp_distance] $fp_bottom [expr $fp_width - $fp_right] [expr $router_height - 2 * $fp_distance + $fp_bottom] -layer {M1 M2 M3 M4 M5 M6 M7}

    createRouteBlk -box [lindex $memBox 0] [lindex $memBox 3] [expr $fp_width - $fp_right] [expr $fp_height - $fp_top] -layer {M1 M2 M3 M4 M5 M6 M7}

    createRouteBlk -box [lindex $memBox 2] [lindex $memBox 3] [expr $fp_width - $fp_right] $fp_bottom -layer {M1 M2 M3 M4 M5 M6 M7}
} else {
    # blackbox processor & spm
    set p_left $fp_left
    set p_right [expr $fp_width - $fp_right]
    set p_top [expr $fp_height - $fp_top]
    set p_bottom [expr $router_height + $fp_distance + $fp_bottom]
    
    set p_w [expr $p_right - $p_left]
    set p_h [expr $p_top - $p_bottom]

    set p_size "$p_w $p_h"

    setObjFPlanBox Instance processor_1 $p_left $p_bottom $p_right $p_top

    set s_left [expr $fp_left + $router_width + $fp_distance]
    set s_right [expr $fp_width - $fp_right]
    set s_top [expr $router_height + $fp_distance + $fp_bottom]
    set s_bottom $fp_bottom

    set s_w [expr $s_right - $s_left]
    set s_h [expr $s_top - $s_bottom]

    set s_size "$s_w $s_h"

    setObjFPlanBox Instance spm_1 $s_left $s_bottom $s_right $s_top
}
