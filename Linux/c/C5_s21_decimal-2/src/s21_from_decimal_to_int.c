#include "s21_decimal.h"

int s21_from_decimal_to_int(s21_decimal src, int *dst) {
  RETURN_VALUE CODEERROR = OK;
  if (dst == NULL || s21_validate_decimal(src)) CODEERROR = CONVERTATION_ERROR;
  if (!CODEERROR) {
    s21_truncate(src, &src);
    if (src.bits[1] == 0 && src.bits[2] == 0) {
      *dst = (src.sign) ? -src.bits[0] : src.bits[0];
    } else {
      CODEERROR = CONVERTATION_ERROR;
    }
  }
  return CODEERROR;
}