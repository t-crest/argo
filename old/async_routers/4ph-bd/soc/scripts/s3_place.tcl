findCoreFillerCells
addWellTap -cell HS65_LS_FILLERNPWPFP3 -maxGap 25 -inRowOffset 10.0 -prefix WELLTAP
setPrerouteAsObs {1 2 3 4 5 6 7 8}
setReleaseMultiCpuLicense 0
setMultiCpuUsage -numThreads 4 -numHosts 0 -superThreadsNumThreads 1 -superThreadsNumHosts 0
placeDesign -prePlaceOpt