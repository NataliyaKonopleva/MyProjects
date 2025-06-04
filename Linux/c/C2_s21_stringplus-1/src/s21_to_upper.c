#include "s21_string.h"

char to_upper_char(char c);

void* s21_to_upper(const char* str) {
  char* upperStr = s21_NULL;
  if (str != s21_NULL) {
    s21_size_t len = s21_strlen(str);
    upperStr = s21_safe_malloc((len + 1) * sizeof(char));
    s21_strcpy(str, upperStr);
    for (s21_size_t i = 0; i < len; i++) {
      upperStr[i] = to_upper_char(upperStr[i]);
    }
  }
  return upperStr;
}

char to_upper_char(char c) {
  if (c > 96 && c < 123) {
    return c - 'a' + 'A';
  } else {
    return c;
  }
}