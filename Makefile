CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0
LDFLAGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nosys.specs -T project_linker.ld -Wl,-Map=final.map
LDFLAGS_SH= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=rdimon.specs -T project_linker.ld -Wl,-Map=final.map

all: blinky.o startup.o final.elf

blinky.o:blinky.c 
	$(CC) $(CFLAGS) $^ -o $@

startup.o:startup.c 
	$(CC) $(CFLAGS) $^ -o $@

final.elf:startup.o blinky.o
	$(CC) $(LDFLAGS) $^ -o $@

final_sh.elf: startup.o blinky.o
	$(CC) $(LDFLAGS_SH) $^ -o $@

clean:
	rm -f *.o *.elf *.map

