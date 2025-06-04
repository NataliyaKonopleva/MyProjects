#include "s21_decimal.h"

int s21_negate(s21_decimal value, s21_decimal *result) {
  RETURN_VALUE CODEERROR = OK;
  if (result == NULL || s21_validate_decimal(value))
    CODEERROR = CALCULATION_ERROR;
  if (!CODEERROR) {
    memset(result, 0, sizeof(s21_decimal));
    *result = value;
    if (value.sign == 0)
      result->sign = 1;
    else if (value.sign == 1)
      result->sign = 0;
  }
  return CODEERROR;
}