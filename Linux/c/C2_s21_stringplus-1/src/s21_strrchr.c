#include "s21_string.h"

char *s21_strrchr(const char *str, int c) {
  char *p = (char *)str;
  s21_size_t str_lenght = s21_strlen(str);

  // Ищем последнее вхождение символа в строке

  while (str_lenght > 0) {
    if (p[str_lenght] == c) {
      p = p + str_lenght;
      break;
    }
    str_lenght--;
  }
  if (str_lenght == 0 && *p != c) {
    p = s21_NULL;
  }

  return p;
}