# Makefile - Main build script
#
#  Copyright (c) 2023, Ricardo Aguiar  ricardoaguiar@usp.com
#  This file is part of SO project
#  SO is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

AUXDIR =tools#

all: hw-hex.bin hw-s.bin hw-c.bin

hw-hex.bin: hw.hex
	$(AUXDIR)/hex2bin $< $@ 

hw-s.bin: hw.S
	as --32 $< -o hw-s.o
	ld -melf_i386 --oformat=binary -e begin -Ttext=0x7c00  hw-s.o -o $@

hw-c.bin: hw.c stdio.h 
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S $< -o hw-c.s
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none --freestanding -S hw-c_utils.c -o hw-c_utils.s
	gcc -m16 -O0 -I. -Wall -fno-pic  -fcf-protection=none -S hw-c_rt0.c -o hw-c_rt0.s
	as --32 hw-c.s -o hw-c.o
	as --32 hw-c_utils.s -o hw-c_utils.o
	as --32 hw-c_rt0.s -o hw-c_rt0.o
	ld -melf_i386 -T hw-c.ld --orphan-handling=discard  hw-c.o hw-c_utils.o hw-c_rt0.o -o $@
	rm hw-c*.s
	
# Run on the emulator
%/run : %
	qemu-system-i386 -drive format=raw,file=$< -net none

.PHONY: clean

clean:
	rm -rf *.bin *.o hex2bin hw-c*.s