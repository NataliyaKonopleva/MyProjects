#include "s21_decimal.h"

int s21_floor(s21_decimal value, s21_decimal *result) {
  RETURN_VALUE CODEERROR = OK;
  if (result == NULL || s21_validate_decimal(value))
    CODEERROR = CALCULATION_ERROR;
  if (!CODEERROR) {
    memset(result, 0, sizeof(s21_decimal));
    if (value.sign == 0)
      s21_truncate(value, *&result);
    else {
      s21_decimal tempresult = {0};
      s21_truncate(value, &tempresult);
      if (s21_is_greater(tempresult, value)) {
        s21_decimal minusonedecimal = {0};
        minusonedecimal.bits[0] = 1;
        minusonedecimal.sign = 1;
        s21_add(tempresult, minusonedecimal, *&result);
      } else
        *result = tempresult;
    }
  }
  return CODEERROR;
}