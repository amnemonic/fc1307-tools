@SETLOCAL
@set PATH=%PATH%;.\bin\
@echo off

sdas8051 -o ident_checksum.rel ident_checksum.asm
sdld -i ident_checksum.rel
tools\hex2bin.py ident_checksum.ihx ident_checksum.bin
patch_fw.py V3.72.bin V3.72_patched.bin

@del *.rel
@del *.ihx
