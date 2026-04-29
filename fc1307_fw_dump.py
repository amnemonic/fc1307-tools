#!/usr/bin/env python3
"""
Script Name: fc1307_fw_dump.py

Description:
    Dumps firmware from FC1307(A) based devices. You can use USB->IDE adapter but it must be able to pass "features" flag.
    You can check this by issuing  `sg_raw -r 512 /dev/sda a1 08 0e 04 00 00 00 00 00 FE 00 00` command.
    If you get buffer starting with "FC-1307 2012_12_20-BANK..." then your device can't handle ATA "features" flag.

Author:
    Adam Mnemonic

GitHub:
    https://github.com/amnemonic/fc1307-tools

License:
    This project is licensed under a permissive "do whatever you want" license.
    You are free to use, modify, distribute, and sell this software without restriction.

    Attribution is appreciated but not required.
    Source: https://github.com/amnemonic

Created:
    2026-04-11

Last Modified:
    2026-04-29
"""

import os
import sys
import fcntl
import ctypes


SG_IO = 0x2285              # SG_IO ioctl number
SG_DXFER_FROM_DEV = -3      # Data transfer direction


class sg_io_hdr_t(ctypes.Structure):
    _fields_ = [
        ("interface_id", ctypes.c_int),
        ("dxfer_direction", ctypes.c_int),
        ("cmd_len", ctypes.c_ubyte),
        ("mx_sb_len", ctypes.c_ubyte),
        ("iovec_count", ctypes.c_ushort),
        ("dxfer_len", ctypes.c_uint),
        ("dxferp", ctypes.c_void_p),
        ("cmdp", ctypes.c_void_p),
        ("sbp", ctypes.c_void_p),
        ("timeout", ctypes.c_uint),
        ("flags", ctypes.c_uint),
        ("pack_id", ctypes.c_int),
        ("usr_ptr", ctypes.c_void_p),
        ("status", ctypes.c_ubyte),
        ("masked_status", ctypes.c_ubyte),
        ("msg_status", ctypes.c_ubyte),
        ("sb_len_wr", ctypes.c_ubyte),
        ("host_status", ctypes.c_ushort),
        ("driver_status", ctypes.c_ushort),
        ("resid", ctypes.c_int),
        ("duration", ctypes.c_uint),
        ("info", ctypes.c_uint),
    ]

def read_fw(fd,addr):
    addr_lo = addr & 0xFF
    addr_hi = (addr >> 8) & 0xFF
    
    cdb = (ctypes.c_ubyte * 12)(0xA1, 0x08, 0x0E, 0x04, 0x00, addr_lo, addr_hi, 0x00, 0x00, 0xFE, 0x00, 0x00 )

    
    data_buf = ctypes.create_string_buffer(512)
    sense_buf = ctypes.create_string_buffer(32)

    io_hdr = sg_io_hdr_t()
    io_hdr.interface_id    = ord('S')
    io_hdr.dxfer_direction = SG_DXFER_FROM_DEV
    io_hdr.cmd_len         = 12
    io_hdr.mx_sb_len       = len(sense_buf)
    io_hdr.dxfer_len       = 512
    io_hdr.dxferp          = ctypes.cast(data_buf, ctypes.c_void_p)
    io_hdr.cmdp            = ctypes.cast(cdb, ctypes.c_void_p)
    io_hdr.sbp             = ctypes.cast(sense_buf, ctypes.c_void_p)
    io_hdr.timeout         = 5000  # milliseconds

    try:
        # Send command
        fcntl.ioctl(fd, SG_IO, io_hdr)

        # Check status
        if io_hdr.status != 0:
            print("SCSI Status:", io_hdr.status)
            print("Sense Data:", bytes(sense_buf[:io_hdr.sb_len_wr]).hex())
        else:
            print('.',end='',flush=True)

        # Print returned data
        data = bytes(data_buf)
        #print("Returned data (first 64 bytes):")
        #print(data[:64].hex())

        return data
    except:
        print('ERROR')


if __name__ == "__main__":
    if len(sys.argv)!=3: print(f'Error!\nUsage: {os.path.basename(sys.argv[0])} </dev/sdaX> <out_rom_file.bin>', file=sys.stderr) ; exit(1)
    
    binfile = open(sys.argv[2],'wb')
    fd = os.open(sys.argv[1], os.O_RDWR)
    for i in range(0,0x10000,0x200):
        data = read_fw(fd,i)
        binfile.write(data)
    print()
    os.close(fd)
    binfile.close()
