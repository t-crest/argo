loadCPF scripts/power_domains.cpf
commitCPF

setObjFPlanBox Group PD_noc_switch \
    $fp_left $fp_bottom [expr $fp_left + $router_width] [expr $fp_bottom + $router_height]

#modifyPowerDomainAttr PD_nAdapter -minGaps $fp_distance $fp_distance $fp_distance $fp_distance
modifyPowerDomainAttr PD_noc_switch -minGaps $fp_distance $fp_distance $fp_distance $fp_distance

cutRow -area [expr $fp_left + $router_width + $fp_distance] $fp_bottom $fp_width [expr $router_height + $fp_distance + $fp_bottom]
cutRow -area $fp_left [expr $router_height + $fp_distance + $fp_bottom] $fp_width $fp_height  


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
    createRouteBlk -box [expr $fp_left + $router_width + $fp_distance] $fp_bottom [expr $fp_width - $fp_right] [expr $router_height + $fp_distance + $fp_bottom] -layer {M1 M2 M3 M4 M5 M6 M7}
    createRouteBlk -box $fp_left [expr $router_height + $fp_distance + $fp_bottom] [expr $fp_width - $fp_right] [expr $fp_height - $fp_top] -layer {M1 M2 M3 M4 M5 M6 M7}

}
