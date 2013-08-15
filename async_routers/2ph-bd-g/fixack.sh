#!/bin/sh

sed 's/_ACK_/_ACK/g' netlists/switch_netlist.v > netlists/switch_netlist_mod.v
sed 's/_ACK_/_ACK/g' netlists/switch_netlist.sdf > netlists/switch_netlist_mod.sdf
