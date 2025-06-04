#include "s21_string.h"

void *s21_trim(const char *src, const char *trim_chars) {
  char *processedstring = s21_NULL;
  if (src == NULL || trim_chars == NULL) {
  } else if (src[0] == '\0') {
    for (int i = 0;
         i < 50 && (processedstring = (char *)calloc(1, sizeof(char))) == NULL;i++)
      ;
    if (processedstring != NULL) processedstring[0] = '\0';
  } else if (trim_chars[0] == '\0')
    processedstring = s21_trim(src, " \t\n\r\f\v");
  else {
    int srclen = s21_strlen(src);
    int ptnlen = s21_strlen(trim_chars);
    for (int i = 0; i < 50 && (processedstring = (char *)calloc(
                                   srclen + 1, sizeof(char))) == NULL; i++)
      ;
    if (processedstring != NULL) {
      s21_memcpy(processedstring, src, srclen + 1);
      s21_trim_head(processedstring, srclen, ptnlen, trim_chars);
      s21_trim_tail(processedstring, srclen, ptnlen, trim_chars);
    }
  }
  return processedstring;
}

void s21_trim_head(char *processedstring, int srclen, int ptnlen,
                   const char *trim_chars) {
  int iscompassionfailed = 0;
  for (int j = 0; j <= ptnlen && iscompassionfailed != ptnlen;
       j++) { /*сравниваем первый символ, с символами паттерна*/

    if (processedstring[0] == trim_chars[j]) { /*сдвиг влево при совпадении*/
      for (int z = 0; z < srclen; z++) {
        processedstring[z] = processedstring[z + 1];
      }
      iscompassionfailed = 0;
      j = -1;
    } else
      iscompassionfailed++;
  }
}

void s21_trim_tail(char *processedstring, int srclen, int ptnlen,
                   const char *trim_chars) {
  int iscompassionfailed = 0;
  for (int i = srclen; !iscompassionfailed && i >= 0;
       i--) { /* бежим по символам основной строки*/
    int sucsess = 0;
    for (int j = 0; j <= ptnlen && !sucsess;
         j++) { /*сравниваем с символами паттерна*/
      if (processedstring[i] == trim_chars[j]) { /*если совпал, ставим символ
                                                    конца строки, бежим дальше*/
        processedstring[i] = '\0';
        iscompassionfailed = 0;
        sucsess = 1;
      } else
        iscompassionfailed++;
    }
  }
}