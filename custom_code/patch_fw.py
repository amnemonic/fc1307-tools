import os, sys
import binascii


def calc_chcksum(bin_content):
    if len(bin_content)!=0x4000:
        return None
    chcecksum=0
    for offset in range(0,len(bin_content)-2,2):
        chcecksum = (chcecksum + int.from_bytes(bin_content[offset:offset+2],byteorder='little') ) & 0xFFFF
    return (0x10000 - chcecksum) & 0xFFFF, int.from_bytes(bin_content[-2:],byteorder='little')

#----------------------------------------------------------------------------------------------------------

bin = bytearray( open(sys.argv[1],'rb').read() )

if binascii.crc32(bin)!= 0xe35c3e58:
    exit('Error: CRC!=e35c3e58. Please provide unmodified V3.72 firmware.')


# Patch infinite loop at BOOT (Checking pins P1.0 - P1.3)
bin[0x3CE:0x3D0] = b'\x80\x00'
bin[0x3DA:0x3DC] = b'\x80\x00'


# Replace call to function at address @0x2015 to our custom at address 0xB000
# inside ATA ECh command handler
# if bin[0x8223:0x8226] == b'\x12\x20\x15': bin[0x8223:0x8226] = b'\x12\xB0\x00'
if bin[0x8226:0x8226+3] == b'\xE4\xF5\xA4':
    bin[0x8226:0x8226+3] = b'\x12\xB0\x00'
else:
    exit('Can\'t patch @0x8226')



# Insert our custom code inside empty area at @0xB000
code=open('ident_checksum.bin','rb').read()
bin[0xB000:0xB000+len(code)] = code


# Fix checksums
chsm_calc, chsm_stored = calc_chcksum(bin[0x0000:0x4000]);  bin[0x3FFE:0x4000] =bytes([chsm_calc&0xFF,(chsm_calc>>8)&0xFF])
chsm_calc, chsm_stored = calc_chcksum(bin[0x4000:0x8000]);  bin[0x7FFE:0x8000] =bytes([chsm_calc&0xFF,(chsm_calc>>8)&0xFF])
chsm_calc, chsm_stored = calc_chcksum(bin[0x8000:0xC000]);  bin[0xBFFE:0xC000] =bytes([chsm_calc&0xFF,(chsm_calc>>8)&0xFF])
chsm_calc, chsm_stored = calc_chcksum(bin[0xC000:0x10000]); bin[0xFFFE:0x10000]=bytes([chsm_calc&0xFF,(chsm_calc>>8)&0xFF])


# save to file
open(sys.argv[2],'wb').write(bin)
print(f'Saved patched file, with corrected checksums to {sys.argv[2]}. New file checksum: {binascii.crc32(bin):08X}')
