import sys

bin = bytearray()
for l in open(sys.argv[1]).readlines():
    l=l.strip()
    _len=int(l[1:3],16)
    _addr=int(l[3:7],16)
    if _len>0:
        _data=l[9:9+_len*2]
        bin=bin+bytes.fromhex(_data)
        print(f'@0x{_addr:04X} -> {_data}')

if len(sys.argv)>2:
    open(sys.argv[2],'wb').write(bin)
    print(f'\nSaved to {sys.argv[2]}')
