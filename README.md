# How to compile and link this code into an ELF using the right tools for the MCU TM4c123g: 
1. Make sure to get the right compiler toolchain which can be found on the arm developer website(arm-none-eabi-gcc/objdump/etc.).
2. Get the header for the board. **The header(contains all the addresses for modifiable parameters of the board) may also be incompatible with the tm4c123gxl**
3. Make sure to have your Makefile(makes linking and compiling easier)properly configured with the right MARCH(machine architecture) which is the Cortex-M4 in this case.
4. Next, you need to make sure to write your startup code and linker script properly which is heavily dependent on the board that you're using so make sure you're 
mapping into the right memory address for the differenct sections. The startup code just has the vector table initialization and is the entry point for code execution.
5. Get OpenOCD(open on-chip debugger) and gdb-multiarch(possibly). OpenOCD will make it possible to attach your debugger to a host.
