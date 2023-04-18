# Bootloader Example

This is an example of a simple bootloader that loads and executes a hello world program.

## Requirements

To build and run this example, you will need:

- A Linux computer
- GCC and Make
- QEMU

## Building the Code

To build the code, navigate to the project directory and run the following command:

```
make bootloader.bin
```

This will compile the bootloader and program code and generate a binary file called `bootloader.bin` and `bootloader.o`.

## Running the Code

To run the code, navigate to the project directory and run the following command:

```
make bootloader.bin/run
```

This will launch QEMU and execute the `bootloader.bin` file. You should see a message on the screen that says "Hello, World!".

## Cleaning Up

To clean up the project directory and remove any generated files, run the following command:

```
make clean
```
