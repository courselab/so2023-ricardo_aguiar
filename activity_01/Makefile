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

bootloader.bin : %.bin : %.o
	ld -melf_i386 --oformat=binary -e begin -Ttext=0x7c00  $< -o $@

bootloader.o : %.o : %.S
	as --32 $< -o $@

# Run on the emulator
%/run : %
	qemu-system-i386 -drive format=raw,file=$< -net none

.PHONY: clean

clean:
	rm -f *.bin *.o
