# generates random data for simulation
import random
N = 4
M = 4
packets = 4
addr_width = 16
data_width = 64
 
for ni in range(0,N*M):
    print('# NI{:d}'.format(ni))
    for addr in map(lambda x: ni*packets + x, range(0,packets)):
        print(('@{:0'+str(int(addr_width/4))+'X} {:0'+str(int(data_width/4))+'X}').format(addr,random.getrandbits(data_width)))
    print('')
