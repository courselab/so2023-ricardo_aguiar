#ifndef EG_07_H
#define EG_07_H

/* Prints string pointed by s using BIOS' int 0x10 service. */

int __attribute__((fastcall, naked))  puts(const char* s);

#define printf(string) puts(string);

#endif