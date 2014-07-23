
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
setNanoRouteMode -quiet -drouteFixAntenna true
routeDesign -globalDetail

setNanoRouteMode -quiet -drouteUseMultiCutViaEffort high
setNanoRouteMode -quiet -droutePostRouteSwapVia multiCut
detailRoute

setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
optDesign -postRoute -hold
