#ifndef COMMON_FUNC_H
#define COMMON_FUNC_H

#include <stdio.h>

void* safe_malloc(const size_t size);
void* safe_realloc(void* ptr, size_t size);
FILE* f_open(const char* filename, const char* modes);
void print_invalid_option();

#endif