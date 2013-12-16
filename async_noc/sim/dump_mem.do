mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m1n1_h.txt /test2_noc2x2/spm_m(1)/spm_n(1)/spm_h/mem
mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m1n1_l.txt /test2_noc2x2/spm_m(1)/spm_n(1)/spm_l/mem

mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m1n0_h.txt /test2_noc2x2/spm_m(1)/spm_n(0)/spm_h/mem
mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m1n0_l.txt /test2_noc2x2/spm_m(1)/spm_n(0)/spm_l/mem

mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m0n1_h.txt /test2_noc2x2/spm_m(0)/spm_n(1)/spm_h/mem
mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m0n1_l.txt /test2_noc2x2/spm_m(0)/spm_n(1)/spm_l/mem

mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m0n0_h.txt /test2_noc2x2/spm_m(0)/spm_n(0)/spm_h/mem
mem save -startaddress 0 -endaddress 15 -format hex -wordsperline 1 -outfile m0n0_l.txt /test2_noc2x2/spm_m(0)/spm_n(0)/spm_l/mem

exec paste m0n0_h.txt m0n0_l.txt m0n1_h.txt m0n1_l.txt m1n0_h.txt m1n0_l.txt m1n1_h.txt m1n1_l.txt | grep @ > mem_dump.combined 
