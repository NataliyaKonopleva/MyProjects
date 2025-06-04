#include "s21_decimal.h"

int s21_add(s21_decimal value_1, s21_decimal value_2, s21_decimal *result) {
  RETURN_VALUE CODEERROR = 0;
  if (result == NULL || s21_validate_decimal(value_1) ||
      s21_validate_decimal(value_2))
    CODEERROR = CALCULATION_ERROR;
  if (!CODEERROR) {
    s21_big_decimal bigvalue_1 = s21_turn_decimal_to_big_decimal(value_1);
    s21_big_decimal bigvalue_2 = s21_turn_decimal_to_big_decimal(value_2);
    s21_big_equalizer(&bigvalue_1, &bigvalue_2);
    s21_big_decimal tempresult = {0};
    tempresult = s21_add_big(bigvalue_1, bigvalue_2);
    CODEERROR = s21_big_normalizer(tempresult, &tempresult);
    if (!CODEERROR) {
      memset(result, 0, sizeof(s21_decimal));
      *result = s21_turn_big_decimal_to_decimal(tempresult);
    }
  }
  return CODEERROR;
}