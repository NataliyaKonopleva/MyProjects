#include "s21_string.h"

void *s21_memchr(const void *s, int c, s21_size_t n) {
  unsigned char *pointer = (unsigned char *)s;
  for (int i = 0; *pointer != (unsigned char)c && i < (int)n; i++, pointer++) {
  }
  return *pointer == (unsigned char)c ? (void *)pointer : s21_NULL;
}