#include "s21_string.h"

int s21_strncmp(const char *str1, const char *str2, s21_size_t n) {
  int result = 0;
  s21_size_t str1_len = s21_strlen(str1);
  s21_size_t str2_len = s21_strlen(str2);
  if (n > str1_len && n > str2_len) {
    n = str1_len > str2_len ? str1_len : str2_len;
  }
  for (s21_size_t i = 0; i < n && result == 0; i++) {
    result = str1[i] - str2[i];
  }
  return result;
}