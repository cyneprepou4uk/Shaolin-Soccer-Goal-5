echo off

start /wait translate.pl
:: для запуска скрипта требуется Strawberry Perl
:: http://strawberryperl.com

ca65 -l bank_00_copy.asm
ca65 -l bank_01_copy.asm
ca65 -l bank_02_copy.asm
ca65 -l bank_03_copy.asm
ca65 -l bank_04_copy.asm
ca65 -l bank_05_copy.asm
ca65 -l bank_06_copy.asm
ca65 -l bank_07_copy.asm

ld65 -C ld65.cfg bank_00_copy.o bank_01_copy.o bank_02_copy.o bank_03_copy.o bank_04_copy.o bank_05_copy.o bank_06_copy.o bank_07_copy.o

copy /B header.bin + bank_00_copy.bin + bank_01_copy.bin + bank_02_copy.bin + bank_03_copy.bin + bank_04_copy.bin + bank_05_copy.bin + bank_06_copy.bin + bank_07_copy.bin + chr.chr goal5.nes

del *.o + bank_*.bin + *_copy.asm + *_copy.inc

copy /A bank_*_copy.lst debug.txt

del bank_*_copy.lst

timeout 5