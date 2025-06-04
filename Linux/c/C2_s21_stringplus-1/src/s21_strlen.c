/* Вычисляет длину строки str, не включая завершающий нулевой символ.*/

#include "s21_string.h"

s21_size_t s21_strlen(const char *str) {
  s21_size_t str_length = 0;  //
  for (; str[str_length];) {
    str_length += 1;
  }
  return str_length;
}