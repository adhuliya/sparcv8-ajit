compileToSparc.py -o 3 -s init.s -c init_vec.c -c dotproduct.c -E dotproduct.elf -V dotproduct.vars -H dotproduct.hex -M dotproduct.mmap -O dotproduct.objdump -D AJIT -L LinkerScript.lnk
sparc-linux-readelf  --hex-dump=1 --hex-dump=2 --hex-dump=3 dotproduct.elf | grep 0x > dotproduct.hex 
generateMemoryMap_Byte dotproduct.hex > dotproduct.mmap
