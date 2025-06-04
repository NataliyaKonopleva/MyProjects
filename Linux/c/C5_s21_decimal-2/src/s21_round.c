#include "s21_decimal.h"

int s21_round(s21_decimal value, s21_decimal *result) {
  RETURN_VALUE CODEERROR = OK;
  if (result == NULL || s21_validate_decimal(value))
    CODEERROR = CALCULATION_ERROR;
  if (!CODEERROR) {
    s21_big_decimal bigvalue_1 = {0};
    memset(result, 0, sizeof(s21_decimal));
    bigvalue_1 = s21_turn_decimal_to_big_decimal(value);
    s21_make_nulldecimal_positive(&bigvalue_1);
    while (bigvalue_1.power != 0) bigvalue_1 = s21_round_big(bigvalue_1);
    *result = s21_turn_big_decimal_to_decimal(bigvalue_1);
  }
  return CODEERROR;
}