## ATA COMMAND FEh

| FEATURES |  LBA_LOW |  LBA_MID |  LBA_HI  | DESCRIPTION                                               |
|  :---:   |  :---:   |  :---:   |  :---:   | :---                                                      |
|   00h    |    -     |    -     |    -     | Read FW Version and SDCard CID/CSD                        |
|   01h    |   [x]    |    -     |    -     | ?                                                         |
|   02h    |    -     |    -     |    -     | SPI: Read Manufacturer and ID (RDMDID, 90h)               |
|   03h    |    -     |    -     |    -     | SPI: Read Product Identification BY JEDEC ID (RDJDID, 9Fh)|
|   04h    |   [x]    |   [x]    |   [x]    | SPI: Read 512 Bytes of Flash at offset in LBA (RD, 03h)   |
|   05h    |   [x]    |   [x]    |   [x]    | SPI: Read 512 Bytes of Flash at offset in LBA (FR, 0Bh)   |
|   06h    |    -     |   [x]    |   [x]    | Read single byte at XMEM[LBA_HI:LBA_MID]                  |
|   07h    |    -     |    -     |    -     | ?                                                         |
|   08h    |    -     |    -     |    -     | ?                                                         |
|   09h    |   [x]    |    -     |    -     | ?                                                         |
|   0Ah    |   [x]    |    -     |    -     | ?                                                         |
|   0Bh    |   [x]    |   [x]    |   [x]    | SPI: Write 512 Bytes to Flash at offset in LBA (PP, 02h)  |
|   0Ch    |    -     |   [x]    |    -     | ?                                                         |
|   0Dh    |   [x]    |   [x]    |   [x]    | ?                                                         |
|   10h    |   [x]    |   [x]    |   [x]    | Write single byte to XMEM[LBA_HI:LBA_MID] = LBA_LOW       |
|   11h    |    -     |    -     |    -     | ? (RAM_28.2 = 1)                                          |
|   12h    |    -     |    -     |    -     | ? (RAM_28.2 = 0)                                          |
|   13h    |    -     |    -     |    -     | ?                                                         |
|   14h    |   [x]    |   [x]    |   [x]    | _SPI: Sequential Write to Flash at offset in LBA (ADh)_   |
|   15h    |   [x]    |   [x]    |   [x]    | _SPI: Sequential Write to Flash at offset in LBA (AFh)_   |
|   16h    |    -     |    -     |    -     | SPI: Read Status Register  (RDSR, 05h)                    |
|   17h    |   [x]    |    -     |    -     | SPI: Write Status Register (WRSR, 01h) SR=LBA_LOW         |
|   18h    |    -     |    -     |    -     | _SPI: Volatile Write Enable (01h)_                        |
|   19h    |    -     |    -     |    -     | ? (XMEM[0x2000] |= 0x01)                                  |
|   1Ah    |   [x]    |   [x]    |   [x]    | SPI: Sector Erase (SER, 20h)                              |
|   1Bh    |   [x]    |   [x]    |   [x]    | SPI: Block Erase (BER64K, D8h)                            |
|   1Ch    |    -     |    -     |    -     | SPI: Chip Erase (CER, C7h)                                |
|   1Dh    |   [x]    |   [x]    |   [x]    | ?                                                         |
|   1Eh    |   [x]    |   [x]    |   [x]    | ?                                                         |
|   30h    |    -     |    -     |    -     | ? _(Only in FW v3.72)_                                    |
|   31h    |    -     |    -     |    -     | ? _(Only in FW v3.72)_                                    |
|   32h    |    -     |    -     |    -     | ? _(Only in FW v3.72)_                                    |
