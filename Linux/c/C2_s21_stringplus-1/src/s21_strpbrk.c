/*Находит первый символ в строке str1, который соответствует любому символу, указанному в str2.*/

#include "s21_string.h" 

char *s21_strpbrk(const char *str1, const char *str2) {
  char *found_symbol = s21_NULL;

  for (s21_size_t i = 0; *(str1 + i) && !found_symbol; i++) {
    if (s21_strchr(str2, *(str1 + i)) != s21_NULL) {
      found_symbol = (char *)(str1 + i);
    }
  }

  return found_symbol;
}