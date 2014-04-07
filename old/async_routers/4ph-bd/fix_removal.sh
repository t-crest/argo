#!/bin/sh

sed 's/(HOLD (posedge RN)/(REMOVAL (posedge RN)/' netlists/switch_netlist_mod.sdf > temp
sed 's/(HOLD (posedge SN)/(REMOVAL (posedge SN)/' temp > netlists/switch_netlist_mod2.sdf
rm temp
