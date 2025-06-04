#include "s21_decimal.h"

int s21_truncate(s21_decimal value, s21_decimal *result) {
  RETURN_VALUE CODEERROR = OK;
  if (result == NULL || s21_validate_decimal(value))
    CODEERROR = CALCULATION_ERROR;
  if (!CODEERROR) {
    s21_big_decimal tendecimal = {0};
    tendecimal.bits[0] = 10;
    s21_big_decimal bigvalue_1 = {0};
    memset(result, 0, sizeof(s21_decimal));
    bigvalue_1 = s21_turn_decimal_to_big_decimal(value);
    for (int i = 0; i < value.power; i++)
      bigvalue_1 = s21_div_big(bigvalue_1, tendecimal, 1);
    *result = s21_turn_big_decimal_to_decimal(bigvalue_1);
  }
  return CODEERROR;
}