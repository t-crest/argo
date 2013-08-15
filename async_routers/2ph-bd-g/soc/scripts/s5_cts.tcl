addCTSCellList {HS65_LS_BFX2 HS65_LS_BFX4 HS65_LS_BFX7 HS65_LS_BFX9 HS65_LS_IVX2 HS65_LS_IVX4 HS65_LS_IVX7 HS65_LS_IVX9}
clockDesign -genSpecOnly Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
