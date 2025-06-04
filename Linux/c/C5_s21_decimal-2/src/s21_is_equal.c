#include "s21_decimal.h"

int s21_is_equal(s21_decimal value_1, s21_decimal value_2) {
  s21_big_decimal bigvalue_1 = {0};
  s21_big_decimal bigvalue_2 = {0};
  bigvalue_1 = s21_turn_decimal_to_big_decimal(value_1);
  bigvalue_2 = s21_turn_decimal_to_big_decimal(value_2);
  s21_big_equalizer(&bigvalue_1, &bigvalue_2);
  return s21_is_equal_big(bigvalue_1, bigvalue_2);
}