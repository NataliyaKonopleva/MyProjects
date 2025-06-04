#include "s21_string.h"

char *s21_strchr(const char *str, int ch) {
  char *pointer = (char *)str;
  int len = s21_strlen(str);
  for (int i = 0; *pointer != (char)ch && i < len; i++, pointer++) {
  }
  return *pointer == (char)ch ? pointer : s21_NULL;
}