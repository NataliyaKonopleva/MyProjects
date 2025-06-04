#include "s21_string.h"

char *s21_strncpy(char *dest, const char *src, size_t n) {
  size_t srclen = s21_strlen(src);
  for (size_t i = 0; i < n; i++) {
    if (i < srclen)
      dest[i] = src[i];
    else
      dest[i] = '\0';
  }
  return dest;
}