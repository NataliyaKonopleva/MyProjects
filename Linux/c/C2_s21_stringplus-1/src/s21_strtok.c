#include "s21_string.h"

char *s21_strtok(char *str, const char *delim) {
  static char *nextToken = s21_NULL;
  if (str != s21_NULL) {
    nextToken = str;
  } else if (nextToken == s21_NULL) {
    return s21_NULL;
  }

  // Пропускаем начальные разделители
  while (*nextToken && s21_strchr(delim, *nextToken)) {
    nextToken++;
  }

  char *start = nextToken;

  if (*nextToken == '\0') {
    start = s21_NULL;
  }

  // Ищем конец токена
  while (*nextToken && !s21_strchr(delim, *nextToken)) {
    nextToken++;
  }

  // Завершаем токен нулевым символом и устанавливаем nextToken
  if (*nextToken) {
    *nextToken = '\0';
    nextToken++;
  } else {
    nextToken = s21_NULL;
  }

  return start;
}