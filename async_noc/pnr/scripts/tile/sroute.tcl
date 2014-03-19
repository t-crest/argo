sroute -connect { corePin } -powerDomains PD_DEFAULT -nets VDD_DEFAULT
sroute -connect { corePin } -nets GND

set domains {noc_switch}
foreach domain $domains {
    sroute -connect { corePin } -powerDomains PD_$domain -nets "VDD_$domain GND"
    sroute -connect { blockPin padPin corePin } -layerChangeRange { 1 8 } -blockPinTarget { nearestRingStripe nearestTarget } -connectAlignedBlockAndPadPin { blockPinAsTarget } -padPinPortConnect { allPort allGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 8 -crossoverViaTopLayer 8 -targetViaBottomLayer 1 -nets "VDD_$domain GND"
}

sroute -connect { blockPin padPin corePin } -layerChangeRange { 1 8 } -blockPinTarget { nearestRingStripe nearestTarget } -connectAlignedBlockAndPadPin { blockPinAsTarget } -padPinPortConnect { allPort allGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 8 -crossoverViaTopLayer 8 -targetViaBottomLayer 1 -nets VDD_DEFAULT

sroute -connect { blockPin padPin corePin } -layerChangeRange { 1 8 } -blockPinTarget { nearestRingStripe nearestTarget } -connectAlignedBlockAndPadPin { blockPinAsTarget } -padPinPortConnect { allPort allGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 8 -crossoverViaTopLayer 8 -targetViaBottomLayer 1 -nets GND

