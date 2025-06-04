#include "s21_strerror.h"

#include "s21_string.h"

char *s21_strerror(int errnum) {
  static char res[BUFF_SIZE];

#if defined(__APPLE__) || defined(__MACH__)
  if (errnum < 0 || errnum >= S21_ERRLIST_SIZE)

    s21_sprintf(res, "Unknown error: %d", errnum);
  else {
    s21_strncpy(res, s21_sys_errlist[errnum], BUFF_SIZE - 1);
    res[BUFF_SIZE - 1] = '\0';
  }
  return res;

#elif defined(__linux__)
  if (errnum < 0 || errnum >= S21_ERRLIST_SIZE)

    s21_sprintf(res, "Unknown error %d", errnum);
  else {
    s21_strncpy(res, s21_sys_errlist[errnum], BUFF_SIZE - 1);
    res[BUFF_SIZE - 1] = '\0';
  }

  return res;
#endif
}
