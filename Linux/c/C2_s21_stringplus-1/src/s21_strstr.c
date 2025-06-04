#include "s21_string.h"

char *s21_strstr(const char *haystack, const char *needle) {
  if (haystack == NULL || needle == NULL) return NULL;

  int hlen = 0;
  int nlen = 0;
  unsigned char *uhaystack = (unsigned char *)haystack;
  unsigned char *uneedle = (unsigned char *)needle;

  char *result = NULL;

  /* Вычисляем длину строк haystack и needle*/
  while (uhaystack[hlen] != '\0') {
    hlen++;
  }
  while (uneedle[nlen] != '\0') {
    nlen++;
  }

  /* Если строка needle пустая, возвращаем указатель на haystack*/
  if (nlen == 0) {
    result = (char *)uhaystack;
  } else {
    int i, j;
    int found;
    /* Ищем первое вхождение строки needle в строку haystack*/
    for (i = 0; i <= hlen - nlen; i++) {
      found = 1;
      for (j = 0; j < nlen; j++) {
        if (uhaystack[i + j] != uneedle[j]) {
          found = 0;
        }
      }
      if (found == 1) {
        result = (char *)&uhaystack[i];
        break;
      }
    }
  }
  return result;
}