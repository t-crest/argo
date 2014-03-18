# add well taps to prevent latchups
#addWellTap -cell HS65_LS_FILLERNPWPFP3 -cellInterval 25 -inRowOffset 10.0 -startRowNum 1 -skipRow 0 -prefix WELLTAP -powerDomain PD_DEFAULT
set domains {noc_switch}

# Place the power domains
foreach domain $domains {
	set PD PD_$domain
	addWellTap -cell $ARGO_PNR_WELLTAP_CELL -cellInterval 25 -inRowOffset 15.0 -startRowNum 1 -skipRow 0 -prefix WELLTAP -powerDomain $PD
}  
    
setPlaceMode -congEffort high

# setOptMode -fixCap true -fixTran true -fixFanoutLoad false -setupTargetSlack 0.3
# optDesign -postCTS
# setOptMode -fixCap true -fixTran true -fixFanoutLoad true -setupTargetSlack 0.3
# optDesign -postCTS
# setOptMode -fixCap true -fixTran true -fixFanoutLoad true -setupTargetSlack 0.3 -holdTargetSlack 0.4
# optDesign -postCTS -hold

placeDesign


checkPlace
