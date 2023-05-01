# Bootloader Example

This is an example of a simple bootloader that loads and executes a hello world program.

# Challenge
a) Implement your own version of the hello world program in machine code.

b) Implement your own version of the hello world program in AT&T assembly.

c) Implement your own version of the hello world program in C.

## Requirements

To build and run this example, you will need:

- A Linux computer
- GCC and Make
- QEMU

## Building the Code && Running the Code

To run the code, navigate to the project directory and run the following command:

### Challenge a):
```
make hw-hex.bin/run
```
### Challenge b):
```
make hw-s.bin/run
```
### Challenge c):
```
make hw-c.bin/run
```

This will launch QEMU and execute the `hw*.bin` file. You should see a message on the screen that says "Hello, World!".

## Cleaning Up

To clean up the project directory and remove any generated files, run the following command:

```
make clean
```
