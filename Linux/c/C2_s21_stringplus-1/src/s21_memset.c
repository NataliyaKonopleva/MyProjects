#include "s21_string.h"

void *s21_memset(void *destination, int c, s21_size_t n) {
  char *dest = (char *)destination;
  unsigned char z = c;
  for (s21_size_t i = 0; i < n; i++) {
    dest[i] = z;
  }
  return destination;
}