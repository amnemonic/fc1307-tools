"""
Script Name: fc1307_fw_write.py

Description:
    Flashes firwmare on FC1307(A) based devices. You can use USB->IDE adapter but it must be able to pass "features" flag.
    You can check this by issuing  `sg_raw -r 512 /dev/sdX a1 08 0e 04 00 00 00 00 00 FE 00 00` command.
    If you get buffer starting with "FC-1307 2012_12_20-BANK..." then your device can't handle ATA "features" flag.

    This program uses vedor specific ATA command 0xFE with Features parameter = 0x0B
    Command writes 512 bytes buffer to SPI Flash addres defined in LBA address of ATA command
    
    IMPORTANT: Before flashing you must perform ERASE CHIP: ATA Command: 0xFE / FEATURES = 0x1C
               You can do this with linux command: sg_raw -r 512 /dev/sdX a1 08 0e 1C 00 00 00 00 00 FE 00 00
    
    IMPORTANT2: If writing proces fails then FC1307 will use default BOOT ROOM which will allow you tou try again
    
    IMPORTANT3: If you try to flash firmware which is not dedicated to your board and is not patched then it most likely
                stuck in infinite loop at address 0x03CE and PC will not detect it. Right now I don't have easier method 
                other than using external SPI flasher erease chip so device will boot again in safe mode.
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
    2026-04-18

Last Modified:
    2026-04-18
"""

import os
import sys
import fcntl
import ctypes


SG_IO = 0x2285
SG_DXFER_TO_DEV = -2

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


def send_ata_data_out(fd, addr, data):
    # --- ATA PASS THROUGH (12) CDB ---
    lba_low = (addr >>  0) & 0xFF
    lba_mid = (addr >>  8) & 0xFF
    lba_hi  = (addr >> 16) & 0xFF
    
    cdb = (ctypes.c_ubyte * 12)(
        0xA1,       # ATA PASS THROUGH (12)
        0x0A,       # PROTOCOL = PIO Data-Out
        0x06,       # T_DIR=0, BYT_BLOK=1, T_LENGTH=2
        0x0B,       # FEATURES = 0x0B
        0x01,       # SECTOR COUNT = 1 (512 bytes)
        lba_low,    # LBA LOW
        lba_mid,    # LBA MID
        lba_hi,     # LBA HIGH
        0x00,       # DEVICE
        0xFE,       # COMMAND = 0xFE
        0x00,       # RESERVED
        0x00        # CONTROL
    )

    # --- Data buffer (512 bytes to send) ---
    BUFF_SIZE = 512
    if len(data)!=BUFF_SIZE:
        return False

    data_buf = ctypes.create_string_buffer(data)

    # --- Sense buffer ---
    sense_buf = ctypes.create_string_buffer(32)

    # --- SG_IO header ---
    io_hdr                 = sg_io_hdr_t()
    io_hdr.interface_id    = 0x53
    io_hdr.dxfer_direction = SG_DXFER_TO_DEV
    io_hdr.cmd_len         = 12
    io_hdr.mx_sb_len       = len(sense_buf)
    io_hdr.dxfer_len       = BUFF_SIZE
    io_hdr.dxferp          = ctypes.cast(data_buf, ctypes.c_void_p)
    io_hdr.cmdp            = ctypes.cast(cdb, ctypes.c_void_p)
    io_hdr.sbp             = ctypes.cast(sense_buf, ctypes.c_void_p)
    io_hdr.timeout         = 5000

    


    fcntl.ioctl(fd, SG_IO, io_hdr)

    print(f"SCSI status: {io_hdr.status} / Host status: {io_hdr.host_status} / Driver status: {io_hdr.driver_status}")

    if io_hdr.sb_len_wr > 0:
        print("Sense data:", bytes(sense_buf[:io_hdr.sb_len_wr]).hex())




if __name__ == "__main__":
    if len(sys.argv)!=3: print(f'Error!\nUsage: {os.path.basename(sys.argv[0])} </dev/sdaX> <rom_file.bin>', file=sys.stderr) ; exit(1)
    device = sys.argv[1] # "/dev/sda" or "/dev/sg0"
    rom = open(sys.argv[2],'rb').read()

    if len(rom)!=0x10000:
        exit('Rom size different than 0x10000 (64kB)')
    
    try:
        fd = os.open(device, os.O_RDWR)
        
        for a in range(0,0x10000,512):
            data = rom[a:a+512]
            send_ata_data_out(fd, a, data)
    finally:
        os.close(fd)