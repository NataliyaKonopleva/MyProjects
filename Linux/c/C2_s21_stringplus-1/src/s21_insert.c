#include <string.h>

#include "s21_string.h"

void *s21_insert(const char *src, const char *str, s21_size_t start_index) {
  char *result = s21_NULL;
  s21_size_t src_len = 0;
  s21_size_t str_len = 0;
  if (src != s21_NULL) {
    src_len = s21_strlen(src);
  }
  if (str != s21_NULL) {
    str_len = s21_strlen(str);
  }
  if (src != s21_NULL && str != s21_NULL && (start_index <= src_len)) {
    result = calloc(src_len + str_len + 1, sizeof(char));
    if (result != s21_NULL) {
      const char *start_pointer = src + start_index;
      char *pointer = result;
      while (*src || *str) {
        if (src < start_pointer || !(*str)) {
          *pointer = *src;
          src++;
        } else {
          *pointer = *str;
          str++;
        }
        pointer++;
      }
    }
  }
  return result;
}