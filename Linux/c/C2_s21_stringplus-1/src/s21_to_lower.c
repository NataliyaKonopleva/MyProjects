#include "s21_string.h"

char to_lower_char(char c);

void* s21_to_lower(const char* str) {
  char* lowerStr = s21_NULL;
  if (str != s21_NULL) {
    s21_size_t len = s21_strlen(str);
    lowerStr = s21_safe_malloc((len + 1) * sizeof(char));
    s21_strcpy(str, lowerStr);
    for (s21_size_t i = 0; i < len; i++) {
      lowerStr[i] = to_lower_char(lowerStr[i]);
    }
  }
  return lowerStr;
}

char to_lower_char(char c) {
  if (c > 64 && c < 91) {
    return c + 'a' - 'A';
  } else {
    return c;
  }
}